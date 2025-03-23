//===- gaussian.c - Gaussian computation --------------------------*- C -*-===//
//
// Implements the gaussian kernel.
//
//===----------------------------------------------------------------------===//

#include "dynamatic/Integration.h"
#include "stdlib.h"
#include "stdint.h"

#define N 10
#define N_DEC 9     // = N - 1
#define N_DEC_DEC 8 // = N - 2
typedef int8_t data_type;
// typedef int data_type;

data_type gaussian(data_type c[N], data_type a[N][N]) {
  data_type sum = 0;
  for (unsigned j = 1; j <= N_DEC_DEC; j++) {
    for (unsigned i = j + 1; i <= N_DEC_DEC; i++) {
      for (unsigned k = 1; k <= N_DEC; k++) {
        a[i][k] = a[i][k] - c[j] * a[j][k];
        sum += k;
      }
    }
  }
  return sum;
}

int main(void) {
  data_type c[N];
  data_type a[N][N];

  srand(13);
  for (int y = 0; y < N; ++y) {
    c[y] = 1;
    for (int x = 0; x < N; ++x) {
      a[y][x] = 1;
    }
  }

  CALL_KERNEL(gaussian, c, a);
  return 0;
}
