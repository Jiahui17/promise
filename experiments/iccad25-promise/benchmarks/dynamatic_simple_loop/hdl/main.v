

module main(
  input [9:0] arg0,
  input  arg0_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  output  arg0_ready,
  output [9:0] out0,
  output  out0_valid
);

  reg started;

  initial started = 0;

  always @(posedge clk) begin
    if (rst) begin
      started = 0;
    end else begin
      if ((started == 0) & (arg0_valid == 1) & (arg0_ready == 1)) begin
        started = 1;
      end
    end
  end

  simple simple_wrapped(
    .arg0 (arg0),
    .arg0_ready (arg0_ready),
    .arg0_valid (!started & arg0_valid),
    .clk (clk),
    .out0 (out0),
    .out0_ready (out0_ready),
    .out0_valid (out0_valid),
    .rst (rst)
  );


endmodule
