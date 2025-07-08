#pragma once

#include <string>

#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"

#include <Eigen/Dense>
#include <utility>

USING_YOSYS_NAMESPACE

// Forward declaration
struct UnaryOp;
struct BinaryOp;

/// \brief: A type union for representing an arbitrary formula.
///
/// \example: "((3 * (a * b)) + (a -> c) <= 0)"
using PropAst = std::variant<int, Yosys::RTLIL::IdString, UnaryOp, BinaryOp>;

/// \brief: Syntax sugar for std::make_shared<PropAst>(...)
inline std::shared_ptr<PropAst> mkAst(const PropAst &n) {
  return std::make_shared<PropAst>(n);
}

/// \brief: Represent unary operators
///
/// \example: "!" (logical not), "~" (word-level negation), "AG" (an unary
/// temporal operator).
struct UnaryOp {
  enum OpType {
    LNOT,
  };
  OpType op;
  std::shared_ptr<PropAst> arg;
  UnaryOp(OpType op, std::shared_ptr<PropAst> arg)
      : op(op), arg(std::move(arg)){};
};

/// \brief: Represent binary operators
///
/// \example: "+" (ADD), "<=" (LE)
struct BinaryOp {
  enum OpType {
    ADD,
    MUL,
    IMPLIES,
    LE,
    EQ,
  };
  OpType op;
  std::shared_ptr<PropAst> lhs;
  std::shared_ptr<PropAst> rhs;

  BinaryOp(OpType op, std::shared_ptr<PropAst> lhs,
           std::shared_ptr<PropAst> rhs)
      : op(op), lhs(std::move(lhs)), rhs(std::move(rhs)){};
};

/// A wrapper struct for dumping the AST as a string
struct PrintVisitor {

  std::string operator()(const int &n) const { return std::to_string(n); }
  std::string operator()(const RTLIL::IdString &n) const { return log_id(n); }

  std::string operator()(const BinaryOp &n) const {
    const std::map<BinaryOp::OpType, string> tyToStr = {
        {BinaryOp::ADD, "+"}, {BinaryOp::MUL, "*"}, {BinaryOp::IMPLIES, "->"},
        {BinaryOp::LE, "<="}, {BinaryOp::EQ, "=="},
    };
    assert(tyToStr.count(n.op) > 0 && "Unknown binary operator!");
    std::stringstream ss;
    ss << "(" << visit(n.lhs) << " " << tyToStr.at(n.op) << " " << visit(n.rhs)
       << ")";
    return ss.str();
  }

  std::string operator()(const UnaryOp &n) const {
    const std::map<UnaryOp::OpType, string> tyToStr = {
        {UnaryOp::LNOT, "!"},
    };
    assert(tyToStr.count(n.op) > 0 && "Unknown unary operator!");
    return tyToStr.at(n.op) + " " + visit(n.arg);
  }

  std::string visit(const std::shared_ptr<PropAst> &n) const {
    // Remark for future visitors: this method complains if not all variant was
    // implemented.
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
};

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