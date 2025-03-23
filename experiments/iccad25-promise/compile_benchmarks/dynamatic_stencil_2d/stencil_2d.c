//===- stencil_2d.c - Grid-based computation ----------------------*- C -*-===//
//
// Implements the stencil_2d kernel.
//
//===----------------------------------------------------------------------===//

#include "dynamatic/Integration.h"
#include "stdlib.h"
#include "stdint.h"

typedef int8_t data_type;

#define N 900
#define M 10

data_type stencil_2d(data_type orig[N], data_type filter[M], data_type sol[N]) {
  data_type temp = 0;
  for (unsigned c = 0; c < 28; c++) {
    temp = 0;
    for (unsigned k1 = 0; k1 < 3; k1++)
      for (unsigned k2 = 0; k2 < 3; k2++)
        temp += filter[k1 * 3 + k2] * orig[k1 * 30 + c + k2];
    sol[c] = temp;
  }
  return temp;
}

int main(void) {
  data_type orig[N];
  data_type filter[M];
  data_type sol[N];

  for (int j = 0; j < N; ++j)
    orig[j] = rand() % 100;
  for (int j = 0; j < M; ++j)
    filter[j] = rand() % 100;

  CALL_KERNEL(stencil_2d, orig, filter, sol);
  return 0;
}
