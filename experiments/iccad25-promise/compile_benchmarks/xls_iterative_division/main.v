module main(
  input [8-1:0] dividend,
  input [8-1:0] divisor,
  input go,
  input clk,
  input rst,
  output [8-1:0] result,
  output result_valid
);

  reg started;
  initial started=0;
  wire divider__lhs_rdy;
  wire divider__rhs_rdy;

  always @(posedge clk) begin
    if (rst) begin
      started=0;
    end else begin
      if ((started == 0) & go & divider__lhs_rdy & divider__rhs_rdy) begin
        started=1;
      end
    end
  end

  __iterative_division__iterative_division_0_next iterative_division(
    .clk(clk),
    .rst(rst),
    .iterative_division__lhs(dividend),
    .iterative_division__lhs_vld(!started & go),
    .iterative_division__rhs(divisor),
    .iterative_division__rhs_vld(!started & go),
    .iterative_division__result_rdy(1'b1),
    .iterative_division__result(result),
    .iterative_division__result_vld(result_valid),
    .iterative_division__lhs_rdy(divider__lhs_rdy),
    .iterative_division__rhs_rdy(divider__rhs_rdy)
  );
endmodule
