#pragma once

#include <sys/wait.h>

#include <boost/graph/sequential_vertex_coloring.hpp>

#include <Eigen/Dense>
#include <Eigen/src/Core/ArithmeticSequence.h>
#include <Eigen/src/Core/Matrix.h>
#include <Eigen/src/Core/MatrixBase.h>

/// \brief Compute a basis (over integer domain) of the nullspace of an integer
/// matrix.
///
/// \param matrix The input integer matrix for which the nullspace basis is
/// computed.
///
/// \return A vector of integer vector.
///
std::vector<Eigen::VectorXi>
computeBasisOfNullSpace(const Eigen::MatrixXi &matrix);