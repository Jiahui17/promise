`define BSV_POSITIVE_RESET

module main(
  clk,
  rst,
  start_a,
  start_b,
  EN_start,
  RDY_start,
  EN_getResult,
  getResult,
  RDY_getResult
);

  input  clk;
  input  rst;

  // action method start
  input  [31 : 0] start_a;
  input  [31 : 0] start_b;
  input  EN_start;
  output RDY_start;

  // actionvalue method getResult
  input  EN_getResult;
  output [31 : 0] getResult;
  output RDY_getResult;

mkGCD2 inst(
  .CLK(clk),
  .RST_N(rst),
  .start_a(start_a),
  .start_b(start_b),
  .EN_start(EN_start &!EN_getResult & RDY_start),
  .RDY_start(RDY_start),
  .EN_getResult(EN_getResult &!EN_start & RDY_getResult),
  .getResult(getResult),
  .RDY_getResult(RDY_getResult)
);

endmodule
