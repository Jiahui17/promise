#include "dynamatic/Integration.h"
#include "stdlib.h"
#include "stdint.h"

// Maybe we can create a stdlib for dynamatic? Creating a select for this is a
// overkill...
#define ABS(x) (x >= 0) ? (x) : (-x)

typedef int8_t data_type;

data_type iterative_division(data_type dividend, data_type divisor) {
  if (divisor == 0)
    return -1;
  data_type quotient = 0;
  data_type sign = ((dividend < 0) ^ (divisor < 0)) ? -1 : 1;

  dividend = ABS(dividend);
  divisor = ABS(divisor);

  while (dividend >= divisor) {
    dividend = dividend - divisor;
    quotient++;
  }
  return (sign == -1) ? -quotient : quotient;
}

int main(void) {
  data_type dividend;
  data_type divisor;

  srand(13);
  dividend = rand() % 100;
  divisor = rand() % 100;

  CALL_KERNEL(iterative_division, dividend, divisor);
  return 0;
}
