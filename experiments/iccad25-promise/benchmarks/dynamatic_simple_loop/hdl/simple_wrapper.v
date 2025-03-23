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
  wire [9:0] simple_wrapped_out0;
  wire  simple_wrapped_out0_valid;
  wire  simple_wrapped_out0_ready;

  assign out0 = simple_wrapped_out0;
  assign out0_valid = simple_wrapped_out0_valid;
  assign simple_wrapped_out0_ready = out0_ready;

  simple simple_wrapped(
    .arg0 (arg0),
    .arg0_valid (arg0_valid),
    .arg0_ready (arg0_ready),
    .clk (clk),
    .rst (rst),
    .out0 (simple_wrapped_out0),
    .out0_valid (simple_wrapped_out0_valid),
    .out0_ready (simple_wrapped_out0_ready)
  );

endmodule
