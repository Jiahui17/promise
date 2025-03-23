import std;

type DATA_TYPE = sN[8];

proc iterative_division {
  // Public interface
  lhs : chan<DATA_TYPE> in;
  rhs : chan<DATA_TYPE> in;
  result : chan<DATA_TYPE> out;

 const IDLE_STATE=u1:0;
 const RUNNING_STATE=u1:1;

 init { (DATA_TYPE:0, DATA_TYPE:0, u1:0, u1:0, DATA_TYPE:0) }

 config(
     lhs: chan<DATA_TYPE> in,
     rhs: chan<DATA_TYPE> in,
     result: chan<DATA_TYPE> out,
     ) {

   (lhs, rhs, result)
 }

 next(proc_state : (DATA_TYPE, DATA_TYPE, u1, u1, DATA_TYPE)) {

  let (dividend, divisor, state, sign, quotient) = proc_state;
  if (state == IDLE_STATE) {
     let token_lhs = recv(join(), lhs);
     let token_rhs = recv(join(), rhs);
     (std::abs(token_lhs.1), std::abs(token_rhs.1), RUNNING_STATE, (token_lhs.1 < DATA_TYPE:0) ^ (token_rhs.1 < DATA_TYPE:0), DATA_TYPE:0)
   } else {
     if (dividend >= divisor) {
       (dividend - divisor, divisor, RUNNING_STATE, sign, quotient + DATA_TYPE:1)
     } else {
       send(join(), result, if (sign == u1:1) {-quotient} else {quotient});
       (DATA_TYPE:0, DATA_TYPE:0, IDLE_STATE, u1:0, DATA_TYPE:0)
     }
  }
 }
}


