module factorial_wrapper(
  input [7:0] n,
  input  n_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  end_ready,
  output  n_ready,
  output  start_ready,
  output [7:0] out0,
  output  out0_valid,
  output  end_valid
);
  wire [7:0] factorial_wrapped_out0;
  wire  factorial_wrapped_out0_valid;
  wire  factorial_wrapped_out0_ready;
  wire  factorial_wrapped_end_valid;
  wire  factorial_wrapped_end_ready;

  assign out0 = factorial_wrapped_out0;
  assign out0_valid = factorial_wrapped_out0_valid;
  assign factorial_wrapped_out0_ready = out0_ready;
  assign end_valid = factorial_wrapped_end_valid;
  assign factorial_wrapped_end_ready = end_ready;

  factorial factorial_wrapped(
    .n (n),
    .n_valid (n_valid),
    .n_ready (n_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .out0 (factorial_wrapped_out0),
    .out0_valid (factorial_wrapped_out0_valid),
    .out0_ready (factorial_wrapped_out0_ready),
    .end_valid (factorial_wrapped_end_valid),
    .end_ready (factorial_wrapped_end_ready)
  );

endmodule
