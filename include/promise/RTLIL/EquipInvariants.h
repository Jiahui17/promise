#pragma once
#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"
#include "promise/Invariants.h"

/// \brief Adds a list of invariants to the POs of an RTLIL module
///
/// \param m: RTLIL module
/// \param invariants: a list of invariants to be proven / used for sequential
/// synthesis
/// \param trimOriginalOutputs: remove the original POs from the module
/// \param separateInvariants: separate invariant pins
void instrumentInvariants(RTLIL::Module *m,
                          const std::vector<LinearInvariant> &invariants,
                          bool trimOriginalOutputs = true,
                          bool separateInvariants = false);