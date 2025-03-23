import std;

type DATA_TYPE=u8;

proc iterative_sqrt {
  // Public interface
chan_n : chan<DATA_TYPE> in;
chan_result : chan<DATA_TYPE> out;

              type PROC_STATE_TYPE=(u1, DATA_TYPE, DATA_TYPE, DATA_TYPE);
              const IDLE_STATE=u1:0;
              const RUNNING_STATE=u1:1;
              const U4_ZERO=DATA_TYPE:0;


              init { (IDLE_STATE, U4_ZERO, U4_ZERO, U4_ZERO) }

              config(
                  chan_n: chan<DATA_TYPE> in,
                  chan_result: chan<DATA_TYPE> out,
                  ) {

                (chan_n, chan_result)
              }

              next(proc_state : PROC_STATE_TYPE) {

                let (state, n, low, high) = proc_state;
                let mid = ((low + high) >> 1);
                if (state == IDLE_STATE) {
                  let token_n = recv(join(), chan_n);
                  (RUNNING_STATE, token_n.1, U4_ZERO, token_n.1)
                } else if (mid * mid == n) {
                  send(join(), chan_result, mid);
                  (IDLE_STATE, U4_ZERO, U4_ZERO, U4_ZERO)
                } else if (mid * mid < n) {
                  (RUNNING_STATE, n, mid + DATA_TYPE:1, high)
                } else {
                  (RUNNING_STATE, n, low, mid - DATA_TYPE:1)
                }
              }
}


