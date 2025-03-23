#pragma once
#include <boost/graph/sequential_vertex_coloring.hpp>

#include <boost/json/object.hpp>
#include <boost/json/serialize.hpp>
#include <cstddef>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <sys/wait.h>
#include <vector>

// Linear Algebra Headers
#include <Eigen/Dense>
#include <Eigen/src/Core/ArithmeticSequence.h>
#include <Eigen/src/Core/Matrix.h>
#include <Eigen/src/Core/MatrixBase.h>

// Yosys Headers
#include "kernel/log.h"
#include "kernel/register.h"
#include "kernel/rtlil.h"
#include "kernel/yosys.h"
#include "kernel/yosys_common.h"

// Promise headers
#include "promise/AbcCommands.h"
#include "promise/Invariants.h"
#include "promise/RTLIL/EncodingOptimization.h"
#include "promise/RTLIL/EquipInvariants.h"
#include "promise/ShellUtils.h"
#include "promise/StringUtils.h"
#include "promise/Timer.h"
#include "promise/VcdParser.h"
#include "promise/VerilatorUtils.h"
USING_YOSYS_NAMESPACE

// Names of the fields in the log files
const std::string SCORR = "SC";
const std::string INVARIANT = "IV";
const std::string ENCODING = "EN";
const std::string ST_FF = "aig_ffs";
const std::string ST_NODE = "aig_nodes";
const std::string ST_DEPTH = "aig_depth";
const std::string FPGA_FF = "fpga_ffs";
const std::string FPGA_NODE = "fpga_nodes";
const std::string FPGA_DEPTH = "fpga_depth";

const std::string RUNTIME_SIM = "Simulation";
const std::string RUNTIME_PROOF = "Proof";
const std::string RUNTIME_LINEAR_EQUALITY = "Linear equality";
const std::string RUNTIME_LINEAR_INEQUALITY = "Linear inequality";
const std::string RUNTIME_SCORR = "Signal correspondence";
const std::string RUNTIME_TOTAL = "Total";

const std::string INDUCTION_DEPTH = "Induction depth";

// Number of iterations taken to prove the invariant
const std::string PROOF_ITERATIONS = "Iterations";

// Names of the generated files
const std::string VERILOG_FLATTENED = "flattened.v";
const std::string VERILATOR_TB_NAME = "main.cpp";
const std::string VERILATOR_OBJ_DIR_NAME = "obj_dir";
const std::string SIM_BINARY_NAME = "sim.out";
const std::string SIM_WAVEFORM = "sim.vcd";
const std::string CEX_WAVEFORM = "cex.vcd";

// Those values are hardcoded for ICCAD '25 experiment.
const unsigned VERILATOR_SIM_CYCLES = 25000;
const unsigned VERILATOR_SIM_ROUNDS = 4;
const unsigned DEFAULT_INDUCTION_DEPTH = 10;

// Induction depth values to explore
const std::vector<unsigned> RANGE_INDUCTION_DEPTHS = {1,  2,  4,  8,   16, 24,
                                                      36, 64, 72, 128, 200};

class Iccad25Config {
  // Model checking timeout in seconds
  unsigned modelCheckingTimeOut = 3600;

  // The number of iterations that Promise simulates the input design
  unsigned simIteration = 0;

  // The number of iterations that Promise attempted to prove the invariant(s)
  unsigned proofIteration = 0;

  // Location for all output files
  std::filesystem::path outputDir;

public:
  unsigned getProofIteration() const { return proofIteration; }

  // Get the path to the directory to write temporary simulation data:
  std::filesystem::path getCurrentSimDir() const {
    auto dirName = outputDir / ("sim_round_" + std::to_string(simIteration));
    mkdir(dirName);
    return dirName;
  }

  // Get the path to the directory to write temporary verification data:
  std::filesystem::path getCurrentProofDir() const {
    auto dirName =
        outputDir / ("verif_round_" + std::to_string(proofIteration));
    mkdir(dirName);
    return dirName;
  }

  std::filesystem::path getSynthResultDir() const {
    auto dirName = outputDir / ("synthesis_result");
    mkdir(dirName);
    return dirName;
  }

  // Get the path to the output directory
  std::filesystem::path getOutputDir() const {
    mkdir(outputDir);
    return outputDir;
  }

  Iccad25Config(unsigned modelCheckingTimeOut, std::filesystem::path outputDir)
      : modelCheckingTimeOut(modelCheckingTimeOut),
        outputDir(std::move(outputDir)) {}

  void newProofIteration() { proofIteration += 1; }
  void newSimIteration() { simIteration += 1; }
};

std::vector<Wire *> getRegOutputs(RTLIL::Module *m);

Eigen::MatrixXi getUniqueRows(const vector<Eigen::MatrixXi> &matrices);

void runSimulation(const std::filesystem::path &objDir,
                   const std::vector<std::filesystem::path> &verilogSrcs,
                   const std::filesystem::path &testbench,
                   const std::string &topName);

void flowNone(RTLIL::Module *m, const std::filesystem::path &outputFile);

void flowScorr(RTLIL::Module *m, const std::filesystem::path &outputFile,
               unsigned inductionDepth);

void flowScorrEncoding(RTLIL::Module *m,
                       const std::filesystem::path &outputFile,
                       const std::vector<LinearInvariant> &invariants,
                       unsigned inductionDepth);

void flowScorrInvar(RTLIL::Module *m, const std::filesystem::path &outputFile,
                    const std::vector<LinearInvariant> &invariants,
                    unsigned inductionDepth);

void flowScorrInvarEncoding(RTLIL::Module *m,
                            const std::filesystem::path &outputFile,
                            const std::vector<LinearInvariant> &invariants,
                            unsigned inductionDepth);

ModelCheckingResult
verifyLinearInvariants(const Iccad25Config &config, RTLIL::Module *m,
                       const std::vector<LinearInvariant> &invariants);

std::vector<LinearInvariant> inferInvariants(RTLIL::Module *module,
                                             RTLIL::Design *design,
                                             Iccad25Config &config,
                                             const std::string &topName);