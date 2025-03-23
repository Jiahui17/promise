module iterative_division_wrapper(
  input [7:0] dividend,
  input  dividend_valid,
  input [7:0] divisor,
  input  divisor_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  end_ready,
  output  dividend_ready,
  output  divisor_ready,
  output  start_ready,
  output [7:0] out0,
  output  out0_valid,
  output  end_valid
);
  wire [7:0] iterative_division_wrapped_out0;
  wire  iterative_division_wrapped_out0_valid;
  wire  iterative_division_wrapped_out0_ready;
  wire  iterative_division_wrapped_end_valid;
  wire  iterative_division_wrapped_end_ready;

  assign out0 = iterative_division_wrapped_out0;
  assign out0_valid = iterative_division_wrapped_out0_valid;
  assign iterative_division_wrapped_out0_ready = out0_ready;
  assign end_valid = iterative_division_wrapped_end_valid;
  assign iterative_division_wrapped_end_ready = end_ready;

  iterative_division iterative_division_wrapped(
    .dividend (dividend),
    .dividend_valid (dividend_valid),
    .dividend_ready (dividend_ready),
    .divisor (divisor),
    .divisor_valid (divisor_valid),
    .divisor_ready (divisor_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .out0 (iterative_division_wrapped_out0),
    .out0_valid (iterative_division_wrapped_out0_valid),
    .out0_ready (iterative_division_wrapped_out0_ready),
    .end_valid (iterative_division_wrapped_end_valid),
    .end_ready (iterative_division_wrapped_end_ready)
  );

endmodule
