
#include "kernel/log.h"
#include "promise/AbcCommands.h"
#include "promise/Invariants.h"
#include "promise/ModelCheckingResult.h"
#include "promise/RTLIL/EncodingOptimization.h"
#include "promise/RTLIL/EquipInvariants.h"
#include "promise/RTLIL/RTLILUtils.h"
#include "promise/ShellUtils.h"
#include "promise/Simulation/VcdParser.h"
#include "promise/Simulation/VerilatorUtils.h"
#include "promise/Timer.h"

#include "kernel/rtlil.h"
#include "kernel/yosys.h"

#include "SynthesisFlow.h"
#include <Eigen/src/Core/Matrix.h>
#include <iostream>
#include <tuple>

std::vector<Wire *> getRegOutputs(RTLIL::Module *m) {
  // The logic below attempts to get all bits driven by the Q output of a clock
  // std::set<RTLIL::SigBit> clockedBits;
  std::vector<RTLIL::Wire *> regOuts;
  for (auto *cell : m->cells()) {
    // TODO: filter more unhandled FF types
    assert(!cell->type.in("$dff") && "Unhandled cell type that is a FF");
    if (cell->type.in("$_DFF_P_")) {
      log("  Found DFF-type cell: %s of type %s\n", log_id(cell),
          log_id(cell->type));

      // FF output
      auto q = cell->getPort("\\Q");
      std::set<RTLIL::SigBit> outputset = q.to_sigbit_set();
      for (auto b : q.to_sigbit_set()) {
        regOuts.push_back(b.wire);
      }
    }
  }
  return regOuts;
}

// Compressing the unique rows from a vector of matrices into one matrix
Eigen::MatrixXi getUniqueRows(const vector<Eigen::MatrixXi> &matrices) {

  struct VectorCompare {
    bool operator()(const vector<int> &a, const vector<int> &b) const {
      return a < b;
    }
  };

  std::set<vector<int>, VectorCompare> uniqueRows;
  for (const auto &mat : matrices) {
    for (int i = 0; i < mat.rows(); ++i) {
      vector<int> row(mat.cols());
      for (int j = 0; j < mat.cols(); ++j) {
        row[j] = mat(i, j);
      }
      uniqueRows.insert(row);
    }
  }

  int numRows = uniqueRows.size();
  int numCols = uniqueRows.empty() ? 0 : uniqueRows.begin()->size();

  Eigen::MatrixXi result(numRows, numCols);
  int i = 0;
  for (const auto &row : uniqueRows) {
    for (int j = 0; j < numCols; ++j) {
      result(i, j) = row[j];
    }
    ++i;
  }
  return result;
}

// Attempt to prove the invariant and return the model checking result (which
// contains the analyzed counterexample data if the property failed).
ModelCheckingResult verifyInvariant(const SynthesisFlowConfig &config,
                                    RTLIL::Module *m,
                                    const std::vector<Invariant> &invariants) {

  RTLIL::Design *design = new RTLIL::Design;

  // Clone the design
  RTLIL::Module *cloned = m->clone();

  design->add(cloned);

  // Equip the module with an invariant and make it an PO. The goal of the model
  // checker is to prove that it is 1 in all reachable states.
  instrumentInvariants(cloned, invariants,
                       /* trimOriginalOutputs = */ true,
                       /* separateInvariants = */ false);

  auto miterVerilog = config.getCurrentProofDir() / "to_verify.v";
  run_pass("opt_clean; write_verilog " + miterVerilog.string(), design);

  auto miterBlif = config.getCurrentProofDir() / "to_verify.blif";
  run_pass("techmap; write_blif " + miterBlif.string(), design);

  auto pdrLogFile = config.getCurrentProofDir() / "pdr.log";

// #define USING_ABC_PDR
#ifdef USING_ABC_PDR
  runAbcPdrProof(miterBlif, pdrLogFile);
  ModelCheckingResult result =
      ModelCheckingResult::parseAbcLogFile(m, pdrLogFile);
#else
  runrIC3PdrProof(miterBlif, pdrLogFile);
  ModelCheckingResult result =
      ModelCheckingResult::parserIC3LogFile(m, pdrLogFile);
#endif

  delete design;
  return result;
}

void applyCombinationalOptimization(const SynthesisFlowConfig &config,
                                    RTLIL::Module *m) {
  RTLIL::Design *design = new RTLIL::Design;

  // Clone the design
  RTLIL::Module *cloned = m->clone();

  design->add(cloned);

  auto initialBlif = config.getSynthResultDir() / "initial.blif";
  run_pass("techmap; write_blif " + initialBlif.string(), design);

  auto combinationalBaseline =
      config.getSynthResultDir() / "combinational.blif";

  runAbcCombOptimization(initialBlif, combinationalBaseline);
}

// Assuming that the conjunction of the invariants is proven, use scorr in ABC
// with invariants to optimize the design
void applyScorrOptimization(const SynthesisFlowConfig &config, RTLIL::Module *m,
                            const std::vector<Invariant> &invariants) {

  RTLIL::Design *design = new RTLIL::Design;

  // Clone the design
  RTLIL::Module *cloned = m->clone();

  design->add(cloned);

  // Instrument the invariants, without trimming the original outputs
  instrumentInvariants(cloned, invariants,
                       /* trimOriginalOutputs = */ false,
                       /* separateInvariants = */ false);

  auto miterVerilog = config.getSynthResultDir() / "design_invariants.v";
  run_pass("write_verilog " + miterVerilog.string(), design);

  auto miterBlif = config.getSynthResultDir() / "design_invariants.blif";
  run_pass("techmap; write_blif " + miterBlif.string(), design);

  auto optimizedBlif =
      config.getSynthResultDir() / "design_invariants_scorred.blif";

  unsigned numPOBits = 0;
  int maxPortId = -1;
  for (Wire *identifier : cloned->wires()) {
    if (identifier->port_output) {
      numPOBits += identifier->width;
      maxPortId =
          maxPortId < identifier->port_id ? identifier->port_id : maxPortId;
    }
  }
  // for (auto cell : )
  auto *propertyPin = cloned->wire(RTLIL::escape_id("property_pin"));
  assert(propertyPin->port_id == maxPortId);

  runAbcScorrOptimization(miterBlif, optimizedBlif, /* inductionDepth */ 10,
                          /* withInvariants */ true, numPOBits);
}

void applyEncodingOptimization(const SynthesisFlowConfig &config,
                               RTLIL::Module *m,
                               const std::vector<Invariant> &invariants) {
  RTLIL::Design *design = new RTLIL::Design;

  // Clone the design
  RTLIL::Module *cloned = m->clone();

  design->add(cloned);

  auto originalBlif = config.getSynthResultDir() / "original.blif";
  run_pass("techmap; write_blif " + originalBlif.string(), design);

  run_pass("clean", design);

  auto outputDebug = config.getSynthResultDir() / "design_debug.v";
  run_pass("write_verilog " + outputDebug.string(), design);

  applyEncodingOptimizationUsingInvariants(cloned, invariants);
  run_pass("clean", design);

  auto outputVerilog = config.getSynthResultDir() / "design_encoding.v";
  run_pass("write_verilog " + outputVerilog.string(), design);

  auto outputBlif = config.getSynthResultDir() / "design_encoding.blif";
  run_pass("techmap; write_blif " + outputBlif.string(), design);

  runSequentialEquivalenceChecking(originalBlif, outputBlif, 3600);
}

// This is the "suggest" and "guarnatee" step
bool synthesisFlow(SynthesisFlowConfig config, RTLIL::Design *design,
                   const std::string &topName) {

  RTLIL::Module *m = design->module(RTLIL::escape_id(topName));

  run_pass("clean", design);

  applyCombinationalOptimization(config, m);

  auto regOuts = getRegOutputs(m);

  // [STEP]: retrieve single-bit register output signals.
  std::vector<RTLIL::IdString> singleBitRegOuts;
  for (auto *sig : regOuts) {
    if (sig->width == 1) {
      singleBitRegOuts.push_back(sig->name);
    }
  }

  // Flattened verilog design: after removing procs and mapping all FFs to
  // simple FFs
  auto flattenedVerilog = config.getOutputDir() / VERILOG_FLATTENED;
  run_pass("write_verilog " + flattenedVerilog.string(), design);

  // [STEP]: Simulate the design:
  std::vector<Eigen::MatrixXi> simData;
  for (unsigned i = 0; i < 4; i++, config.newSimIteration()) {
    // Object directory for SUGGEST
    auto verilatorSimObjDir =
        config.getCurrentSimDir() / VERILATOR_OBJ_DIR_NAME;
    auto testbenchFile = config.getCurrentSimDir() / VERILATOR_TB_NAME;
    auto vcdFile = config.getCurrentSimDir() / SIM_WAVEFORM;

    // Compile the design into a simulation model:
    createRandomTestBench(testbenchFile, m, 2500, vcdFile, i);

    buildVerilatorModel(verilatorSimObjDir, {flattenedVerilog}, testbenchFile,
                        topName);

    // Launch the binary:
    std::stringstream simCmd;
    simCmd << (verilatorSimObjDir / ("V" + topName));
    shell(simCmd.str());

    Eigen::MatrixXi signalMatrix =
        vcdToSignalMatrix(m, vcdFile, singleBitRegOuts);
    simData.push_back(signalMatrix);
  }

  auto signalMatrix = getUniqueRows(simData);

  // [STEP]: Suggest invariants from the signalMatrix:
  std::vector<Invariant> linearInvariants =
      inferLinearEqualities(m, signalMatrix, singleBitRegOuts);

  std::vector<Invariant> linearInequalities =
      inferLinearInequalitiesViaConflictGraph(m, signalMatrix,
                                              singleBitRegOuts);

  std::copy(linearInequalities.begin(), linearInequalities.end(),
            std::back_inserter(linearInvariants));

  // [STEP]: Guarantee the correctness of the generated invariants
  ModelCheckingResult modelCheckingResult =
      verifyInvariant(config, m, linearInvariants);
  config.newProofIteration();

  // [STEP]: Iterate between "suggest" and "guarantee" phases to prove the
  // conjunction of invariants:
  while (modelCheckingResult.status == ModelCheckingResult::UNSAFE) {
    auto cexTbFile = config.getCurrentProofDir() / VERILATOR_TB_NAME;
    auto vcdFile = config.getCurrentProofDir() / SIM_WAVEFORM;
    auto verilatorObjDir = config.getCurrentProofDir() / VERILATOR_OBJ_DIR_NAME;
    auto testbenchFile = config.getCurrentProofDir() / VERILATOR_TB_NAME;

    // [STEP]: Collect the states from the latest model checking result
    createCexTestBench(cexTbFile, m, modelCheckingResult, vcdFile);
    buildVerilatorModel(verilatorObjDir, {flattenedVerilog}, testbenchFile,
                        topName);

    // Launch the binary:
    std::stringstream simCmd;
    simCmd << (verilatorObjDir / ("V" + topName));
    shell(simCmd.str());

    // Retrieve the signal matrix from CEX
    auto cexMatrix = vcdToSignalMatrix(m, vcdFile, singleBitRegOuts);
    signalMatrix = getUniqueRows({signalMatrix, cexMatrix});

    // [STEP]: Suggest invariants from the signalMatrix:
    linearInvariants = inferLinearEqualities(m, signalMatrix, singleBitRegOuts);
    linearInequalities = inferLinearInequalitiesViaConflictGraph(
        m, signalMatrix, singleBitRegOuts);
    std::copy(linearInequalities.begin(), linearInequalities.end(),
              std::back_inserter(linearInvariants));

    modelCheckingResult = verifyInvariant(config, m, linearInvariants);

    config.newProofIteration();
  }

  assert(modelCheckingResult.status == ModelCheckingResult::SAFE);

  std::cerr << "[INFO] List of proven invariants:\n";
  for (const auto &inv : linearInvariants) {
    std::cerr << "[INFO] invariant: " << inv.toString() << "\n";
  }

  applyScorrOptimization(config, m, linearInvariants);

  applyEncodingOptimization(config, m, linearInvariants);
  return true;
}