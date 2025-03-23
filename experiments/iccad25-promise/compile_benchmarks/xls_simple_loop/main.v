module main(
  input [10-1:0] n,
  input go,
  input clk,
  input rst,
  output [10-1:0] result,
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

  __simple_loop__simple_loop_0_next simple_loop(
    .clk(clk),
    .rst(rst),
    .simple_loop__chan_n(n),
    .simple_loop__chan_n_vld(!started & go),
    .simple_loop__chan_result_rdy(1'b1),
    .simple_loop__chan_result(result),
    .simple_loop__chan_result_vld(result_valid),
    .simple_loop__chan_n_rdy(n_ready)
  );
endmodule
