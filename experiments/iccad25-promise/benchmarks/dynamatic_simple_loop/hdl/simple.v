module simple(
  input [9:0] arg0,
  input  arg0_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  output  arg0_ready,
  output [9:0] out0,
  output  out0_valid
);
  wire [9:0] merge0_outs;
  wire  merge0_outs_valid;
  wire  merge0_outs_ready;
  wire [9:0] buffer0_outs;
  wire  buffer0_outs_valid;
  wire  buffer0_outs_ready;
  wire [9:0] buffer1_outs;
  wire  buffer1_outs_valid;
  wire  buffer1_outs_ready;
  wire [9:0] fork0_outs_0;
  wire  fork0_outs_0_valid;
  wire  fork0_outs_0_ready;
  wire [9:0] fork0_outs_1;
  wire  fork0_outs_1_valid;
  wire  fork0_outs_1_ready;
  wire [9:0] buffer2_outs;
  wire  buffer2_outs_valid;
  wire  buffer2_outs_ready;
  wire [9:0] buffer3_outs;
  wire  buffer3_outs_valid;
  wire  buffer3_outs_ready;
  wire  source0_outs_valid;
  wire  source0_outs_ready;
  wire [9:0] constant0_outs;
  wire  constant0_outs_valid;
  wire  constant0_outs_ready;
  wire [0:0] cmpi0_result;
  wire  cmpi0_result_valid;
  wire  cmpi0_result_ready;
  wire  source1_outs_valid;
  wire  source1_outs_ready;
  wire [9:0] constant1_outs;
  wire  constant1_outs_valid;
  wire  constant1_outs_ready;
  wire [9:0] addi0_result;
  wire  addi0_result_valid;
  wire  addi0_result_ready;
  wire [9:0] cond_br0_trueOut;
  wire  cond_br0_trueOut_valid;
  wire  cond_br0_trueOut_ready;
  wire [9:0] cond_br0_falseOut;
  wire  cond_br0_falseOut_valid;
  wire  cond_br0_falseOut_ready;

  assign out0 = cond_br0_falseOut;
  assign out0_valid = cond_br0_falseOut_valid;
  assign cond_br0_falseOut_ready = out0_ready;

  merge #(.SIZE(2), .DATA_TYPE(10)) merge0(
    .ins ({cond_br0_trueOut, arg0}),
    .ins_valid ({cond_br0_trueOut_valid, arg0_valid}),
    .ins_ready ({cond_br0_trueOut_ready, arg0_ready}),
    .clk (clk),
    .rst (rst),
    .outs (merge0_outs),
    .outs_valid (merge0_outs_valid),
    .outs_ready (merge0_outs_ready)
  );

  oehb #(.DATA_TYPE(10)) buffer0(
    .ins (merge0_outs),
    .ins_valid (merge0_outs_valid),
    .ins_ready (merge0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer0_outs),
    .outs_valid (buffer0_outs_valid),
    .outs_ready (buffer0_outs_ready)
  );

  tehb #(.DATA_TYPE(10)) buffer1(
    .ins (buffer0_outs),
    .ins_valid (buffer0_outs_valid),
    .ins_ready (buffer0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer1_outs),
    .outs_valid (buffer1_outs_valid),
    .outs_ready (buffer1_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(10)) fork0(
    .ins (buffer1_outs),
    .ins_valid (buffer1_outs_valid),
    .ins_ready (buffer1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork0_outs_1, fork0_outs_0}),
    .outs_valid ({fork0_outs_1_valid, fork0_outs_0_valid}),
    .outs_ready ({fork0_outs_1_ready, fork0_outs_0_ready})
  );

  oehb #(.DATA_TYPE(10)) buffer2(
    .ins (fork0_outs_0),
    .ins_valid (fork0_outs_0_valid),
    .ins_ready (fork0_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer2_outs),
    .outs_valid (buffer2_outs_valid),
    .outs_ready (buffer2_outs_ready)
  );

  oehb #(.DATA_TYPE(10)) buffer3(
    .ins (fork0_outs_1),
    .ins_valid (fork0_outs_1_valid),
    .ins_ready (fork0_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer3_outs),
    .outs_valid (buffer3_outs_valid),
    .outs_ready (buffer3_outs_ready)
  );

  source source0(
    .clk (clk),
    .rst (rst),
    .outs_valid (source0_outs_valid),
    .outs_ready (source0_outs_ready)
  );

  handshake_constant_0 #(.DATA_WIDTH(10)) constant0(
    .ctrl_valid (source0_outs_valid),
    .ctrl_ready (source0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant0_outs),
    .outs_valid (constant0_outs_valid),
    .outs_ready (constant0_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(10)) cmpi0(
    .lhs (buffer2_outs),
    .lhs_valid (buffer2_outs_valid),
    .lhs_ready (buffer2_outs_ready),
    .rhs (constant0_outs),
    .rhs_valid (constant0_outs_valid),
    .rhs_ready (constant0_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi0_result),
    .result_valid (cmpi0_result_valid),
    .result_ready (cmpi0_result_ready)
  );

  source source1(
    .clk (clk),
    .rst (rst),
    .outs_valid (source1_outs_valid),
    .outs_ready (source1_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(10)) constant1(
    .ctrl_valid (source1_outs_valid),
    .ctrl_ready (source1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant1_outs),
    .outs_valid (constant1_outs_valid),
    .outs_ready (constant1_outs_ready)
  );

  addi #(.DATA_TYPE(10)) addi0(
    .lhs (constant1_outs),
    .lhs_valid (constant1_outs_valid),
    .lhs_ready (constant1_outs_ready),
    .rhs (buffer3_outs),
    .rhs_valid (buffer3_outs_valid),
    .rhs_ready (buffer3_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi0_result),
    .result_valid (addi0_result_valid),
    .result_ready (addi0_result_ready)
  );

  cond_br #(.DATA_TYPE(10)) cond_br0(
    .condition (cmpi0_result),
    .condition_valid (cmpi0_result_valid),
    .condition_ready (cmpi0_result_ready),
    .data (addi0_result),
    .data_valid (addi0_result_valid),
    .data_ready (addi0_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br0_trueOut),
    .trueOut_valid (cond_br0_trueOut_valid),
    .trueOut_ready (cond_br0_trueOut_ready),
    .falseOut (cond_br0_falseOut),
    .falseOut_valid (cond_br0_falseOut_valid),
    .falseOut_ready (cond_br0_falseOut_ready)
  );

endmodule
