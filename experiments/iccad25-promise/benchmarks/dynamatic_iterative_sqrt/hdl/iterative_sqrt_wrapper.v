module iterative_sqrt_wrapper(
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
  wire [7:0] iterative_sqrt_wrapped_out0;
  wire  iterative_sqrt_wrapped_out0_valid;
  wire  iterative_sqrt_wrapped_out0_ready;
  wire  iterative_sqrt_wrapped_end_valid;
  wire  iterative_sqrt_wrapped_end_ready;

  assign out0 = iterative_sqrt_wrapped_out0;
  assign out0_valid = iterative_sqrt_wrapped_out0_valid;
  assign iterative_sqrt_wrapped_out0_ready = out0_ready;
  assign end_valid = iterative_sqrt_wrapped_end_valid;
  assign iterative_sqrt_wrapped_end_ready = end_ready;

  iterative_sqrt iterative_sqrt_wrapped(
    .n (n),
    .n_valid (n_valid),
    .n_ready (n_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .out0 (iterative_sqrt_wrapped_out0),
    .out0_valid (iterative_sqrt_wrapped_out0_valid),
    .out0_ready (iterative_sqrt_wrapped_out0_ready),
    .end_valid (iterative_sqrt_wrapped_end_valid),
    .end_ready (iterative_sqrt_wrapped_end_ready)
  );

endmodule
