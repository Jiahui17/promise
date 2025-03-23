#include "promise/Invariants.h"
#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"
#include "promise/LinearAlgebra.h"
#include <boost/graph/adjacency_list.hpp>
#include <cstddef>

#include <Eigen/Dense>
#include <Eigen/src/Core/ArithmeticSequence.h>
#include <Eigen/src/Core/Matrix.h>
#include <Eigen/src/Core/MatrixBase.h>

#include <boost/graph/sequential_vertex_coloring.hpp>
#include <boost/range/combine.hpp>
#include <boost/range/detail/combine_cxx11.hpp>

#include <iostream>
#include <map>
#include <string>
#include <sys/wait.h>

using Graph =
    boost::adjacency_list<boost::vecS, boost::vecS, boost::undirectedS>;
using Vertex = boost::graph_traits<Graph>::vertex_descriptor;
using Vertex_size_t = boost::graph_traits<Graph>::vertices_size_type;
using vertex_index_map =
    boost::property_map<Graph, boost::vertex_index_t>::const_type;

std::string LinearInvariant::dump() const {
  std::stringstream ss;

  assert(variables.size() == coefficients.size());
  assert(variables.size() == isNegated.size());
  for (auto [w, c, n] : boost::combine(variables, coefficients, isNegated)) {
    if (c > 0) {
      if (c > 1)
        ss << c << "*";
      if (n) {
        ss << "(! " << log_id(w) << ")";
      } else {
        ss << log_id(w);
      }
      ss << "+ ";
    }
  }
  if (constant > 0) {
    ss << " " << constant;
  } else {
    ss << " 0";
  }

  ss << dumpPredicateMap.at(predicate);
  for (auto [w, c, n] : boost::combine(variables, coefficients, isNegated)) {
    if (c < 0) {
      if (c < -1) {
        ss << -c << "*";
      }
      if (n) {
        ss << "(! " << log_id(w) << ")";
      } else {
        ss << log_id(w);
      }
      ss << "+ ";
    }
  }
  if (constant < 0) {
    ss << " " << -constant;
  } else {
    ss << " 0";
  }
  return ss.str();
}

std::vector<LinearInvariant>
inferLinearEqualities(RTLIL::Module *module, const Eigen::MatrixXi &matrix,
                      const std::vector<RTLIL::IdString> &signals) {

  // We also want to infer the constant term: to do this, we append a constant
  // one column to the right side of the matrix.
  Eigen::VectorXi const1 = Eigen::VectorXi::Ones(matrix.rows());
  Eigen::MatrixXi matrixWithConst1(matrix.rows(), matrix.cols() + 1);
  matrixWithConst1 << matrix, const1;

  std::vector<Eigen::VectorXi> basis =
      computeBasisOfNullSpace(matrixWithConst1);

  // Write basis vectors.
  // Format:
  // - The first row is the header with signal names.
  // - Each subsequent row corresponds to a basis vector, with values
  // separated by commas.
  // To recover the equalities: Each row represents a linear equality of the
  // form: a1 * x1 + a2 * x2 + ... + an * xn = 0 where a1, a2, ..., an are the
  // coefficients from the basis vector and x1, x2, ..., xn are the signal
  // names.
  std::vector<LinearInvariant> invariants;
  for (const auto &vec : basis) {

    LinearInvariant inv;
    inv.constant = vec(/*last element in the basis vector*/ signals.size());
    inv.predicate = LinearInvariant::EQUAL;
    for (size_t i = 0; i < signals.size(); ++i) {
      // Check if the wire exists in the module
      assert(module->wire(signals[i]) &&
             "The signal identifier doesn't correspond to any signals!");

      if (vec(i) != 0) {
        inv.variables.emplace_back(signals[i]);
        inv.coefficients.emplace_back(vec(i));
        inv.isNegated.emplace_back(false);
      }
    }
    if (!inv.variables.empty()) {
      invariants.push_back(inv);
    }
  }
  return invariants;
}

std::vector<LinearInvariant> inferLinearInequalitiesViaConflictGraph(
    RTLIL::Module *module, const Eigen::MatrixXi &matrix,
    const std::vector<RTLIL::IdString> &signals) {

  if (static_cast<std::size_t>(matrix.cols()) != signals.size()) {
    throw std::runtime_error("The number of columns do not match the signals");
  }

  // We add one node for each signal and its completment
  size_t offset = signals.size();
  Graph signalConflictGraph(offset * 2);

  // Append the signals with their complements

  using WireWithIsNegatedType = std::pair<IdString, /*isNegated=*/bool>;

  std::vector<WireWithIsNegatedType> sigNameWithIsNegated;
  sigNameWithIsNegated.reserve(signals.size() * 2);

  for (const auto &sig : signals) {
    assert(module->wire(sig) && module->wire(sig)->width == 1);
    sigNameWithIsNegated.emplace_back(sig, false);
  }
  for (const auto &sig : signals) {
    sigNameWithIsNegated.emplace_back(sig, true);
  }

  for (size_t i = 0; i < offset; i++) {
    // Each signal and its complement must have different colors (to
    // eliminate trivial relations like a + ~a <= 1).
    boost::add_edge(i, i + offset, signalConflictGraph);
  }

  Eigen::MatrixXi matrixConcat(matrix.rows(), offset * 2);

  auto matrixNegate = 1 - matrix.array();

  matrixConcat << matrix, matrixNegate;

  for (size_t sigI = 0; sigI < 2 * offset; ++sigI) {
    for (size_t sigJ = sigI + 1; sigJ < 2 * offset; ++sigJ) {
      Eigen::VectorXi sumCol = matrixConcat.col(sigI) + matrixConcat.col(sigJ);
      if (!((sumCol.array() <= 1).all())) {
        boost::add_edge(sigI, sigJ, signalConflictGraph);
      }
    }
  }

  std::vector<size_t> colorVec(boost::num_vertices(signalConflictGraph), 0);
  auto indexMap = boost::get(boost::vertex_index, signalConflictGraph);
  auto colorMap = make_safe_iterator_property_map(colorVec.begin(),
                                                  colorVec.size(), indexMap);
  auto numColors =
      boost::sequential_vertex_coloring(signalConflictGraph, colorMap);

  std::vector<std::vector<size_t>> nodesPerColor(numColors);

  // Group vertices by their color
  for (size_t v = 0; v < colorVec.size(); ++v) {
    size_t c = colorVec[v];
    nodesPerColor[c].push_back(v);
  }

  std::vector<LinearInvariant> invariants;
  // Print nodes per color

  for (const auto &compatibleSignals : nodesPerColor) {
    if (compatibleSignals.size() > 1) {
      LinearInvariant inv;
      inv.constant = -1;
      inv.predicate = LinearInvariant::LESS_THAN_OR_EQUAL;
      for (size_t id : compatibleSignals) {
        auto [wire, isNegated] = sigNameWithIsNegated[id];
        inv.variables.push_back(wire);
        inv.coefficients.push_back(1);
        inv.isNegated.push_back(isNegated);
      }
      invariants.push_back(inv);
    }
  }
  return invariants;
}
