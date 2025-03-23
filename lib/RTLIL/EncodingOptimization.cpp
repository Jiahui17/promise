#include <algorithm>
#include <bitset>
#include <csignal>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>

#include "kernel/ff.h"
#include "kernel/ffinit.h"
#include "kernel/rtlil.h"
#include "kernel/sigtools.h"
#include "kernel/yosys.h"
#include "kernel/yosys_common.h"

#include "promise/Invariants.h"
#include "promise/RTLIL/EncodingOptimization.h"
#include "promise/RTLIL/RTLILUtils.h"

#include <boost/dynamic_bitset_fwd.hpp>

USING_YOSYS_NAMESPACE

// Returns a new identifier for generated FFs everytime is function is called.
RTLIL::IdString newFFIdstring() {
  static int globalRegIdentifier = 0;
  return RTLIL::escape_id("enc_ff_" + std::to_string(globalRegIdentifier++));
}

using SetOfMinTerms = std::vector<boost::dynamic_bitset<>>;

// Create a SOP cone from the on set
void createSOPConeFromOnSet(RTLIL::Module *m,
                            std::vector<RTLIL::SigSpec> inputs,
                            const RTLIL::SigSpec &output,
                            const SetOfMinTerms &onSet) {
  // Create an encoding function in SOP form
  SigSpec andOuts;
  for (auto cube : onSet) {
    assert(cube.size() == inputs.size());
    auto *andOut = m->addWire(NEW_ID, 1);
    SigSpec andIns;
    for (size_t pos = 0; pos < cube.size(); ++pos) {
      auto lit = cube[pos];
      if (/* lit = 0: negate the signal*/ !lit) {
        auto *neg = m->addWire(NEW_ID, 1);
        m->addNot(NEW_ID, inputs[pos], SigSpec(neg));
        andIns.append(neg);
      } else {
        andIns.append(inputs[pos]);
      }
    }
    m->addReduceAnd(NEW_ID, andIns, SigSpec(andOut));
    andOuts.append(andOut);
  }
  m->addReduceOr(NEW_ID, andOuts, output);
}

// Using a state mapping table to transform the encoding of the circuit.  The
// number of bits in the original state should match the number of ff cells.
// The number of bits in the encoded states should match the "initalState".
struct EncodingOptConfig {
  // Set of FFs to be optimized:
  std::vector<RTLIL::Cell *> ffs;
  // The state mapping table for this set of FFs
  StateMappingTable tbl;
  // The initial state of the optimized FFs:
  boost::dynamic_bitset<> initialState;

  EncodingOptConfig(const std::vector<RTLIL::Cell *> &ffs,
                    const boost::dynamic_bitset<> &initialState,
                    const StateMappingTable &tbl) {
    assert(initialState.size() == tbl.encodedBitWidth &&
           "The initial bits must match the number of FFs to be created!");
    assert(ffs.size() == tbl.originalBitWidth);
    this->ffs = ffs;
    this->initialState = initialState;
    this->tbl = tbl;
  }
};

void mergeMutexFFs(RTLIL::Module *module, const EncodingOptConfig &config) {

  // TODO: we need a more proper way to identify the clock signal...
  SigSpec clk = SigSpec(module->wire(RTLIL::escape_id("clk")));

  std::vector<SigSpec> originalFFInputs;
  std::vector<SigSpec> originalFFOutputs;

  assert(config.tbl.encodedBitWidth > 0);
  boost::dynamic_bitset<> originalInitialState;
  for (auto *ff : config.ffs) {
    assert(ff->type.in("$_DFF_P_") &&
           "Promise currently only supports encoding optimization for simple "
           "FF types.");

    auto ffOutput = ff->getPort(ID::Q);
    auto ffInput = ff->getPort(ID::D);

    originalFFInputs.push_back(ffInput);
    originalFFOutputs.push_back(ffOutput);

    // Extract the initial values
    auto *wire = ffOutput.as_wire();

    if (!wire->attributes.count(ID::init)) {
      throw std::runtime_error(
          "Promise cannot handle FF without a proper initial value!");
    }

    Const initval = wire->attributes.at(ID::init);
    if (initval == State::S0) {
      originalInitialState.append(0);
    } else if (initval == State::S1) {
      originalInitialState.append(1);
    } else {
      throw std::runtime_error(
          "Promise cannot handle FF without a proper initial value!");
    }

    // The FF can be removed
    module->remove(ff);
  }

  boost::dynamic_bitset<> optimizedInitialState;
  for (auto [ori, enc] : config.tbl.tblEntries) {
    if (ori == originalInitialState)
      optimizedInitialState = enc;
  }

  std::vector<SigSpec> encodedFFInputs;
  std::vector<SigSpec> encodedFFOutputs;
  std::vector<Cell *> encodedFFs;
  for (size_t i = 0; i < config.tbl.encodedBitWidth; i++) {
    // These wires don't exist in the original circuit, so let's create them:
    // TODO: create more meaningful names! The names generated using
    // NEW_ID_SUFFIX will be destoried in the end
    auto *encIn = module->addWire(NEW_ID, 1);
    auto *encOut = module->addWire(newFFIdstring(), 1);
    Cell *ff = module->addDffGate(NEW_ID_SUFFIX("encoded_ff"), clk,
                                  SigSpec(encIn), SigSpec(encOut));
    encodedFFs.push_back(ff);
    encodedFFInputs.emplace_back(encIn);
    encodedFFOutputs.emplace_back(encOut);
  }

  // Query the initial values of the FFs.
  SigMap sigmap(module);
  FfInitVals initVals(&sigmap, module);

  // Set the initial values of the newly added FFs

  for (size_t i = 0; i < encodedFFs.size(); i++) {
    FfData ffData(&initVals, encodedFFs[i]);
    ffData.val_init = Const(config.initialState[i], /* width */ 1);
    ffData.emit();
  }

  // Create the encoding function
  for (size_t pos = 0; pos < config.tbl.encodedBitWidth; ++pos) {
    createSOPConeFromOnSet(module, originalFFInputs, encodedFFInputs[pos],
                           config.tbl.encodingFuncOnSet(pos));
  }

  // Create the decoding function
  for (size_t pos = 0; pos < config.tbl.originalBitWidth; ++pos) {
    createSOPConeFromOnSet(module, encodedFFOutputs, originalFFOutputs[pos],
                           config.tbl.decodingFuncOnSet(pos));
  }

  module->fixup_ports();
}

// Check if the invariants describes a set of mutually exclusive FFs, e.g., f_1
// + (!f_2) + f_3 + (!f_4) + ... + f_N <= 1
bool isMutexFFInvariant(LinearInvariant inv) {
  return (inv.constant == -1) &&
         (inv.predicate == LinearInvariant::LESS_THAN_OR_EQUAL) &&
         (std::all_of(inv.coefficients.begin(), inv.coefficients.end(),
                      [](int coeff) { return coeff == 1; }));
}

// This function performs encoding optimization, which includes the following
// steps:
// - Extracts the FFs that are mutex
// - For FFs with complemented outputs: add a pair of inverters at its input and
// outputs, and flip its initial state (uses yosys's internal utility
// FfData::flip_bits)
// - Construct a StateMappingTable the determines the encoding and decoding
// functions
// - Apply the optimization
void mergeMutexFFsUsingInvariant(RTLIL::Module *module,
                                 const LinearInvariant &inv) {
  assert(isMutexFFInvariant(inv));
  std::cerr << "Using invariant: " << inv.dump()
            << " to optimize the encoding\n";

  // Find the set of FFs: here we assume that the variables in the invariants
  // are directly driven by FF cells
  std::vector<RTLIL::Cell *> ffToBeMerged;
  // We also need to track if ff is negated (~f_1) in the invariant to find
  // the right initial state
  boost::dynamic_bitset<> originalInitialState;
  for (size_t i = 0; i < inv.variables.size(); ++i) {

    RTLIL::Cell *ff = getDriverCell(module, module->wire(inv.variables[i]));

    // If the FF doesn't exist (e.g., the FF was optimized away in some other
    // invariants), we skip to the next invariant
    if (!ff) {
      continue;
    }

    if (!ff->type.in("$_DFF_P_")) {
      // There are two possible situations where this can happen:
      // 1. If the flip_bits() preserves the IdString of a FF that would be
      // removed, but got picked up by a later invariant. In this case, the wire
      // must be driven by an NOT gate.
      // 2. If the other encoding optimization optimizes away this FF: in that
      // case, the wire must be driven by a reduce_or
      if (!ff->type.in("$_NOT_", "$reduce_or")) {
        std::cerr << "Error: unexpected cell type " << log_id(ff->type) << "\n";
        throw std::runtime_error("Unexpected cell type, exiting");
      }
      continue;
    }

    auto isNegated = inv.isNegated[i];

    SigMap sigmap(module);
    FfInitVals initVals(&sigmap, module);

    FfData ffData(&initVals, ff);
    auto ffInitState = ffData.val_init.to_bits();
    assert(ffInitState.size() == 1 && "We assume that ffs are 1 bit");

    if (ffInitState[0] == Yosys::RTLIL::S0) {
      originalInitialState.push_back(isNegated != 0);
    } else if (ffInitState[0] == Yosys::RTLIL::S1) {
      originalInitialState.push_back(isNegated != 1);
    } else {
      assert(false && "We only work with ffs with initial values");
    }

    if (isNegated) {
      ffData.flip_bits({0});
      ff = ffData.emit();
    }
    // TODO: maybe we just skip instead of throwing an error.
    if (!ff->type.in("$_DFF_P_"))
      throw std::runtime_error(
          "Driving cell of invariant wire is not FF, but is a " +
          ff->type.str());
    ffToBeMerged.push_back(ff);
  }

  size_t encodedWidth = ceil_log2(1 + ffToBeMerged.size());

  // Encoding optimization is not profitable:
  if (ffToBeMerged.size() <= encodedWidth)
    return;

  // Create a StateMappingTable
  auto tbl =
      StateMappingTable::mappingForMutexFFs(ffToBeMerged.size(), encodedWidth);

  auto encodedInitialState = tbl.getEncodedState(originalInitialState);

  assert(encodedInitialState && "Error calculating the encoded initial state!");

  EncodingOptConfig config(ffToBeMerged, encodedInitialState.value(), tbl);

  // Get the set of negated bits:
  mergeMutexFFs(module, config);
}

void applyEncodingOptimizationUsingInvariants(
    RTLIL::Module *module, const std::vector<LinearInvariant> &invariants) {

  // Once the FF is processed, we just exclude it from the set of invariants
  std::set<RTLIL::IdString> processedFFs;

  for (const auto &inv : invariants) {
    // Query the initial values of the FFs.
    SigMap sigmap(module);
    FfInitVals initVals(&sigmap, module);

    // Check if we know how to use this invariant. TODO: we should make this
    // more extensible (now it is written in a way that it only works for the
    // method on the paper).

    // Currently, we support invariant of the form:
    // f_1 + f_2 + f_3 + ... + f_N <= 1
    if (isMutexFFInvariant(inv)) {
      mergeMutexFFsUsingInvariant(module, inv);
    }
  }
}