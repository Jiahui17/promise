#pragma once
#include <string>
#include <vector>

#include <Eigen/Dense>
#include <Eigen/src/Core/ArithmeticSequence.h>
#include <Eigen/src/Core/Matrix.h>
#include <Eigen/src/Core/MatrixBase.h>

// Yosys headers
#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"

/// \brief Extract the values of the specified signals from a VCD file, and
/// format it as an integer matrix (Eigen::MatrixXi).
///
/// \note The matrix only contains unique rows (i.e., all the unique states).
/// The number of columns in the returned matrix is the same as the number of
/// specified signals.
///
/// \param module: The RTLIL module.
/// \param vcdPath: The path to the VCD file.
/// \param signalList: The identifiers of the signals to extract values.
///
/// \return An Eigen::MatrixXi where each row corresponds to a time step and
/// each column corresponds to a signal in the signalList.
///
Eigen::MatrixXi
vcdToSignalMatrix(Yosys::RTLIL::Module *module, const std::string &vcdPath,
                  const std::vector<Yosys::RTLIL::IdString> &signalList);