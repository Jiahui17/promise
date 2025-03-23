
#include <boost/graph/sequential_vertex_coloring.hpp>
#include <cstddef>

#include <Eigen/Dense>
#include <Eigen/src/Core/ArithmeticSequence.h>
#include <Eigen/src/Core/Matrix.h>
#include <Eigen/src/Core/MatrixBase.h>

#include <numeric>
#include <sys/wait.h>

int gcdReduce(const Eigen::VectorXi &vec) {
  int currentGcd = 0;
  for (int val : vec) {
    currentGcd = std::gcd(currentGcd, std::abs(val));
    if (currentGcd == 1) // Early stop for minimal gcd
      return 1;
  }
  return currentGcd;
}

Eigen::MatrixXi integerRREF(Eigen::MatrixXi matrix) {
  size_t rows = matrix.rows();
  size_t cols = matrix.cols();

  // h: row index
  // k: leading non-zero position
  size_t h = 0, k = 0;

  while (h < rows && k < cols) {
    int pivotRow = -1;

    int pivotValue = std::numeric_limits<int>::max();
    // Find the smallest non-zero integer in column k starting from row h.
    // Choose the smallest value instead of the largest to reduce grow of
    // the absolute value. Note: in float point, we want to divide by a
    // large value instead to avoid numerical instability.
    for (size_t i = h; i < rows; ++i) {
      if (matrix(i, k) != 0) {
        if (std::abs(matrix(i, k)) < std::abs(pivotValue)) {
          pivotValue = matrix(i, k);
          pivotRow = i;
        }
      }
    }

    if (/* No non-zero entry */ pivotRow == -1) {
      // Move to the next column
      ++k;
    } else {
      // Swap the pivot row with the current row h
      matrix.row(h).swap(matrix.row(pivotRow));

      if (pivotValue < 0) {
        // If the pivot is negative, multiply the row by -1 to make it positive
        matrix.row(h) *= -1;
      }

      // Normalize the pivot row
      int normalizer = gcdReduce(matrix.row(h).array());
      if (/* When the row is not all-zero */ normalizer != 0) {
        assert(normalizer > 0);
        matrix.row(h) /= normalizer;
      }

      // Eliminate entries in column k below row h. Question: should we
      // eliminate above as well?
      for (size_t i = h + 1; i < rows; ++i) {
        // matrix(h, k) instead of pivot_value because it was normalized and
        // also made positive
        matrix.row(i) =
            matrix(h, k) * matrix.row(i) - matrix(i, k) * matrix.row(h);
        // if (normalizer != 0) {
        //     matrix(i) /= normalizer;
        // }
      }

      // Move to the next row and column
      ++h;
      ++k;
    }
  }
  return matrix;
}

// Find a basis for the null space of the matrix
std::vector<Eigen::VectorXi>
computeBasisOfNullSpace(const Eigen::MatrixXi &matrix) {
  // Stack the matrix with an identity matrix:
  size_t numStates = matrix.rows();
  Eigen::MatrixXi identity =
      Eigen::MatrixXi::Identity(matrix.cols(), matrix.cols());

  Eigen::MatrixXi stacked(matrix.rows() + matrix.cols(), matrix.cols());
  stacked << matrix, identity;

  Eigen::MatrixXi crefMatrix = integerRREF(stacked.transpose()).transpose();

  std::vector<Eigen::VectorXi> basis;

  size_t numCols = crefMatrix.cols();
  for (size_t i = 0; i < numCols; ++i) {
    Eigen::VectorXi col = crefMatrix.col(i);
    auto upper = col.segment(0, numStates);
    auto lower = col.segment(numStates, col.size() - numStates);
    if ((upper.array() == 0).all() && (lower.array() != 0).any()) {
      basis.emplace_back(lower);
    }
  }

  if (!basis.empty())
    assert(basis[0].size() == matrix.cols());
  return basis;
}