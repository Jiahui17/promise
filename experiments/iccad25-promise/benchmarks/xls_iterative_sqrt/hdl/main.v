module main(
  input [8-1:0] n,
  input go,
  input clk,
  input rst,
  output [8-1:0] result,
  output result_valid
);

  reg started;
  initial started=0;
  wire n_ready;

  always @(posedge clk) begin
    if (rst) begin
      started<=0;
    end else begin
      if ((started == 0) & go & n_ready) begin
        started<=1;
      end
    end
  end

  __iterative_sqrt__iterative_sqrt_0_next iterative_sqrt(
    .clk(clk),
    .rst(rst),
    .iterative_sqrt__chan_n(n),
    .iterative_sqrt__chan_n_vld(!started & go),
    .iterative_sqrt__chan_result_rdy(1'b1),
    .iterative_sqrt__chan_result(result),
    .iterative_sqrt__chan_result_vld(result_valid),
    .iterative_sqrt__chan_n_rdy(n_ready)
  );
endmodule
