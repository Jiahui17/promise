import std;

type DATA_TYPE=u10;

proc simple_loop {
    // Public interface
  chan_n : chan<DATA_TYPE> in;
  chan_result : chan<DATA_TYPE> out;

  type FSM_STATE_TYPE=u1;
  type PROC_STATE_TYPE=(FSM_STATE_TYPE, DATA_TYPE);
  const IDLE_STATE=FSM_STATE_TYPE:0;
  const RUNNING_STATE=FSM_STATE_TYPE:1;
  const ZERO=DATA_TYPE:0;

  init { (IDLE_STATE, ZERO) }

  config(
      chan_n: chan<DATA_TYPE> in,
      chan_result: chan<DATA_TYPE> out,
      ) {
    (chan_n, chan_result)
  }

  next(proc_state : PROC_STATE_TYPE) {
    let (state, n) = proc_state;
    if (state == IDLE_STATE) {
      let token_n = recv(join(), chan_n);
      (RUNNING_STATE, token_n.1)
    } else if (n < DATA_TYPE:950) {
      (RUNNING_STATE, n + DATA_TYPE:1)
    } else {
      send(join(), chan_result, n);
      (IDLE_STATE, ZERO)
    }
  }
}
