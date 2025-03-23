import std;

type DATA_TYPE = uN[8];

proc factorial {
  // Public interface
chan_n : chan<DATA_TYPE> in;
chan_result : chan<DATA_TYPE> out;

              // Program state, result, n
              type PROC_STATE_TYPE=(u2, DATA_TYPE, DATA_TYPE);
              const IDLE_STATE=u2:0;
              const LOOP1=u2:1;
              const LOOP2=u2:2;
              const ZERO=DATA_TYPE:0;
              const ONE=DATA_TYPE:1;


              init { (IDLE_STATE, ONE, ZERO) }

              config(
                  chan_n: chan<DATA_TYPE> in,
                  chan_result: chan<DATA_TYPE> out,
                  ) {

                (chan_n, chan_result)
              }

              next(proc_state : PROC_STATE_TYPE) {

                let (state, result, n) = proc_state;
                if (state == IDLE_STATE) {
                  let token_n = recv(join(), chan_n);
                  (LOOP1, ONE, token_n.1)
                } else if (state == LOOP1) & (n >= DATA_TYPE:3) {
                  (LOOP1, result * n * (n - DATA_TYPE:1) * (n - DATA_TYPE:2), n - DATA_TYPE:3)
                } else if (state == LOOP1) & (n < DATA_TYPE:3) {
                  (LOOP2, result, n)
                } else if (state == LOOP2) & (n > DATA_TYPE:0) {
                  (LOOP2, result * n, n - DATA_TYPE:1)
                } else {
                  send(join(), chan_result, result);
                  (IDLE_STATE, ONE, ZERO)
                }
              }
}


