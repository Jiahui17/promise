//===- matvec.c - Multiply matrix to vector  ----------------------*- C -*-===//
//
// Implements the matvec kernel.
//
//===----------------------------------------------------------------------===//

#include "dynamatic/Integration.h"
#include "stdint.h"
#include "stdlib.h"

typedef int8_t data_type;
#define N 10

data_type matvec(data_type m[N][N], data_type v[N], data_type out[N]) {
  data_type tmp = 0;
  for (unsigned i = 0; i < N; i++) {
    tmp = 0;
    for (unsigned j = 0; j < N; j++) {
      tmp += v[j] * m[i][j];
    }
    out[i] = tmp;
  }
  return tmp;
}

int main(void) {
  data_type m[N][N];
  data_type v[N];
  data_type out[N];

  for (int y = 0; y < N; ++y) {
    v[y] = rand() % 100;
    for (int x = 0; x < N; ++x) {
      m[y][x] = rand() % 100;
    }
  }

  CALL_KERNEL(matvec, m, v, out);
  return 0;
}
