`timescale 1ns/1ns
module tb;

  reg clk = 0;
  reg rst;
  reg [3:0] divider__lhs;
  reg divider__lhs_vld;
  reg divider__result_rdy;
  reg [3:0] divider__rhs;
  reg divider__rhs_vld;
  wire divider__lhs_rdy;
  wire [3:0] divider__result;
  wire divider__result_vld;
  wire divider__rhs_rdy;

  __divider__iterative_division_0_next dut(
  .clk(clk),
  .rst(rst),
  .divider__lhs(divider__lhs),
  .divider__lhs_vld(divider__lhs_vld),
  .divider__result_rdy(divider__result_rdy),
  .divider__rhs(divider__rhs),
  .divider__rhs_vld(divider__rhs_vld),
  .divider__lhs_rdy(divider__lhs_rdy),
  .divider__result(divider__result),
  .divider__result_vld(divider__result_vld),
  .divider__rhs_rdy(divider__rhs_rdy)
  );
always #2 clk = ~clk;

initial begin
$dumpfile("./trace_round_0.vcd");
$dumpvars(0, tb.dut);
    rst <= 1;
    divider__lhs <= 4'b1000;
    divider__lhs_vld <= 1;
    divider__result_rdy <= 1;
    divider__rhs <= 4'b0010;
    divider__rhs_vld <= 1;
   #4
    rst <= 0;
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #4
   #500
$finish;
end

endmodule

