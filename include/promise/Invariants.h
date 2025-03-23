#pragma once

#include <string>

#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"

#include <Eigen/Dense>

USING_YOSYS_NAMESPACE

/// \brief A LinearInvariant represents a linear equality/inequality.  In
/// general, a linear invariant can be:
/// - A linear equality: C_1 * x_1 + C_2 * x_2 + ... + C_N * x_n + const == 0;
/// - A Linear inequality: C_1 * x_1 + C_2 * x_2 + ... + C_N * x_n + const <= 0.
/// where C_* are integer coefficients, x_* are the variables.
///
/// \example A example of a linear invariant that a instance represents:
///     (!x_1) + 2 * x_2 + 3 == 0;
struct LinearInvariant {
  // The predicate symbols
  enum Predicate {
    EQUAL,
    LESS_THAN_OR_EQUAL,
  };

  Predicate predicate;

  /// \brief The constant term in the linear invariant.
  ///
  /// \example The constant term in the following linear invariant is 3:
  ///     x_1 + 2 * x_2 + 3 == 0;
  int constant;

  const std::map<Predicate, std::string> dumpPredicateMap = {
      {LinearInvariant::EQUAL, "=="},
      {LinearInvariant::LESS_THAN_OR_EQUAL, "<="},
  };

  /// \brief The constant coefficients (i.e., C_*) of the linear expression.
  std::vector<int> coefficients;

  /// \brief The variables (i.e., the x_*) in the linear expression. NOTE:
  /// Another option is to use "Wire *" instead of IdString. But that option
  /// requires additional rewriting of the invariant when we clone the module.
  std::vector<RTLIL::IdString> variables;

  /// \brief Is the variable negated. NOTE: the variables must be single-bit to
  /// be negated.  This is used to represent the negation of a variable in the
  /// linear invariant.
  ///
  /// \example: The following linear invariant has a negated variable x_1:
  ///     (!x_1) + 2 * x_2 + 3 == 0;
  /// Therefore, isNegated will be {true, false}
  std::vector<bool> isNegated;

  std::string dump() const;
};

/// \brief Generate a set of linear equalities from the given matrix.
///
/// \param module: The RTLIL module to which the signals belong.
/// \param matrix: Each column corresponds to a signal, and each row corresponds
/// to a state
/// \param signals: The list of signal names corresponding to the columns of the
/// matrix.
///
/// \return: A vector of LinearInvariant objects representing the linear
/// equalities
std::vector<LinearInvariant>
inferLinearEqualities(RTLIL::Module *module, const Eigen::MatrixXi &matrix,
                      const std::vector<RTLIL::IdString> &signals);

/// \brief Generate a set of linear inequalities from the given matrix.
///
/// \param module: The RTLIL module to which the signals belong.
/// \param matrix: Each column corresponds to a signal, and each row corresponds
/// to a state
/// \param signals: The list of signal names corresponding to the columns of the
/// matrix. NOTE: the signals must be single-bit signals.
///
/// \return: A vector of LinearInvariant objects representing the linear
/// equalities
std::vector<LinearInvariant> inferLinearInequalitiesViaConflictGraph(
    RTLIL::Module *module, const Eigen::MatrixXi &matrix,
    const std::vector<RTLIL::IdString> &signals);