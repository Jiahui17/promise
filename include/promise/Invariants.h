#pragma once

#include <string>

#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"

#include <Eigen/Dense>
#include <utility>
#include <variant>

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
  enum OpType {
    // Integer types
    ADD,
    MUL,

    // Logical ones
    IMPLIES,

    // Any types
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

/// \brief: A container class for adding various sanity checking on the AST
struct Invariant {
  std::shared_ptr<PropAst> ast;
  Invariant(std::shared_ptr<PropAst> ast) : ast(std::move(ast)){};

  /// \brief: A wrapper struct for dumping the AST as a string
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
      ss << "(" << visit(n.lhs) << " " << tyToStr.at(n.op) << " "
         << visit(n.rhs) << ")";
      return ss.str();
    }

    std::string operator()(const UnaryOp &n) const {
      const std::map<UnaryOp::OpType, string> tyToStr = {
          {UnaryOp::LNOT, "!"},
      };
      assert(tyToStr.count(n.op) > 0 && "Unknown unary operator!");
      return "(" + tyToStr.at(n.op) + visit(n.arg) + ")";
    }

    std::string visit(const std::shared_ptr<PropAst> &n) const {
      // Remark for future visitors: this method complains if not all variant
      // was implemented.
      return std::visit(*this, *n);
    }
  };

  struct CalculateDegreeVisitor {
    unsigned operator()(int) const { return 0; }
    unsigned operator()(const RTLIL::IdString &) const { return 1; }
    unsigned operator()(const UnaryOp &n) const {
      assert(n.op == UnaryOp::LNOT);
      return visit(n.arg);
    }
    unsigned operator()(const BinaryOp &n) const {
      if (n.op == BinaryOp::ADD || n.op == BinaryOp::LE ||
          n.op == BinaryOp::EQ) {
        return max(visit(n.lhs), visit(n.rhs));
      }
      if (n.op == BinaryOp::MUL) {
        return visit(n.lhs) + visit(n.rhs);
      }
      assert(false && "Invalid operation type for calculating the degree");
    }
    unsigned visit(const std::shared_ptr<PropAst> &n) const {
      // Remark for future visitors: this method complains if not all variant
      // was implemented.
      return std::visit(*this, *n);
    }
  };

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