#include "promise/RTLIL/EquipInvariants.h"
#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"
#include "promise/Invariants.h"
#include <csignal>
#include <stdexcept>

void zeroExtend(RTLIL::SigSpec &sig, int targetWidth) {
  int currentWidth = GetSize(sig);
  if (currentWidth >= targetWidth)
    sig.extract(0, targetWidth); // truncate if wider

  sig.append(RTLIL::SigSpec(RTLIL::State::S0, targetWidth - currentWidth));
}

struct InstantiateInvariantVisitor {

  RTLIL::Module *module;

  SigSpec operator()(const int &n) const {
    assert(n >= 0 && "This method assumes that we do unsigned arithmetic.");
    return SigSpec(RTLIL::Const(n, ceil_log2(1 + n)));
  };

  SigSpec operator()(const RTLIL::IdString &n) const {
    assert(module->wire(n) && "n is not a wire in the module!");
    return SigSpec(module->wire(n));
  }

  SigSpec operator()(const UnaryOp &n) const {
    auto arg = visit(n.arg);

    // Create the unary operator according to the type.
    if (n.op == UnaryOp::LNOT) {
      assert(arg.size() == 1 &&
             "Attempting to instantiate a logical NOT on a word!");
      RTLIL::Wire *output = module->addWire(NEW_ID, 1);
      module->addNot(NEW_ID, arg, SigSpec(output));
      return SigSpec(output);
    }
    assert(false && "Undefined operator type!");
  }

  SigSpec operator()(const BinaryOp &n) const {
    auto lhs = visit(n.lhs);
    auto rhs = visit(n.rhs);

    if (n.op == BinaryOp::ADD) {
      unsigned width = max(lhs.size(), rhs.size());
      zeroExtend(lhs, width);
      zeroExtend(rhs, width);
      RTLIL::Wire *output = module->addWire(NEW_ID, width + 1);
      module->addAdd(NEW_ID, lhs, rhs, SigSpec(output));
      return SigSpec(output);
    }

    if (n.op == BinaryOp::MUL) {
      /// \TODO: Multiply by an one-bit number can be replaced by AND.
      RTLIL::Wire *output = module->addWire(NEW_ID, lhs.size() + rhs.size());
      module->addMul(NEW_ID, lhs, rhs, SigSpec(output));
      return SigSpec(output);
    }

    if (n.op == BinaryOp::LE) {
      unsigned width = max(lhs.size(), rhs.size());
      zeroExtend(lhs, width);
      zeroExtend(rhs, width);
      RTLIL::Wire *output = module->addWire(NEW_ID, 1);
      module->addLe(NEW_ID, lhs, rhs, SigSpec(output));
      return SigSpec(output);
    }

    if (n.op == BinaryOp::EQ) {
      unsigned width = max(lhs.size(), rhs.size());
      zeroExtend(lhs, width);
      zeroExtend(rhs, width);
      RTLIL::Wire *output = module->addWire(NEW_ID, 1);
      module->addEq(NEW_ID, lhs, rhs, SigSpec(output));
      return SigSpec(output);
    }

    assert(false && "No implementation for operation type!");
  }

  SigSpec visit(const std::shared_ptr<PropAst> &n) const {
    // Remark for future visitors: this method complains if not all variant was
    // implemented.
    return std::visit(*this, *n);
  }
};

// Instrument the module with a linear invariant, and return the pin
//
// Convention: output = 1 means good, output = 0 mean bad (opposite from ABC
// convention, but more intuitive).
SigSpec instrumentSingleInvariant(RTLIL::Module *m, const Invariant &inv,
                                  const std::string &name) {

  InstantiateInvariantVisitor visitor{m};
  auto invLogicOutput = visitor.visit(inv.ast);
  m->rename(invLogicOutput.as_wire(), RTLIL::escape_id(name));
  return invLogicOutput;
}

void instrumentInvariants(RTLIL::Module *m,
                          const std::vector<Invariant> &invariants,
                          bool trimOriginalOutputs, bool separateInvariants) {

  RTLIL::SigSpec invPins;
  for (size_t invId = 0; invId < invariants.size(); invId++) {
    RTLIL::SigSpec sig = instrumentSingleInvariant(
        m, invariants[invId], "inv_" + std::to_string(invId));
    invPins.append(sig);
  }

  if (trimOriginalOutputs) {
    for (auto *wire : m->wires()) {
      wire->port_output = false;
    }
  }

  if (separateInvariants) {
    RTLIL::Wire *propertyPin =
        m->addWire(RTLIL::escape_id("property_pin"), invPins.size());
    // bit-wise invert all the invariant pins, and declare it as PO
    m->addNot(NEW_ID, invPins, propertyPin);
    propertyPin->port_output = true;
  } else {
    RTLIL::Wire *invertedPropertyPin = m->addWire(NEW_ID, 1);
    m->addReduceAnd(NEW_ID, invPins, SigSpec(invertedPropertyPin));
    RTLIL::Wire *propertyPin = m->addWire(RTLIL::escape_id("property_pin"), 1);
    m->addNot(NEW_ID, SigSpec(invertedPropertyPin), SigSpec(propertyPin));
    propertyPin->port_output = true;
  }

  m->fixup_ports();
  m->sort();
}
