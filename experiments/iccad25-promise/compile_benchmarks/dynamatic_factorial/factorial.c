#include "dynamatic/Integration.h"
#include "stdlib.h"
#include "stdint.h"

#define UNROLL_FACTOR 3

typedef int8_t data_type;

data_type factorial(data_type n) {
  data_type result = 1;

  while (n >= UNROLL_FACTOR) {
#if UNROLL_FACTOR == 1
    result = result * n;
#elif UNROLL_FACTOR == 2
    result = result * n * (n - 1);
#elif UNROLL_FACTOR == 3
    result = result * n * (n - 1) * (n - 2);
#elif UNROLL_FACTOR == 4
    result = result * n * (n - 1) * (n - 2) * (n - 3);
#elif UNROLL_FACTOR == 5
    result = result * n * (n - 1) * (n - 2) * (n - 3) * (n - 4);
#else
    #error "Unsupported UNROLL_FACTOR. Please define it."
#endif
    n = n - UNROLL_FACTOR;
  }

  // Handle remaining numbers
  while (n > 0) {
      result = result * n;
      n = n - 1;
  }

  return result;
}

int main(void) {
  data_type n;

  srand(13);
  n = rand() % 100;

  CALL_KERNEL(factorial, n);
  return 0;
}
