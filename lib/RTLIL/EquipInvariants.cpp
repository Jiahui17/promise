#include "promise/RTLIL/EquipInvariants.h"
#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"
#include "promise/Invariants.h"

void zeroExtend(RTLIL::SigSpec &sig, int targetWidth) {
  int currentWidth = GetSize(sig);
  if (currentWidth >= targetWidth)
    sig.extract(0, targetWidth); // truncate if wider

  sig.append(RTLIL::SigSpec(RTLIL::State::S0, targetWidth - currentWidth));
}

SigSpec multiplyByConstant(RTLIL::Module *m, SigSpec sig, int intConst,
                           int targetWidth) {

  assert(intConst > 0);

  zeroExtend(sig, targetWidth);

  if (intConst == 1) {
    return sig;
  }

  RTLIL::Const constant(intConst, targetWidth);

  auto *mulOut = m->addWire(NEW_ID, targetWidth);

  m->addMul(NEW_ID, sig, SigSpec(constant), SigSpec(mulOut));

  return mulOut;
}

SigSpec getAdderChainOperand(RTLIL::Module *m, const SigSpec &w,
                             int coefficient, bool isNegated, int targetWidth) {

  SigSpec mulOperand;

  if (isNegated) {
    assert(w.size() == 1);
    auto *notOutput = m->addWire(NEW_ID, 1);
    m->addNot(NEW_ID, SigSpec(w), SigSpec(notOutput));
    mulOperand = notOutput;
  } else {
    mulOperand = w;
  }

  return multiplyByConstant(m, mulOperand, coefficient, targetWidth);
}

SigSpec createAdderChain(RTLIL::Module *m, const std::vector<SigSpec> &sigs,
                         const std::vector<int> &coeffs,
                         const std::vector<bool> &isNegated) {
  assert(sigs.size() == coeffs.size());
  assert(isNegated.size() == coeffs.size());
  // If there is no inputs, we return a nullptr and let the upper level to
  // create a constant zero signal (the bitwidth depends on the other side).
  if (sigs.empty()) {
    return SigSpec(RTLIL::Const(0, /*width = */ 1));
  }

  if (sigs.size() == 1) {
    return sigs[0];
  }

  // Calculate the width of the signals
  int maxWidth = 0;
  for (size_t i = 0; i < sigs.size(); i++) {
    // The width of var * coeff is width(var) + width(coeff)
    int termWidth = sigs[i].size() + ceil_log2(coeffs[i] + 1);
    maxWidth = termWidth > maxWidth ? termWidth : maxWidth;
  }
  assert(maxWidth > 0);

  // TODO: Maybe this can be shorter
  int totalBits = maxWidth + ceil_log2(sigs.size());

  assert(sigs.size() > 1);

  // Suppose we want to add A * a + B * b + C * c:
  // - `adderChainOperands` holds {A * a, B * b, C * c}
  // - `adderOutputs` holds {"first output (A * a + B * b)", ...}
  std::vector<SigSpec> chainOperands;
  std::vector<SigSpec> chainOuts;

  for (size_t i = 0; i < sigs.size(); i++) {
    SigSpec w =
        getAdderChainOperand(m, sigs[i], coeffs[i], isNegated[i], totalBits);
    chainOperands.push_back(w);
    if (i < sigs.size() - 1) {
      RTLIL::Wire *addOut = m->addWire(NEW_ID, totalBits);
      chainOuts.emplace_back(addOut);
    }
  }

  // Adder for the first two operands:
  m->addAdd(NEW_ID, chainOperands[0], chainOperands[1], chainOuts[0]);

  for (size_t i = 1;
       /*number of adders in a naive adder chain*/ i < sigs.size() - 1; ++i) {
    assert(i + 1 < sigs.size());
    m->addAdd(NEW_ID, chainOuts[i - 1], chainOperands[i + 1], chainOuts[i]);
  }

  return chainOuts[/* the last output = */ chainOuts.size() - 1];
}

// Instrument the module with a linear invariant, and return the pin
//
// Convention: output = 1 means good, output = 0 mean bad (opposite from ABC
// convention, but more intuitive).
SigSpec instrumentSingleInvariant(RTLIL::Module *m, const LinearInvariant &inv,
                                  const std::string &name) {

  assert(inv.coefficients.size() == inv.variables.size() &&
         inv.coefficients.size() == inv.isNegated.size() &&
         "The variable is ill-formed!");

  std::vector<SigSpec> lhsSignals, rhsSignals;
  std::vector<int> lhsCoeffs, rhsCoeffs;
  std::vector<bool> lhsIsNegated, rhsIsNegated;

  // Dispatch the coefficients and variables into LHS and RHS depending on their
  // signs (so invariants only need to do unsigned arithmetic).
  for (size_t i = 0; i < inv.variables.size(); ++i) {
    if (inv.coefficients[i] > 0) {
      lhsSignals.emplace_back(m->wire(inv.variables[i]));
      lhsCoeffs.push_back(inv.coefficients[i]);
      lhsIsNegated.push_back(inv.isNegated[i]);
    } else if (inv.coefficients[i] < 0) {
      rhsSignals.emplace_back(m->wire(inv.variables[i]));
      rhsCoeffs.push_back(-inv.coefficients[i]);
      rhsIsNegated.push_back(inv.isNegated[i]);
    }
  }

  // Place the constant term into LHS or RHS depending on the sign.
  if (inv.constant > 0) {
    lhsSignals.emplace_back(Const(inv.constant, ceil_log2(inv.constant + 1)));
    lhsCoeffs.push_back(1);
    lhsIsNegated.push_back(false);
  } else if (inv.constant < 0) {
    rhsSignals.emplace_back(Const(-inv.constant, ceil_log2(-inv.constant + 1)));
    rhsCoeffs.push_back(1);
    rhsIsNegated.push_back(false);
  }

  // Adder chains summing the terms in LHS and RHS
  SigSpec lhsSum = createAdderChain(m, lhsSignals, lhsCoeffs, lhsIsNegated);
  SigSpec rhsSum = createAdderChain(m, rhsSignals, rhsCoeffs, rhsIsNegated);

  // Resize both sides to maximum width to avoid comparing two signals with
  // different widths (the Verilator will also throw a warning on this).
  int maxWidth = max(lhsSum.size(), rhsSum.size());
  zeroExtend(lhsSum, maxWidth);
  zeroExtend(rhsSum, maxWidth);

  RTLIL::Wire *invLogicConeOutput = m->addWire(RTLIL::escape_id(name));

  if (inv.predicate == LinearInvariant::EQUAL) {
    m->addEq(NEW_ID, lhsSum, rhsSum, SigSpec(invLogicConeOutput));
  } else if (inv.predicate == LinearInvariant::LESS_THAN_OR_EQUAL) {
    m->addLe(NEW_ID, lhsSum, rhsSum, SigSpec(invLogicConeOutput));
  }
  return invLogicConeOutput;
}

void instrumentInvariants(RTLIL::Module *m,
                          const std::vector<LinearInvariant> &invariants,
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
