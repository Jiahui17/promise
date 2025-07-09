#pragma once

#include <string>

#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"

#include <Eigen/Dense>
#include <utility>
#include <variant>

USING_YOSYS_NAMESPACE

// Forward declaration
struct AddOp;
struct MulOp;
struct ImpliesOp;
struct LeOp;
struct EqOp;

struct LNotOp;

/// \brief: A type union for representing an arbitrary formula.
///
/// \example: "((3 * (a * b)) + (a -> c) <= 0)"
using PropAst = std::variant<int, Yosys::RTLIL::IdString, AddOp, MulOp,
                             ImpliesOp, LeOp, EqOp, LNotOp>;

/// \brief: Syntax sugar for std::make_shared<PropAst>(...)
inline std::shared_ptr<PropAst> mkAst(const PropAst &n) {
  return std::make_shared<PropAst>(n);
}

// helper type for the visitor #4
template <class... Ts>
struct Overloaded : Ts... {
  using Ts::operator()...;
};
// explicit deduction guide (not needed as of C++20)
template <class... Ts>
Overloaded(Ts...) -> Overloaded<Ts...>;

/// \brief: Represent binary operators.
///   Notable other alternatives: inherit
///   struct MulOp : BinaryOp {...}; This makes updating the visitor logic
///   complicated (a separate operator()(Ty...)) for each new derived type.
///
/// \example: "+" (ADD), "<=" (LE)
struct BinaryOp {
  std::shared_ptr<PropAst> lhs;
  std::shared_ptr<PropAst> rhs;

  BinaryOp(std::shared_ptr<PropAst> lhs, std::shared_ptr<PropAst> rhs)
      : lhs(std::move(lhs)), rhs(std::move(rhs)){};
};

/// \brief: Represent unary operators
///
/// \example: "!" (logical not), "~" (word-level negation), "AG" (an unary
/// temporal operator).
struct UnaryOp {
  std::shared_ptr<PropAst> arg;
  UnaryOp(std::shared_ptr<PropAst> arg) : arg(std::move(arg)){};
};

struct AddOp : BinaryOp {
  using BinaryOp::BinaryOp;
};
struct MulOp : BinaryOp {
  using BinaryOp::BinaryOp;
};
struct ImpliesOp : BinaryOp {
  using BinaryOp::BinaryOp;
};
struct LeOp : BinaryOp {
  using BinaryOp::BinaryOp;
};
struct EqOp : BinaryOp {
  using BinaryOp::BinaryOp;
};

struct LNotOp : UnaryOp {
  using UnaryOp::UnaryOp;
};

/// \brief: A visitor class that calculates the polynomial degree of a property
/// AST. We use this to check if the invariant is linear.
///
/// \example: Consider an invariant ast ((a * b) + (c * d * e) + 1) <= 5; by
/// Creating an visitor CalculateDegreeVisitor visitor, visitor.visit(ast)
/// returns 3.
struct CalculateDegreeVisitor {
  template <typename T>
  unsigned operator()(T &&n) const {
    // Since we pass n by reference, we need to remove the reference from the
    // type. std::decay_t<T> does the job.
    // https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2006/n2069.html
    // https://stackoverflow.com/a/25732639
    using BaseType = std::decay_t<T>;
    if constexpr (std::is_same_v<BaseType, AddOp> ||
                  std::is_same_v<BaseType, ImpliesOp> ||
                  std::is_same_v<BaseType, LeOp> ||
                  std::is_same_v<BaseType, EqOp>) {
      return max(visit(n.lhs), visit(n.rhs));
    } else if constexpr (std::is_same_v<BaseType, MulOp>) {
      return visit(n.lhs) + visit(n.rhs);
    } else if constexpr (std::is_same_v<BaseType, LNotOp>) {
      return visit(n.arg);
    } else if constexpr (std::is_same_v<BaseType, int>) {
      return 0;
    } else if constexpr (std::is_same_v<BaseType, RTLIL::IdString>) {
      return 1;
    } else {
      assert(false && "This branch should not be reachable!");
    }
  }
  unsigned visit(const std::shared_ptr<PropAst> &n) const {
    // Remark for future visitors: this method complains if not all variant
    // was implemented.
    return std::visit(*this, *n);
  }
};

/// \brief: A wrapper struct for dumping the AST as a string
struct PrintVisitor {
  std::string operator()(const int &n) const { return std::to_string(n); }
  std::string operator()(const RTLIL::IdString &n) const { return log_id(n); }

  std::string operator()(const AddOp &n) const {
    std::stringstream ss;
    ss << "(" << visit(n.lhs) << " + " << visit(n.rhs) << ")";
    return ss.str();
  }

  std::string operator()(const MulOp &n) const {
    std::stringstream ss;
    ss << "(" << visit(n.lhs) << " * " << visit(n.rhs) << ")";
    return ss.str();
  }

  std::string operator()(const ImpliesOp &n) const {
    std::stringstream ss;
    ss << "(" << visit(n.lhs) << " -> " << visit(n.rhs) << ")";
    return ss.str();
  }

  std::string operator()(const LeOp &n) const {
    std::stringstream ss;
    ss << "(" << visit(n.lhs) << " <= " << visit(n.rhs) << ")";
    return ss.str();
  }

  std::string operator()(const EqOp &n) const {
    std::stringstream ss;
    ss << "(" << visit(n.lhs) << " == " << visit(n.rhs) << ")";
    return ss.str();
  }

  std::string operator()(const LNotOp &n) const {
    return "(!" + visit(n.arg) + ")";
  }

  std::string visit(const std::shared_ptr<PropAst> &n) const {
    // Remark for future visitors: this method complains if not all variant
    // was implemented.
    return std::visit(*this, *n);
  }
};

/// \brief: A container class for adding various sanity checking on the AST
struct Invariant {
  std::shared_ptr<PropAst> ast;
  Invariant(std::shared_ptr<PropAst> ast) : ast(std::move(ast)){};

  std::string toString() const {
    PrintVisitor visitor;
    return visitor.visit(ast);
  }

  // Sanity checks
  bool isLinearInvariant() const {
    auto visitor = CalculateDegreeVisitor();
    return visitor.visit(ast) <= 1;
  };
};

/// \brief Generate a set of linear equalities from the given matrix.
///
/// \param module: The RTLIL module to which the signals belong.
/// \param matrix: Each column corresponds to a signal, and each row corresponds
/// to a state
/// \param signals: The list of signal names corresponding to the columns of the
/// matrix.
///
/// \return: A vector of "Invariant" objects representing the linear
/// equalities
std::vector<Invariant>
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
/// \return: A vector of "Invariant" objects representing the linear
/// equalities
std::vector<Invariant> inferLinearInequalitiesViaConflictGraph(
    RTLIL::Module *module, const Eigen::MatrixXi &matrix,
    const std::vector<RTLIL::IdString> &signals);