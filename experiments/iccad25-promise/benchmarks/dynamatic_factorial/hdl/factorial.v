module factorial(
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
  wire  fork0_outs_0_valid;
  wire  fork0_outs_0_ready;
  wire  fork0_outs_1_valid;
  wire  fork0_outs_1_ready;
  wire  fork0_outs_2_valid;
  wire  fork0_outs_2_ready;
  wire [1:0] constant1_outs;
  wire  constant1_outs_valid;
  wire  constant1_outs_ready;
  wire [7:0] extsi9_outs;
  wire  extsi9_outs_valid;
  wire  extsi9_outs_ready;
  wire [7:0] mux0_outs;
  wire  mux0_outs_valid;
  wire  mux0_outs_ready;
  wire [7:0] mux1_outs;
  wire  mux1_outs_valid;
  wire  mux1_outs_ready;
  wire [7:0] buffer2_outs;
  wire  buffer2_outs_valid;
  wire  buffer2_outs_ready;
  wire [7:0] buffer3_outs;
  wire  buffer3_outs_valid;
  wire  buffer3_outs_ready;
  wire [7:0] fork1_outs_0;
  wire  fork1_outs_0_valid;
  wire  fork1_outs_0_ready;
  wire [7:0] fork1_outs_1;
  wire  fork1_outs_1_valid;
  wire  fork1_outs_1_ready;
  wire [7:0] fork1_outs_2;
  wire  fork1_outs_2_valid;
  wire  fork1_outs_2_ready;
  wire  control_merge0_outs_valid;
  wire  control_merge0_outs_ready;
  wire [0:0] control_merge0_index;
  wire  control_merge0_index_valid;
  wire  control_merge0_index_ready;
  wire [0:0] fork2_outs_0;
  wire  fork2_outs_0_valid;
  wire  fork2_outs_0_ready;
  wire [0:0] fork2_outs_1;
  wire  fork2_outs_1_valid;
  wire  fork2_outs_1_ready;
  wire  source0_outs_valid;
  wire  source0_outs_ready;
  wire [2:0] constant2_outs;
  wire  constant2_outs_valid;
  wire  constant2_outs_ready;
  wire [7:0] extsi10_outs;
  wire  extsi10_outs_valid;
  wire  extsi10_outs_ready;
  wire [0:0] cmpi0_result;
  wire  cmpi0_result_valid;
  wire  cmpi0_result_ready;
  wire [0:0] fork3_outs_0;
  wire  fork3_outs_0_valid;
  wire  fork3_outs_0_ready;
  wire [0:0] fork3_outs_1;
  wire  fork3_outs_1_valid;
  wire  fork3_outs_1_ready;
  wire [0:0] fork3_outs_2;
  wire  fork3_outs_2_valid;
  wire  fork3_outs_2_ready;
  wire [0:0] fork3_outs_3;
  wire  fork3_outs_3_valid;
  wire  fork3_outs_3_ready;
  wire [0:0] fork3_outs_4;
  wire  fork3_outs_4_valid;
  wire  fork3_outs_4_ready;
  wire [0:0] fork3_outs_5;
  wire  fork3_outs_5_valid;
  wire  fork3_outs_5_ready;
  wire [7:0] buffer0_outs;
  wire  buffer0_outs_valid;
  wire  buffer0_outs_ready;
  wire [7:0] buffer1_outs;
  wire  buffer1_outs_valid;
  wire  buffer1_outs_ready;
  wire [7:0] cond_br3_trueOut;
  wire  cond_br3_trueOut_valid;
  wire  cond_br3_trueOut_ready;
  wire [7:0] cond_br3_falseOut;
  wire  cond_br3_falseOut_valid;
  wire  cond_br3_falseOut_ready;
  wire [7:0] fork4_outs_0;
  wire  fork4_outs_0_valid;
  wire  fork4_outs_0_ready;
  wire [7:0] fork4_outs_1;
  wire  fork4_outs_1_valid;
  wire  fork4_outs_1_ready;
  wire [7:0] cond_br4_trueOut;
  wire  cond_br4_trueOut_valid;
  wire  cond_br4_trueOut_ready;
  wire [7:0] cond_br4_falseOut;
  wire  cond_br4_falseOut_valid;
  wire  cond_br4_falseOut_ready;
  wire [0:0] cond_br5_trueOut;
  wire  cond_br5_trueOut_valid;
  wire  cond_br5_trueOut_ready;
  wire [0:0] cond_br5_falseOut;
  wire  cond_br5_falseOut_valid;
  wire  cond_br5_falseOut_ready;
  wire  buffer4_outs_valid;
  wire  buffer4_outs_ready;
  wire  buffer5_outs_valid;
  wire  buffer5_outs_ready;
  wire  cond_br6_trueOut_valid;
  wire  cond_br6_trueOut_ready;
  wire  cond_br6_falseOut_valid;
  wire  cond_br6_falseOut_ready;
  wire [7:0] cond_br7_trueOut;
  wire  cond_br7_trueOut_valid;
  wire  cond_br7_trueOut_ready;
  wire [7:0] cond_br7_falseOut;
  wire  cond_br7_falseOut_valid;
  wire  cond_br7_falseOut_ready;
  wire [7:0] fork5_outs_0;
  wire  fork5_outs_0_valid;
  wire  fork5_outs_0_ready;
  wire [7:0] fork5_outs_1;
  wire  fork5_outs_1_valid;
  wire  fork5_outs_1_ready;
  wire [7:0] buffer6_outs;
  wire  buffer6_outs_valid;
  wire  buffer6_outs_ready;
  wire [7:0] buffer7_outs;
  wire  buffer7_outs_valid;
  wire  buffer7_outs_ready;
  wire [15:0] extsi11_outs;
  wire  extsi11_outs_valid;
  wire  extsi11_outs_ready;
  wire [7:0] buffer8_outs;
  wire  buffer8_outs_valid;
  wire  buffer8_outs_ready;
  wire [7:0] buffer9_outs;
  wire  buffer9_outs_valid;
  wire  buffer9_outs_ready;
  wire [7:0] fork6_outs_0;
  wire  fork6_outs_0_valid;
  wire  fork6_outs_0_ready;
  wire [7:0] fork6_outs_1;
  wire  fork6_outs_1_valid;
  wire  fork6_outs_1_ready;
  wire [7:0] fork6_outs_2;
  wire  fork6_outs_2_valid;
  wire  fork6_outs_2_ready;
  wire [15:0] extsi12_outs;
  wire  extsi12_outs_valid;
  wire  extsi12_outs_ready;
  wire [31:0] extsi13_outs;
  wire  extsi13_outs_valid;
  wire  extsi13_outs_ready;
  wire [31:0] fork7_outs_0;
  wire  fork7_outs_0_valid;
  wire  fork7_outs_0_ready;
  wire [31:0] fork7_outs_1;
  wire  fork7_outs_1_valid;
  wire  fork7_outs_1_ready;
  wire  buffer12_outs_valid;
  wire  buffer12_outs_ready;
  wire  buffer13_outs_valid;
  wire  buffer13_outs_ready;
  wire  fork8_outs_0_valid;
  wire  fork8_outs_0_ready;
  wire  fork8_outs_1_valid;
  wire  fork8_outs_1_ready;
  wire  source1_outs_valid;
  wire  source1_outs_ready;
  wire [31:0] constant7_outs;
  wire  constant7_outs_valid;
  wire  constant7_outs_ready;
  wire  source2_outs_valid;
  wire  source2_outs_ready;
  wire [31:0] constant8_outs;
  wire  constant8_outs_valid;
  wire  constant8_outs_ready;
  wire [7:0] trunci4_outs;
  wire  trunci4_outs_valid;
  wire  trunci4_outs_ready;
  wire  source3_outs_valid;
  wire  source3_outs_ready;
  wire [31:0] constant9_outs;
  wire  constant9_outs_valid;
  wire  constant9_outs_ready;
  wire [15:0] muli0_result;
  wire  muli0_result_valid;
  wire  muli0_result_ready;
  wire [31:0] extsi14_outs;
  wire  extsi14_outs_valid;
  wire  extsi14_outs_ready;
  wire [31:0] addi0_result;
  wire  addi0_result_valid;
  wire  addi0_result_ready;
  wire [31:0] muli1_result;
  wire  muli1_result_valid;
  wire  muli1_result_ready;
  wire [31:0] addi1_result;
  wire  addi1_result_valid;
  wire  addi1_result_ready;
  wire [31:0] muli2_result;
  wire  muli2_result_valid;
  wire  muli2_result_ready;
  wire [7:0] trunci0_outs;
  wire  trunci0_outs_valid;
  wire  trunci0_outs_ready;
  wire [7:0] addi2_result;
  wire  addi2_result_valid;
  wire  addi2_result_ready;
  wire [0:0] constant3_outs;
  wire  constant3_outs_valid;
  wire  constant3_outs_ready;
  wire [7:0] extsi15_outs;
  wire  extsi15_outs_valid;
  wire  extsi15_outs_ready;
  wire [7:0] fork9_outs_0;
  wire  fork9_outs_0_valid;
  wire  fork9_outs_0_ready;
  wire [7:0] fork9_outs_1;
  wire  fork9_outs_1_valid;
  wire  fork9_outs_1_ready;
  wire [0:0] buffer10_outs;
  wire  buffer10_outs_valid;
  wire  buffer10_outs_ready;
  wire [0:0] buffer11_outs;
  wire  buffer11_outs_valid;
  wire  buffer11_outs_ready;
  wire [7:0] mux2_outs;
  wire  mux2_outs_valid;
  wire  mux2_outs_ready;
  wire [7:0] mux3_outs;
  wire  mux3_outs_valid;
  wire  mux3_outs_ready;
  wire [7:0] mux4_outs;
  wire  mux4_outs_valid;
  wire  mux4_outs_ready;
  wire [7:0] mux5_outs;
  wire  mux5_outs_valid;
  wire  mux5_outs_ready;
  wire [0:0] mux6_outs;
  wire  mux6_outs_valid;
  wire  mux6_outs_ready;
  wire [0:0] buffer22_outs;
  wire  buffer22_outs_valid;
  wire  buffer22_outs_ready;
  wire [0:0] buffer23_outs;
  wire  buffer23_outs_valid;
  wire  buffer23_outs_ready;
  wire [0:0] fork10_outs_0;
  wire  fork10_outs_0_valid;
  wire  fork10_outs_0_ready;
  wire [0:0] fork10_outs_1;
  wire  fork10_outs_1_valid;
  wire  fork10_outs_1_ready;
  wire [0:0] fork10_outs_2;
  wire  fork10_outs_2_valid;
  wire  fork10_outs_2_ready;
  wire [0:0] fork10_outs_3;
  wire  fork10_outs_3_valid;
  wire  fork10_outs_3_ready;
  wire [0:0] fork10_outs_4;
  wire  fork10_outs_4_valid;
  wire  fork10_outs_4_ready;
  wire  control_merge2_outs_valid;
  wire  control_merge2_outs_ready;
  wire [0:0] control_merge2_index;
  wire  control_merge2_index_valid;
  wire  control_merge2_index_ready;
  wire [0:0] fork11_outs_0;
  wire  fork11_outs_0_valid;
  wire  fork11_outs_0_ready;
  wire [0:0] fork11_outs_1;
  wire  fork11_outs_1_valid;
  wire  fork11_outs_1_ready;
  wire [0:0] fork11_outs_2;
  wire  fork11_outs_2_valid;
  wire  fork11_outs_2_ready;
  wire [0:0] fork11_outs_3;
  wire  fork11_outs_3_valid;
  wire  fork11_outs_3_ready;
  wire [0:0] fork11_outs_4;
  wire  fork11_outs_4_valid;
  wire  fork11_outs_4_ready;
  wire [7:0] buffer14_outs;
  wire  buffer14_outs_valid;
  wire  buffer14_outs_ready;
  wire [7:0] buffer15_outs;
  wire  buffer15_outs_valid;
  wire  buffer15_outs_ready;
  wire [7:0] cond_br8_trueOut;
  wire  cond_br8_trueOut_valid;
  wire  cond_br8_trueOut_ready;
  wire [7:0] cond_br8_falseOut;
  wire  cond_br8_falseOut_valid;
  wire  cond_br8_falseOut_ready;
  wire [7:0] buffer16_outs;
  wire  buffer16_outs_valid;
  wire  buffer16_outs_ready;
  wire [7:0] buffer17_outs;
  wire  buffer17_outs_valid;
  wire  buffer17_outs_ready;
  wire [7:0] cond_br9_trueOut;
  wire  cond_br9_trueOut_valid;
  wire  cond_br9_trueOut_ready;
  wire [7:0] cond_br9_falseOut;
  wire  cond_br9_falseOut_valid;
  wire  cond_br9_falseOut_ready;
  wire  buffer24_outs_valid;
  wire  buffer24_outs_ready;
  wire  buffer25_outs_valid;
  wire  buffer25_outs_ready;
  wire  cond_br10_trueOut_valid;
  wire  cond_br10_trueOut_ready;
  wire  cond_br10_falseOut_valid;
  wire  cond_br10_falseOut_ready;
  wire [7:0] buffer18_outs;
  wire  buffer18_outs_valid;
  wire  buffer18_outs_ready;
  wire [7:0] buffer19_outs;
  wire  buffer19_outs_valid;
  wire  buffer19_outs_ready;
  wire [7:0] cond_br11_trueOut;
  wire  cond_br11_trueOut_valid;
  wire  cond_br11_trueOut_ready;
  wire [7:0] cond_br11_falseOut;
  wire  cond_br11_falseOut_valid;
  wire  cond_br11_falseOut_ready;
  wire [7:0] buffer20_outs;
  wire  buffer20_outs_valid;
  wire  buffer20_outs_ready;
  wire [7:0] buffer21_outs;
  wire  buffer21_outs_valid;
  wire  buffer21_outs_ready;
  wire [7:0] cond_br12_trueOut;
  wire  cond_br12_trueOut_valid;
  wire  cond_br12_trueOut_ready;
  wire [7:0] cond_br12_falseOut;
  wire  cond_br12_falseOut_valid;
  wire  cond_br12_falseOut_ready;
  wire [7:0] mux7_outs;
  wire  mux7_outs_valid;
  wire  mux7_outs_ready;
  wire [7:0] mux8_outs;
  wire  mux8_outs_valid;
  wire  mux8_outs_ready;
  wire [7:0] buffer28_outs;
  wire  buffer28_outs_valid;
  wire  buffer28_outs_ready;
  wire [7:0] buffer29_outs;
  wire  buffer29_outs_valid;
  wire  buffer29_outs_ready;
  wire [7:0] fork12_outs_0;
  wire  fork12_outs_0_valid;
  wire  fork12_outs_0_ready;
  wire [7:0] fork12_outs_1;
  wire  fork12_outs_1_valid;
  wire  fork12_outs_1_ready;
  wire  control_merge3_outs_valid;
  wire  control_merge3_outs_ready;
  wire [0:0] control_merge3_index;
  wire  control_merge3_index_valid;
  wire  control_merge3_index_ready;
  wire [0:0] fork13_outs_0;
  wire  fork13_outs_0_valid;
  wire  fork13_outs_0_ready;
  wire [0:0] fork13_outs_1;
  wire  fork13_outs_1_valid;
  wire  fork13_outs_1_ready;
  wire  source4_outs_valid;
  wire  source4_outs_ready;
  wire [0:0] constant4_outs;
  wire  constant4_outs_valid;
  wire  constant4_outs_ready;
  wire [7:0] extsi16_outs;
  wire  extsi16_outs_valid;
  wire  extsi16_outs_ready;
  wire [0:0] cmpi1_result;
  wire  cmpi1_result_valid;
  wire  cmpi1_result_ready;
  wire [0:0] fork14_outs_0;
  wire  fork14_outs_0_valid;
  wire  fork14_outs_0_ready;
  wire [0:0] fork14_outs_1;
  wire  fork14_outs_1_valid;
  wire  fork14_outs_1_ready;
  wire [0:0] fork14_outs_2;
  wire  fork14_outs_2_valid;
  wire  fork14_outs_2_ready;
  wire [7:0] buffer26_outs;
  wire  buffer26_outs_valid;
  wire  buffer26_outs_ready;
  wire [7:0] buffer27_outs;
  wire  buffer27_outs_valid;
  wire  buffer27_outs_ready;
  wire [7:0] cond_br13_trueOut;
  wire  cond_br13_trueOut_valid;
  wire  cond_br13_trueOut_ready;
  wire [7:0] cond_br13_falseOut;
  wire  cond_br13_falseOut_valid;
  wire  cond_br13_falseOut_ready;
  wire [7:0] cond_br14_trueOut;
  wire  cond_br14_trueOut_valid;
  wire  cond_br14_trueOut_ready;
  wire [7:0] cond_br14_falseOut;
  wire  cond_br14_falseOut_valid;
  wire  cond_br14_falseOut_ready;
  wire  buffer30_outs_valid;
  wire  buffer30_outs_ready;
  wire  buffer31_outs_valid;
  wire  buffer31_outs_ready;
  wire  cond_br15_trueOut_valid;
  wire  cond_br15_trueOut_ready;
  wire  cond_br15_falseOut_valid;
  wire  cond_br15_falseOut_ready;
  wire [7:0] buffer32_outs;
  wire  buffer32_outs_valid;
  wire  buffer32_outs_ready;
  wire [7:0] buffer33_outs;
  wire  buffer33_outs_valid;
  wire  buffer33_outs_ready;
  wire [15:0] extsi17_outs;
  wire  extsi17_outs_valid;
  wire  extsi17_outs_ready;
  wire [7:0] buffer34_outs;
  wire  buffer34_outs_valid;
  wire  buffer34_outs_ready;
  wire [7:0] buffer35_outs;
  wire  buffer35_outs_valid;
  wire  buffer35_outs_ready;
  wire [7:0] fork15_outs_0;
  wire  fork15_outs_0_valid;
  wire  fork15_outs_0_ready;
  wire [7:0] fork15_outs_1;
  wire  fork15_outs_1_valid;
  wire  fork15_outs_1_ready;
  wire [15:0] extsi18_outs;
  wire  extsi18_outs_valid;
  wire  extsi18_outs_ready;
  wire  source5_outs_valid;
  wire  source5_outs_ready;
  wire [31:0] constant11_outs;
  wire  constant11_outs_valid;
  wire  constant11_outs_ready;
  wire [7:0] trunci5_outs;
  wire  trunci5_outs_valid;
  wire  trunci5_outs_ready;
  wire [15:0] muli3_result;
  wire  muli3_result_valid;
  wire  muli3_result_ready;
  wire [7:0] trunci2_outs;
  wire  trunci2_outs_valid;
  wire  trunci2_outs_ready;
  wire [7:0] addi3_result;
  wire  addi3_result_valid;
  wire  addi3_result_ready;
  wire  buffer36_outs_valid;
  wire  buffer36_outs_ready;
  wire  buffer37_outs_valid;
  wire  buffer37_outs_ready;
  wire [7:0] buffer38_outs;
  wire  buffer38_outs_valid;
  wire  buffer38_outs_ready;
  wire [7:0] buffer39_outs;
  wire  buffer39_outs_valid;
  wire  buffer39_outs_ready;

  assign out0 = buffer39_outs;
  assign out0_valid = buffer39_outs_valid;
  assign buffer39_outs_ready = out0_ready;
  assign end_valid = fork0_outs_1_valid;
  assign fork0_outs_1_ready = end_ready;

  fork_dataless #(.SIZE(3)) fork0(
    .ins_valid (start_valid),
    .ins_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(2)) constant1(
    .ctrl_valid (fork0_outs_0_valid),
    .ctrl_ready (fork0_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant1_outs),
    .outs_valid (constant1_outs_valid),
    .outs_ready (constant1_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(8)) extsi9(
    .ins (constant1_outs),
    .ins_valid (constant1_outs_valid),
    .ins_ready (constant1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi9_outs),
    .outs_valid (extsi9_outs_valid),
    .outs_ready (extsi9_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux0(
    .index (fork2_outs_0),
    .index_valid (fork2_outs_0_valid),
    .index_ready (fork2_outs_0_ready),
    .ins ({cond_br8_trueOut, extsi9_outs}),
    .ins_valid ({cond_br8_trueOut_valid, extsi9_outs_valid}),
    .ins_ready ({cond_br8_trueOut_ready, extsi9_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux0_outs),
    .outs_valid (mux0_outs_valid),
    .outs_ready (mux0_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux1(
    .index (fork2_outs_1),
    .index_valid (fork2_outs_1_valid),
    .index_ready (fork2_outs_1_ready),
    .ins ({cond_br9_trueOut, n}),
    .ins_valid ({cond_br9_trueOut_valid, n_valid}),
    .ins_ready ({cond_br9_trueOut_ready, n_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux1_outs),
    .outs_valid (mux1_outs_valid),
    .outs_ready (mux1_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer2(
    .ins (mux1_outs),
    .ins_valid (mux1_outs_valid),
    .ins_ready (mux1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer2_outs),
    .outs_valid (buffer2_outs_valid),
    .outs_ready (buffer2_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer3(
    .ins (buffer2_outs),
    .ins_valid (buffer2_outs_valid),
    .ins_ready (buffer2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer3_outs),
    .outs_valid (buffer3_outs_valid),
    .outs_ready (buffer3_outs_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(8)) fork1(
    .ins (buffer3_outs),
    .ins_valid (buffer3_outs_valid),
    .ins_ready (buffer3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork1_outs_2, fork1_outs_1, fork1_outs_0}),
    .outs_valid ({fork1_outs_2_valid, fork1_outs_1_valid, fork1_outs_0_valid}),
    .outs_ready ({fork1_outs_2_ready, fork1_outs_1_ready, fork1_outs_0_ready})
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .ins_valid ({cond_br10_trueOut_valid, fork0_outs_2_valid}),
    .ins_ready ({cond_br10_trueOut_ready, fork0_outs_2_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge0_outs_valid),
    .outs_ready (control_merge0_outs_ready),
    .index (control_merge0_index),
    .index_valid (control_merge0_index_valid),
    .index_ready (control_merge0_index_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork2(
    .ins (control_merge0_index),
    .ins_valid (control_merge0_index_valid),
    .ins_ready (control_merge0_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork2_outs_1, fork2_outs_0}),
    .outs_valid ({fork2_outs_1_valid, fork2_outs_0_valid}),
    .outs_ready ({fork2_outs_1_ready, fork2_outs_0_ready})
  );

  source source0(
    .clk (clk),
    .rst (rst),
    .outs_valid (source0_outs_valid),
    .outs_ready (source0_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(3)) constant2(
    .ctrl_valid (source0_outs_valid),
    .ctrl_ready (source0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant2_outs),
    .outs_valid (constant2_outs_valid),
    .outs_ready (constant2_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(8)) extsi10(
    .ins (constant2_outs),
    .ins_valid (constant2_outs_valid),
    .ins_ready (constant2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi10_outs),
    .outs_valid (extsi10_outs_valid),
    .outs_ready (extsi10_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(8)) cmpi0(
    .lhs (fork1_outs_0),
    .lhs_valid (fork1_outs_0_valid),
    .lhs_ready (fork1_outs_0_ready),
    .rhs (extsi10_outs),
    .rhs_valid (extsi10_outs_valid),
    .rhs_ready (extsi10_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi0_result),
    .result_valid (cmpi0_result_valid),
    .result_ready (cmpi0_result_ready)
  );

  fork_type #(.SIZE(6), .DATA_TYPE(1)) fork3(
    .ins (cmpi0_result),
    .ins_valid (cmpi0_result_valid),
    .ins_ready (cmpi0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork3_outs_5, fork3_outs_4, fork3_outs_3, fork3_outs_2, fork3_outs_1, fork3_outs_0}),
    .outs_valid ({fork3_outs_5_valid, fork3_outs_4_valid, fork3_outs_3_valid, fork3_outs_2_valid, fork3_outs_1_valid, fork3_outs_0_valid}),
    .outs_ready ({fork3_outs_5_ready, fork3_outs_4_ready, fork3_outs_3_ready, fork3_outs_2_ready, fork3_outs_1_ready, fork3_outs_0_ready})
  );

  oehb #(.DATA_TYPE(8)) buffer0(
    .ins (mux0_outs),
    .ins_valid (mux0_outs_valid),
    .ins_ready (mux0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer0_outs),
    .outs_valid (buffer0_outs_valid),
    .outs_ready (buffer0_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer1(
    .ins (buffer0_outs),
    .ins_valid (buffer0_outs_valid),
    .ins_ready (buffer0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer1_outs),
    .outs_valid (buffer1_outs_valid),
    .outs_ready (buffer1_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br3(
    .condition (fork3_outs_0),
    .condition_valid (fork3_outs_0_valid),
    .condition_ready (fork3_outs_0_ready),
    .data (buffer1_outs),
    .data_valid (buffer1_outs_valid),
    .data_ready (buffer1_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br3_trueOut),
    .trueOut_valid (cond_br3_trueOut_valid),
    .trueOut_ready (cond_br3_trueOut_ready),
    .falseOut (cond_br3_falseOut),
    .falseOut_valid (cond_br3_falseOut_valid),
    .falseOut_ready (cond_br3_falseOut_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork4(
    .ins (cond_br3_falseOut),
    .ins_valid (cond_br3_falseOut_valid),
    .ins_ready (cond_br3_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork4_outs_1, fork4_outs_0}),
    .outs_valid ({fork4_outs_1_valid, fork4_outs_0_valid}),
    .outs_ready ({fork4_outs_1_ready, fork4_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(8)) cond_br4(
    .condition (fork3_outs_5),
    .condition_valid (fork3_outs_5_valid),
    .condition_ready (fork3_outs_5_ready),
    .data (fork1_outs_1),
    .data_valid (fork1_outs_1_valid),
    .data_ready (fork1_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br4_trueOut),
    .trueOut_valid (cond_br4_trueOut_valid),
    .trueOut_ready (cond_br4_trueOut_ready),
    .falseOut (cond_br4_falseOut),
    .falseOut_valid (cond_br4_falseOut_valid),
    .falseOut_ready (cond_br4_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink0(
    .ins (cond_br4_falseOut),
    .ins_valid (cond_br4_falseOut_valid),
    .ins_ready (cond_br4_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(1)) cond_br5(
    .condition (fork3_outs_1),
    .condition_valid (fork3_outs_1_valid),
    .condition_ready (fork3_outs_1_ready),
    .data (fork3_outs_2),
    .data_valid (fork3_outs_2_valid),
    .data_ready (fork3_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br5_trueOut),
    .trueOut_valid (cond_br5_trueOut_valid),
    .trueOut_ready (cond_br5_trueOut_ready),
    .falseOut (cond_br5_falseOut),
    .falseOut_valid (cond_br5_falseOut_valid),
    .falseOut_ready (cond_br5_falseOut_ready)
  );

  oehb_dataless buffer4(
    .ins_valid (control_merge0_outs_valid),
    .ins_ready (control_merge0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer4_outs_valid),
    .outs_ready (buffer4_outs_ready)
  );

  tehb_dataless buffer5(
    .ins_valid (buffer4_outs_valid),
    .ins_ready (buffer4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer5_outs_valid),
    .outs_ready (buffer5_outs_ready)
  );

  cond_br_dataless cond_br6(
    .condition (fork3_outs_3),
    .condition_valid (fork3_outs_3_valid),
    .condition_ready (fork3_outs_3_ready),
    .data_valid (buffer5_outs_valid),
    .data_ready (buffer5_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br6_trueOut_valid),
    .trueOut_ready (cond_br6_trueOut_ready),
    .falseOut_valid (cond_br6_falseOut_valid),
    .falseOut_ready (cond_br6_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br7(
    .condition (fork3_outs_4),
    .condition_valid (fork3_outs_4_valid),
    .condition_ready (fork3_outs_4_ready),
    .data (fork1_outs_2),
    .data_valid (fork1_outs_2_valid),
    .data_ready (fork1_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br7_trueOut),
    .trueOut_valid (cond_br7_trueOut_valid),
    .trueOut_ready (cond_br7_trueOut_ready),
    .falseOut (cond_br7_falseOut),
    .falseOut_valid (cond_br7_falseOut_valid),
    .falseOut_ready (cond_br7_falseOut_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork5(
    .ins (cond_br7_falseOut),
    .ins_valid (cond_br7_falseOut_valid),
    .ins_ready (cond_br7_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork5_outs_1, fork5_outs_0}),
    .outs_valid ({fork5_outs_1_valid, fork5_outs_0_valid}),
    .outs_ready ({fork5_outs_1_ready, fork5_outs_0_ready})
  );

  sink #(.DATA_TYPE(8)) sink1(
    .ins (cond_br7_trueOut),
    .ins_valid (cond_br7_trueOut_valid),
    .ins_ready (cond_br7_trueOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer6(
    .ins (cond_br3_trueOut),
    .ins_valid (cond_br3_trueOut_valid),
    .ins_ready (cond_br3_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer6_outs),
    .outs_valid (buffer6_outs_valid),
    .outs_ready (buffer6_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer7(
    .ins (buffer6_outs),
    .ins_valid (buffer6_outs_valid),
    .ins_ready (buffer6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer7_outs),
    .outs_valid (buffer7_outs_valid),
    .outs_ready (buffer7_outs_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi11(
    .ins (buffer7_outs),
    .ins_valid (buffer7_outs_valid),
    .ins_ready (buffer7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi11_outs),
    .outs_valid (extsi11_outs_valid),
    .outs_ready (extsi11_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer8(
    .ins (cond_br4_trueOut),
    .ins_valid (cond_br4_trueOut_valid),
    .ins_ready (cond_br4_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer8_outs),
    .outs_valid (buffer8_outs_valid),
    .outs_ready (buffer8_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer9(
    .ins (buffer8_outs),
    .ins_valid (buffer8_outs_valid),
    .ins_ready (buffer8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer9_outs),
    .outs_valid (buffer9_outs_valid),
    .outs_ready (buffer9_outs_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(8)) fork6(
    .ins (buffer9_outs),
    .ins_valid (buffer9_outs_valid),
    .ins_ready (buffer9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork6_outs_2, fork6_outs_1, fork6_outs_0}),
    .outs_valid ({fork6_outs_2_valid, fork6_outs_1_valid, fork6_outs_0_valid}),
    .outs_ready ({fork6_outs_2_ready, fork6_outs_1_ready, fork6_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi12(
    .ins (fork6_outs_1),
    .ins_valid (fork6_outs_1_valid),
    .ins_ready (fork6_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi12_outs),
    .outs_valid (extsi12_outs_valid),
    .outs_ready (extsi12_outs_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(32)) extsi13(
    .ins (fork6_outs_2),
    .ins_valid (fork6_outs_2_valid),
    .ins_ready (fork6_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi13_outs),
    .outs_valid (extsi13_outs_valid),
    .outs_ready (extsi13_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork7(
    .ins (extsi13_outs),
    .ins_valid (extsi13_outs_valid),
    .ins_ready (extsi13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork7_outs_1, fork7_outs_0}),
    .outs_valid ({fork7_outs_1_valid, fork7_outs_0_valid}),
    .outs_ready ({fork7_outs_1_ready, fork7_outs_0_ready})
  );

  oehb_dataless buffer12(
    .ins_valid (cond_br6_trueOut_valid),
    .ins_ready (cond_br6_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer12_outs_valid),
    .outs_ready (buffer12_outs_ready)
  );

  tehb_dataless buffer13(
    .ins_valid (buffer12_outs_valid),
    .ins_ready (buffer12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer13_outs_valid),
    .outs_ready (buffer13_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork8(
    .ins_valid (buffer13_outs_valid),
    .ins_ready (buffer13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork8_outs_1_valid, fork8_outs_0_valid}),
    .outs_ready ({fork8_outs_1_ready, fork8_outs_0_ready})
  );

  source source1(
    .clk (clk),
    .rst (rst),
    .outs_valid (source1_outs_valid),
    .outs_ready (source1_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(32)) constant7(
    .ctrl_valid (source1_outs_valid),
    .ctrl_ready (source1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant7_outs),
    .outs_valid (constant7_outs_valid),
    .outs_ready (constant7_outs_ready)
  );

  source source2(
    .clk (clk),
    .rst (rst),
    .outs_valid (source2_outs_valid),
    .outs_ready (source2_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(32)) constant8(
    .ctrl_valid (source2_outs_valid),
    .ctrl_ready (source2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant8_outs),
    .outs_valid (constant8_outs_valid),
    .outs_ready (constant8_outs_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci4(
    .ins (constant8_outs),
    .ins_valid (constant8_outs_valid),
    .ins_ready (constant8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci4_outs),
    .outs_valid (trunci4_outs_valid),
    .outs_ready (trunci4_outs_ready)
  );

  source source3(
    .clk (clk),
    .rst (rst),
    .outs_valid (source3_outs_valid),
    .outs_ready (source3_outs_ready)
  );

  handshake_constant_4 #(.DATA_WIDTH(32)) constant9(
    .ctrl_valid (source3_outs_valid),
    .ctrl_ready (source3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant9_outs),
    .outs_valid (constant9_outs_valid),
    .outs_ready (constant9_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli0(
    .lhs (extsi11_outs),
    .lhs_valid (extsi11_outs_valid),
    .lhs_ready (extsi11_outs_ready),
    .rhs (extsi12_outs),
    .rhs_valid (extsi12_outs_valid),
    .rhs_ready (extsi12_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli0_result),
    .result_valid (muli0_result_valid),
    .result_ready (muli0_result_ready)
  );

  extsi #(.INPUT_TYPE(16), .OUTPUT_TYPE(32)) extsi14(
    .ins (muli0_result),
    .ins_valid (muli0_result_valid),
    .ins_ready (muli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi14_outs),
    .outs_valid (extsi14_outs_valid),
    .outs_ready (extsi14_outs_ready)
  );

  addi #(.DATA_TYPE(32)) addi0(
    .lhs (fork7_outs_0),
    .lhs_valid (fork7_outs_0_valid),
    .lhs_ready (fork7_outs_0_ready),
    .rhs (constant9_outs),
    .rhs_valid (constant9_outs_valid),
    .rhs_ready (constant9_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi0_result),
    .result_valid (addi0_result_valid),
    .result_ready (addi0_result_ready)
  );

  muli #(.DATA_TYPE(32)) muli1(
    .lhs (extsi14_outs),
    .lhs_valid (extsi14_outs_valid),
    .lhs_ready (extsi14_outs_ready),
    .rhs (addi0_result),
    .rhs_valid (addi0_result_valid),
    .rhs_ready (addi0_result_ready),
    .clk (clk),
    .rst (rst),
    .result (muli1_result),
    .result_valid (muli1_result_valid),
    .result_ready (muli1_result_ready)
  );

  addi #(.DATA_TYPE(32)) addi1(
    .lhs (fork7_outs_1),
    .lhs_valid (fork7_outs_1_valid),
    .lhs_ready (fork7_outs_1_ready),
    .rhs (constant7_outs),
    .rhs_valid (constant7_outs_valid),
    .rhs_ready (constant7_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi1_result),
    .result_valid (addi1_result_valid),
    .result_ready (addi1_result_ready)
  );

  muli #(.DATA_TYPE(32)) muli2(
    .lhs (muli1_result),
    .lhs_valid (muli1_result_valid),
    .lhs_ready (muli1_result_ready),
    .rhs (addi1_result),
    .rhs_valid (addi1_result_valid),
    .rhs_ready (addi1_result_ready),
    .clk (clk),
    .rst (rst),
    .result (muli2_result),
    .result_valid (muli2_result_valid),
    .result_ready (muli2_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci0(
    .ins (muli2_result),
    .ins_valid (muli2_result_valid),
    .ins_ready (muli2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci0_outs),
    .outs_valid (trunci0_outs_valid),
    .outs_ready (trunci0_outs_ready)
  );

  addi #(.DATA_TYPE(8)) addi2(
    .lhs (fork6_outs_0),
    .lhs_valid (fork6_outs_0_valid),
    .lhs_ready (fork6_outs_0_ready),
    .rhs (trunci4_outs),
    .rhs_valid (trunci4_outs_valid),
    .rhs_ready (trunci4_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi2_result),
    .result_valid (addi2_result_valid),
    .result_ready (addi2_result_ready)
  );

  handshake_constant_5 #(.DATA_WIDTH(1)) constant3(
    .ctrl_valid (fork8_outs_0_valid),
    .ctrl_ready (fork8_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant3_outs),
    .outs_valid (constant3_outs_valid),
    .outs_ready (constant3_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(8)) extsi15(
    .ins (constant3_outs),
    .ins_valid (constant3_outs_valid),
    .ins_ready (constant3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi15_outs),
    .outs_valid (extsi15_outs_valid),
    .outs_ready (extsi15_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork9(
    .ins (extsi15_outs),
    .ins_valid (extsi15_outs_valid),
    .ins_ready (extsi15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork9_outs_1, fork9_outs_0}),
    .outs_valid ({fork9_outs_1_valid, fork9_outs_0_valid}),
    .outs_ready ({fork9_outs_1_ready, fork9_outs_0_ready})
  );

  oehb #(.DATA_TYPE(1)) buffer10(
    .ins (cond_br5_trueOut),
    .ins_valid (cond_br5_trueOut_valid),
    .ins_ready (cond_br5_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer10_outs),
    .outs_valid (buffer10_outs_valid),
    .outs_ready (buffer10_outs_ready)
  );

  tehb #(.DATA_TYPE(1)) buffer11(
    .ins (buffer10_outs),
    .ins_valid (buffer10_outs_valid),
    .ins_ready (buffer10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer11_outs),
    .outs_valid (buffer11_outs_valid),
    .outs_ready (buffer11_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux2(
    .index (fork11_outs_0),
    .index_valid (fork11_outs_0_valid),
    .index_ready (fork11_outs_0_ready),
    .ins ({trunci0_outs, fork4_outs_1}),
    .ins_valid ({trunci0_outs_valid, fork4_outs_1_valid}),
    .ins_ready ({trunci0_outs_ready, fork4_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux2_outs),
    .outs_valid (mux2_outs_valid),
    .outs_ready (mux2_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux3(
    .index (fork11_outs_1),
    .index_valid (fork11_outs_1_valid),
    .index_ready (fork11_outs_1_ready),
    .ins ({addi2_result, fork5_outs_1}),
    .ins_valid ({addi2_result_valid, fork5_outs_1_valid}),
    .ins_ready ({addi2_result_ready, fork5_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux3_outs),
    .outs_valid (mux3_outs_valid),
    .outs_ready (mux3_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux4(
    .index (fork11_outs_2),
    .index_valid (fork11_outs_2_valid),
    .index_ready (fork11_outs_2_ready),
    .ins ({fork9_outs_0, fork4_outs_0}),
    .ins_valid ({fork9_outs_0_valid, fork4_outs_0_valid}),
    .ins_ready ({fork9_outs_0_ready, fork4_outs_0_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux4_outs),
    .outs_valid (mux4_outs_valid),
    .outs_ready (mux4_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux5(
    .index (fork11_outs_3),
    .index_valid (fork11_outs_3_valid),
    .index_ready (fork11_outs_3_ready),
    .ins ({fork9_outs_1, fork5_outs_0}),
    .ins_valid ({fork9_outs_1_valid, fork5_outs_0_valid}),
    .ins_ready ({fork9_outs_1_ready, fork5_outs_0_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux5_outs),
    .outs_valid (mux5_outs_valid),
    .outs_ready (mux5_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(1), .SELECT_TYPE(1)) mux6(
    .index (fork11_outs_4),
    .index_valid (fork11_outs_4_valid),
    .index_ready (fork11_outs_4_ready),
    .ins ({buffer11_outs, cond_br5_falseOut}),
    .ins_valid ({buffer11_outs_valid, cond_br5_falseOut_valid}),
    .ins_ready ({buffer11_outs_ready, cond_br5_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux6_outs),
    .outs_valid (mux6_outs_valid),
    .outs_ready (mux6_outs_ready)
  );

  oehb #(.DATA_TYPE(1)) buffer22(
    .ins (mux6_outs),
    .ins_valid (mux6_outs_valid),
    .ins_ready (mux6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer22_outs),
    .outs_valid (buffer22_outs_valid),
    .outs_ready (buffer22_outs_ready)
  );

  tehb #(.DATA_TYPE(1)) buffer23(
    .ins (buffer22_outs),
    .ins_valid (buffer22_outs_valid),
    .ins_ready (buffer22_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer23_outs),
    .outs_valid (buffer23_outs_valid),
    .outs_ready (buffer23_outs_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork10(
    .ins (buffer23_outs),
    .ins_valid (buffer23_outs_valid),
    .ins_ready (buffer23_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork10_outs_4, fork10_outs_3, fork10_outs_2, fork10_outs_1, fork10_outs_0}),
    .outs_valid ({fork10_outs_4_valid, fork10_outs_3_valid, fork10_outs_2_valid, fork10_outs_1_valid, fork10_outs_0_valid}),
    .outs_ready ({fork10_outs_4_ready, fork10_outs_3_ready, fork10_outs_2_ready, fork10_outs_1_ready, fork10_outs_0_ready})
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge2(
    .ins_valid ({fork8_outs_1_valid, cond_br6_falseOut_valid}),
    .ins_ready ({fork8_outs_1_ready, cond_br6_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge2_outs_valid),
    .outs_ready (control_merge2_outs_ready),
    .index (control_merge2_index),
    .index_valid (control_merge2_index_valid),
    .index_ready (control_merge2_index_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork11(
    .ins (control_merge2_index),
    .ins_valid (control_merge2_index_valid),
    .ins_ready (control_merge2_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork11_outs_4, fork11_outs_3, fork11_outs_2, fork11_outs_1, fork11_outs_0}),
    .outs_valid ({fork11_outs_4_valid, fork11_outs_3_valid, fork11_outs_2_valid, fork11_outs_1_valid, fork11_outs_0_valid}),
    .outs_ready ({fork11_outs_4_ready, fork11_outs_3_ready, fork11_outs_2_ready, fork11_outs_1_ready, fork11_outs_0_ready})
  );

  oehb #(.DATA_TYPE(8)) buffer14(
    .ins (mux2_outs),
    .ins_valid (mux2_outs_valid),
    .ins_ready (mux2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer14_outs),
    .outs_valid (buffer14_outs_valid),
    .outs_ready (buffer14_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer15(
    .ins (buffer14_outs),
    .ins_valid (buffer14_outs_valid),
    .ins_ready (buffer14_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer15_outs),
    .outs_valid (buffer15_outs_valid),
    .outs_ready (buffer15_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br8(
    .condition (fork10_outs_4),
    .condition_valid (fork10_outs_4_valid),
    .condition_ready (fork10_outs_4_ready),
    .data (buffer15_outs),
    .data_valid (buffer15_outs_valid),
    .data_ready (buffer15_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br8_trueOut),
    .trueOut_valid (cond_br8_trueOut_valid),
    .trueOut_ready (cond_br8_trueOut_ready),
    .falseOut (cond_br8_falseOut),
    .falseOut_valid (cond_br8_falseOut_valid),
    .falseOut_ready (cond_br8_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink3(
    .ins (cond_br8_falseOut),
    .ins_valid (cond_br8_falseOut_valid),
    .ins_ready (cond_br8_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer16(
    .ins (mux3_outs),
    .ins_valid (mux3_outs_valid),
    .ins_ready (mux3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer16_outs),
    .outs_valid (buffer16_outs_valid),
    .outs_ready (buffer16_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer17(
    .ins (buffer16_outs),
    .ins_valid (buffer16_outs_valid),
    .ins_ready (buffer16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer17_outs),
    .outs_valid (buffer17_outs_valid),
    .outs_ready (buffer17_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br9(
    .condition (fork10_outs_3),
    .condition_valid (fork10_outs_3_valid),
    .condition_ready (fork10_outs_3_ready),
    .data (buffer17_outs),
    .data_valid (buffer17_outs_valid),
    .data_ready (buffer17_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br9_trueOut),
    .trueOut_valid (cond_br9_trueOut_valid),
    .trueOut_ready (cond_br9_trueOut_ready),
    .falseOut (cond_br9_falseOut),
    .falseOut_valid (cond_br9_falseOut_valid),
    .falseOut_ready (cond_br9_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink4(
    .ins (cond_br9_falseOut),
    .ins_valid (cond_br9_falseOut_valid),
    .ins_ready (cond_br9_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb_dataless buffer24(
    .ins_valid (control_merge2_outs_valid),
    .ins_ready (control_merge2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer24_outs_valid),
    .outs_ready (buffer24_outs_ready)
  );

  tehb_dataless buffer25(
    .ins_valid (buffer24_outs_valid),
    .ins_ready (buffer24_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer25_outs_valid),
    .outs_ready (buffer25_outs_ready)
  );

  cond_br_dataless cond_br10(
    .condition (fork10_outs_2),
    .condition_valid (fork10_outs_2_valid),
    .condition_ready (fork10_outs_2_ready),
    .data_valid (buffer25_outs_valid),
    .data_ready (buffer25_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br10_trueOut_valid),
    .trueOut_ready (cond_br10_trueOut_ready),
    .falseOut_valid (cond_br10_falseOut_valid),
    .falseOut_ready (cond_br10_falseOut_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer18(
    .ins (mux4_outs),
    .ins_valid (mux4_outs_valid),
    .ins_ready (mux4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer18_outs),
    .outs_valid (buffer18_outs_valid),
    .outs_ready (buffer18_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer19(
    .ins (buffer18_outs),
    .ins_valid (buffer18_outs_valid),
    .ins_ready (buffer18_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer19_outs),
    .outs_valid (buffer19_outs_valid),
    .outs_ready (buffer19_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br11(
    .condition (fork10_outs_1),
    .condition_valid (fork10_outs_1_valid),
    .condition_ready (fork10_outs_1_ready),
    .data (buffer19_outs),
    .data_valid (buffer19_outs_valid),
    .data_ready (buffer19_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br11_trueOut),
    .trueOut_valid (cond_br11_trueOut_valid),
    .trueOut_ready (cond_br11_trueOut_ready),
    .falseOut (cond_br11_falseOut),
    .falseOut_valid (cond_br11_falseOut_valid),
    .falseOut_ready (cond_br11_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink5(
    .ins (cond_br11_trueOut),
    .ins_valid (cond_br11_trueOut_valid),
    .ins_ready (cond_br11_trueOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer20(
    .ins (mux5_outs),
    .ins_valid (mux5_outs_valid),
    .ins_ready (mux5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer20_outs),
    .outs_valid (buffer20_outs_valid),
    .outs_ready (buffer20_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer21(
    .ins (buffer20_outs),
    .ins_valid (buffer20_outs_valid),
    .ins_ready (buffer20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer21_outs),
    .outs_valid (buffer21_outs_valid),
    .outs_ready (buffer21_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br12(
    .condition (fork10_outs_0),
    .condition_valid (fork10_outs_0_valid),
    .condition_ready (fork10_outs_0_ready),
    .data (buffer21_outs),
    .data_valid (buffer21_outs_valid),
    .data_ready (buffer21_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br12_trueOut),
    .trueOut_valid (cond_br12_trueOut_valid),
    .trueOut_ready (cond_br12_trueOut_ready),
    .falseOut (cond_br12_falseOut),
    .falseOut_valid (cond_br12_falseOut_valid),
    .falseOut_ready (cond_br12_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink6(
    .ins (cond_br12_trueOut),
    .ins_valid (cond_br12_trueOut_valid),
    .ins_ready (cond_br12_trueOut_ready),
    .clk (clk),
    .rst (rst)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux7(
    .index (fork13_outs_0),
    .index_valid (fork13_outs_0_valid),
    .index_ready (fork13_outs_0_ready),
    .ins ({trunci2_outs, cond_br11_falseOut}),
    .ins_valid ({trunci2_outs_valid, cond_br11_falseOut_valid}),
    .ins_ready ({trunci2_outs_ready, cond_br11_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux7_outs),
    .outs_valid (mux7_outs_valid),
    .outs_ready (mux7_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux8(
    .index (fork13_outs_1),
    .index_valid (fork13_outs_1_valid),
    .index_ready (fork13_outs_1_ready),
    .ins ({addi3_result, cond_br12_falseOut}),
    .ins_valid ({addi3_result_valid, cond_br12_falseOut_valid}),
    .ins_ready ({addi3_result_ready, cond_br12_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux8_outs),
    .outs_valid (mux8_outs_valid),
    .outs_ready (mux8_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer28(
    .ins (mux8_outs),
    .ins_valid (mux8_outs_valid),
    .ins_ready (mux8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer28_outs),
    .outs_valid (buffer28_outs_valid),
    .outs_ready (buffer28_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer29(
    .ins (buffer28_outs),
    .ins_valid (buffer28_outs_valid),
    .ins_ready (buffer28_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer29_outs),
    .outs_valid (buffer29_outs_valid),
    .outs_ready (buffer29_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork12(
    .ins (buffer29_outs),
    .ins_valid (buffer29_outs_valid),
    .ins_ready (buffer29_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork12_outs_1, fork12_outs_0}),
    .outs_valid ({fork12_outs_1_valid, fork12_outs_0_valid}),
    .outs_ready ({fork12_outs_1_ready, fork12_outs_0_ready})
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge3(
    .ins_valid ({buffer37_outs_valid, cond_br10_falseOut_valid}),
    .ins_ready ({buffer37_outs_ready, cond_br10_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge3_outs_valid),
    .outs_ready (control_merge3_outs_ready),
    .index (control_merge3_index),
    .index_valid (control_merge3_index_valid),
    .index_ready (control_merge3_index_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork13(
    .ins (control_merge3_index),
    .ins_valid (control_merge3_index_valid),
    .ins_ready (control_merge3_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork13_outs_1, fork13_outs_0}),
    .outs_valid ({fork13_outs_1_valid, fork13_outs_0_valid}),
    .outs_ready ({fork13_outs_1_ready, fork13_outs_0_ready})
  );

  source source4(
    .clk (clk),
    .rst (rst),
    .outs_valid (source4_outs_valid),
    .outs_ready (source4_outs_ready)
  );

  handshake_constant_5 #(.DATA_WIDTH(1)) constant4(
    .ctrl_valid (source4_outs_valid),
    .ctrl_ready (source4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant4_outs),
    .outs_valid (constant4_outs_valid),
    .outs_ready (constant4_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(8)) extsi16(
    .ins (constant4_outs),
    .ins_valid (constant4_outs_valid),
    .ins_ready (constant4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi16_outs),
    .outs_valid (extsi16_outs_valid),
    .outs_ready (extsi16_outs_ready)
  );

  handshake_cmpi_1 #(.DATA_TYPE(8)) cmpi1(
    .lhs (fork12_outs_0),
    .lhs_valid (fork12_outs_0_valid),
    .lhs_ready (fork12_outs_0_ready),
    .rhs (extsi16_outs),
    .rhs_valid (extsi16_outs_valid),
    .rhs_ready (extsi16_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi1_result),
    .result_valid (cmpi1_result_valid),
    .result_ready (cmpi1_result_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork14(
    .ins (cmpi1_result),
    .ins_valid (cmpi1_result_valid),
    .ins_ready (cmpi1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork14_outs_2, fork14_outs_1, fork14_outs_0}),
    .outs_valid ({fork14_outs_2_valid, fork14_outs_1_valid, fork14_outs_0_valid}),
    .outs_ready ({fork14_outs_2_ready, fork14_outs_1_ready, fork14_outs_0_ready})
  );

  oehb #(.DATA_TYPE(8)) buffer26(
    .ins (mux7_outs),
    .ins_valid (mux7_outs_valid),
    .ins_ready (mux7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer26_outs),
    .outs_valid (buffer26_outs_valid),
    .outs_ready (buffer26_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer27(
    .ins (buffer26_outs),
    .ins_valid (buffer26_outs_valid),
    .ins_ready (buffer26_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer27_outs),
    .outs_valid (buffer27_outs_valid),
    .outs_ready (buffer27_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br13(
    .condition (fork14_outs_0),
    .condition_valid (fork14_outs_0_valid),
    .condition_ready (fork14_outs_0_ready),
    .data (buffer27_outs),
    .data_valid (buffer27_outs_valid),
    .data_ready (buffer27_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br13_trueOut),
    .trueOut_valid (cond_br13_trueOut_valid),
    .trueOut_ready (cond_br13_trueOut_ready),
    .falseOut (cond_br13_falseOut),
    .falseOut_valid (cond_br13_falseOut_valid),
    .falseOut_ready (cond_br13_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br14(
    .condition (fork14_outs_1),
    .condition_valid (fork14_outs_1_valid),
    .condition_ready (fork14_outs_1_ready),
    .data (fork12_outs_1),
    .data_valid (fork12_outs_1_valid),
    .data_ready (fork12_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br14_trueOut),
    .trueOut_valid (cond_br14_trueOut_valid),
    .trueOut_ready (cond_br14_trueOut_ready),
    .falseOut (cond_br14_falseOut),
    .falseOut_valid (cond_br14_falseOut_valid),
    .falseOut_ready (cond_br14_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink7(
    .ins (cond_br14_falseOut),
    .ins_valid (cond_br14_falseOut_valid),
    .ins_ready (cond_br14_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb_dataless buffer30(
    .ins_valid (control_merge3_outs_valid),
    .ins_ready (control_merge3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer30_outs_valid),
    .outs_ready (buffer30_outs_ready)
  );

  tehb_dataless buffer31(
    .ins_valid (buffer30_outs_valid),
    .ins_ready (buffer30_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer31_outs_valid),
    .outs_ready (buffer31_outs_ready)
  );

  cond_br_dataless cond_br15(
    .condition (fork14_outs_2),
    .condition_valid (fork14_outs_2_valid),
    .condition_ready (fork14_outs_2_ready),
    .data_valid (buffer31_outs_valid),
    .data_ready (buffer31_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br15_trueOut_valid),
    .trueOut_ready (cond_br15_trueOut_ready),
    .falseOut_valid (cond_br15_falseOut_valid),
    .falseOut_ready (cond_br15_falseOut_ready)
  );

  sink_dataless sink8(
    .ins_valid (cond_br15_falseOut_valid),
    .ins_ready (cond_br15_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer32(
    .ins (cond_br13_trueOut),
    .ins_valid (cond_br13_trueOut_valid),
    .ins_ready (cond_br13_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer32_outs),
    .outs_valid (buffer32_outs_valid),
    .outs_ready (buffer32_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer33(
    .ins (buffer32_outs),
    .ins_valid (buffer32_outs_valid),
    .ins_ready (buffer32_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer33_outs),
    .outs_valid (buffer33_outs_valid),
    .outs_ready (buffer33_outs_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi17(
    .ins (buffer33_outs),
    .ins_valid (buffer33_outs_valid),
    .ins_ready (buffer33_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi17_outs),
    .outs_valid (extsi17_outs_valid),
    .outs_ready (extsi17_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer34(
    .ins (cond_br14_trueOut),
    .ins_valid (cond_br14_trueOut_valid),
    .ins_ready (cond_br14_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer34_outs),
    .outs_valid (buffer34_outs_valid),
    .outs_ready (buffer34_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer35(
    .ins (buffer34_outs),
    .ins_valid (buffer34_outs_valid),
    .ins_ready (buffer34_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer35_outs),
    .outs_valid (buffer35_outs_valid),
    .outs_ready (buffer35_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork15(
    .ins (buffer35_outs),
    .ins_valid (buffer35_outs_valid),
    .ins_ready (buffer35_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork15_outs_1, fork15_outs_0}),
    .outs_valid ({fork15_outs_1_valid, fork15_outs_0_valid}),
    .outs_ready ({fork15_outs_1_ready, fork15_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi18(
    .ins (fork15_outs_1),
    .ins_valid (fork15_outs_1_valid),
    .ins_ready (fork15_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi18_outs),
    .outs_valid (extsi18_outs_valid),
    .outs_ready (extsi18_outs_ready)
  );

  source source5(
    .clk (clk),
    .rst (rst),
    .outs_valid (source5_outs_valid),
    .outs_ready (source5_outs_ready)
  );

  handshake_constant_4 #(.DATA_WIDTH(32)) constant11(
    .ctrl_valid (source5_outs_valid),
    .ctrl_ready (source5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant11_outs),
    .outs_valid (constant11_outs_valid),
    .outs_ready (constant11_outs_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci5(
    .ins (constant11_outs),
    .ins_valid (constant11_outs_valid),
    .ins_ready (constant11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci5_outs),
    .outs_valid (trunci5_outs_valid),
    .outs_ready (trunci5_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli3(
    .lhs (extsi17_outs),
    .lhs_valid (extsi17_outs_valid),
    .lhs_ready (extsi17_outs_ready),
    .rhs (extsi18_outs),
    .rhs_valid (extsi18_outs_valid),
    .rhs_ready (extsi18_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli3_result),
    .result_valid (muli3_result_valid),
    .result_ready (muli3_result_ready)
  );

  trunci #(.INPUT_TYPE(16), .OUTPUT_TYPE(8)) trunci2(
    .ins (muli3_result),
    .ins_valid (muli3_result_valid),
    .ins_ready (muli3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci2_outs),
    .outs_valid (trunci2_outs_valid),
    .outs_ready (trunci2_outs_ready)
  );

  addi #(.DATA_TYPE(8)) addi3(
    .lhs (fork15_outs_0),
    .lhs_valid (fork15_outs_0_valid),
    .lhs_ready (fork15_outs_0_ready),
    .rhs (trunci5_outs),
    .rhs_valid (trunci5_outs_valid),
    .rhs_ready (trunci5_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi3_result),
    .result_valid (addi3_result_valid),
    .result_ready (addi3_result_ready)
  );

  oehb_dataless buffer36(
    .ins_valid (cond_br15_trueOut_valid),
    .ins_ready (cond_br15_trueOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer36_outs_valid),
    .outs_ready (buffer36_outs_ready)
  );

  tehb_dataless buffer37(
    .ins_valid (buffer36_outs_valid),
    .ins_ready (buffer36_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer37_outs_valid),
    .outs_ready (buffer37_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer38(
    .ins (cond_br13_falseOut),
    .ins_valid (cond_br13_falseOut_valid),
    .ins_ready (cond_br13_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer38_outs),
    .outs_valid (buffer38_outs_valid),
    .outs_ready (buffer38_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer39(
    .ins (buffer38_outs),
    .ins_valid (buffer38_outs_valid),
    .ins_ready (buffer38_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer39_outs),
    .outs_valid (buffer39_outs_valid),
    .outs_ready (buffer39_outs_ready)
  );

endmodule
