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
  wire end_valid;

  always @(posedge clk) begin
    if (rst) begin
      started=0;
    end else begin
      if ((started == 0) & go & n_ready) begin
        started=1;
      end
    end
  end

  __factorial__factorial_0_next iterative_factorial(
    .clk(clk),
    .rst(rst),
    .factorial__chan_n(n),
    .factorial__chan_n_vld(!started & go),
    .factorial__chan_result_rdy(1'b1),
    .factorial__chan_result(result),
    .factorial__chan_result_vld(result_valid),
    .factorial__chan_n_rdy(n_ready)
  );
endmodule
