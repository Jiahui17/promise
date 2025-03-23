module {
  handshake.func @simple(%arg0: !handshake.channel<i10>) -> (!handshake.channel<i10>) {
    %1 = merge %arg0, %loopback : <i10>
    %2 = buffer %1 { hw.parameters = {BUFFER_TYPE = "ONE_SLOT_BREAK_DV", NUM_SLOTS=1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>} } : <i10>
    %3 = buffer %2 { hw.parameters = {BUFFER_TYPE = "ONE_SLOT_BREAK_R", NUM_SLOTS=1 : ui32, TIMING = #handshake<timing {D: 0, V: 0, R: 1}>} } : <i10>
    %forkOuts:2 = fork [2] %3 : <i10>
    %bufferLeft = buffer %forkOuts#0 { hw.parameters = {BUFFER_TYPE = "ONE_SLOT_BREAK_DV", NUM_SLOTS=1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>} } : <i10>
    %bufferRight = buffer %forkOuts#1 { hw.parameters = {BUFFER_TYPE = "ONE_SLOT_BREAK_DV", NUM_SLOTS=1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>} } : <i10>
    %5 = source : <>
    %6 = constant %5 {value = 950 : i10 } : <>, <i10>
    %7 = cmpi ult, %bufferLeft, %6 : <i10>
    %8 = source : <>
    %9 = constant %8 {value = 1 : i10} : <>, <i10>
    %10 = addi %9, %bufferRight : <i10>
    %loopback, %output = cond_br %7, %10 : <i1>, <i10>
    end %output : <i10>
  }
}
