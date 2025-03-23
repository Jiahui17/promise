module kernel_2mm(
  input [7:0] alpha,
  input  alpha_valid,
  input [7:0] beta,
  input  beta_valid,
  input [7:0] tmp_loadData,
  input [7:0] A_loadData,
  input [7:0] B_loadData,
  input [7:0] C_loadData,
  input [7:0] D_loadData,
  input  tmp_start_valid,
  input  A_start_valid,
  input  B_start_valid,
  input  C_start_valid,
  input  D_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  tmp_end_ready,
  input  A_end_ready,
  input  B_end_ready,
  input  C_end_ready,
  input  D_end_ready,
  input  end_ready,
  output  alpha_ready,
  output  beta_ready,
  output  tmp_start_ready,
  output  A_start_ready,
  output  B_start_ready,
  output  C_start_ready,
  output  D_start_ready,
  output  start_ready,
  output  tmp_end_valid,
  output  A_end_valid,
  output  B_end_valid,
  output  C_end_valid,
  output  D_end_valid,
  output  end_valid,
  output  tmp_loadEn,
  output [6:0] tmp_loadAddr,
  output  tmp_storeEn,
  output [6:0] tmp_storeAddr,
  output [7:0] tmp_storeData,
  output  A_loadEn,
  output [6:0] A_loadAddr,
  output  A_storeEn,
  output [6:0] A_storeAddr,
  output [7:0] A_storeData,
  output  B_loadEn,
  output [6:0] B_loadAddr,
  output  B_storeEn,
  output [6:0] B_storeAddr,
  output [7:0] B_storeData,
  output  C_loadEn,
  output [6:0] C_loadAddr,
  output  C_storeEn,
  output [6:0] C_storeAddr,
  output [7:0] C_storeData,
  output  D_loadEn,
  output [6:0] D_loadAddr,
  output  D_storeEn,
  output [6:0] D_storeAddr,
  output [7:0] D_storeData
);
  wire  fork0_outs_0_valid;
  wire  fork0_outs_0_ready;
  wire  fork0_outs_1_valid;
  wire  fork0_outs_1_ready;
  wire  fork0_outs_2_valid;
  wire  fork0_outs_2_ready;
  wire [7:0] mem_controller5_ldData_0;
  wire  mem_controller5_ldData_0_valid;
  wire  mem_controller5_ldData_0_ready;
  wire  mem_controller5_memEnd_valid;
  wire  mem_controller5_memEnd_ready;
  wire  mem_controller5_loadEn;
  wire [6:0] mem_controller5_loadAddr;
  wire  mem_controller5_storeEn;
  wire [6:0] mem_controller5_storeAddr;
  wire [7:0] mem_controller5_storeData;
  wire [7:0] mem_controller6_ldData_0;
  wire  mem_controller6_ldData_0_valid;
  wire  mem_controller6_ldData_0_ready;
  wire  mem_controller6_memEnd_valid;
  wire  mem_controller6_memEnd_ready;
  wire  mem_controller6_loadEn;
  wire [6:0] mem_controller6_loadAddr;
  wire  mem_controller6_storeEn;
  wire [6:0] mem_controller6_storeAddr;
  wire [7:0] mem_controller6_storeData;
  wire [7:0] mem_controller7_ldData_0;
  wire  mem_controller7_ldData_0_valid;
  wire  mem_controller7_ldData_0_ready;
  wire  mem_controller7_memEnd_valid;
  wire  mem_controller7_memEnd_ready;
  wire  mem_controller7_loadEn;
  wire [6:0] mem_controller7_loadAddr;
  wire  mem_controller7_storeEn;
  wire [6:0] mem_controller7_storeAddr;
  wire [7:0] mem_controller7_storeData;
  wire [7:0] mem_controller8_ldData_0;
  wire  mem_controller8_ldData_0_valid;
  wire  mem_controller8_ldData_0_ready;
  wire  mem_controller8_memEnd_valid;
  wire  mem_controller8_memEnd_ready;
  wire  mem_controller8_loadEn;
  wire [6:0] mem_controller8_loadAddr;
  wire  mem_controller8_storeEn;
  wire [6:0] mem_controller8_storeAddr;
  wire [7:0] mem_controller8_storeData;
  wire [7:0] mem_controller9_ldData_0;
  wire  mem_controller9_ldData_0_valid;
  wire  mem_controller9_ldData_0_ready;
  wire  mem_controller9_memEnd_valid;
  wire  mem_controller9_memEnd_ready;
  wire  mem_controller9_loadEn;
  wire [6:0] mem_controller9_loadAddr;
  wire  mem_controller9_storeEn;
  wire [6:0] mem_controller9_storeAddr;
  wire [7:0] mem_controller9_storeData;
  wire [0:0] constant29_outs;
  wire  constant29_outs_valid;
  wire  constant29_outs_ready;
  wire [4:0] extsi39_outs;
  wire  extsi39_outs_valid;
  wire  extsi39_outs_ready;
  wire [4:0] mux0_outs;
  wire  mux0_outs_valid;
  wire  mux0_outs_ready;
  wire [7:0] mux1_outs;
  wire  mux1_outs_valid;
  wire  mux1_outs_ready;
  wire [7:0] mux2_outs;
  wire  mux2_outs_valid;
  wire  mux2_outs_ready;
  wire  control_merge0_outs_valid;
  wire  control_merge0_outs_ready;
  wire [0:0] control_merge0_index;
  wire  control_merge0_index_valid;
  wire  control_merge0_index_ready;
  wire [0:0] fork1_outs_0;
  wire  fork1_outs_0_valid;
  wire  fork1_outs_0_ready;
  wire [0:0] fork1_outs_1;
  wire  fork1_outs_1_valid;
  wire  fork1_outs_1_ready;
  wire [0:0] fork1_outs_2;
  wire  fork1_outs_2_valid;
  wire  fork1_outs_2_ready;
  wire  buffer6_outs_valid;
  wire  buffer6_outs_ready;
  wire  buffer7_outs_valid;
  wire  buffer7_outs_ready;
  wire  fork2_outs_0_valid;
  wire  fork2_outs_0_ready;
  wire  fork2_outs_1_valid;
  wire  fork2_outs_1_ready;
  wire [0:0] constant30_outs;
  wire  constant30_outs_valid;
  wire  constant30_outs_ready;
  wire [4:0] extsi38_outs;
  wire  extsi38_outs_valid;
  wire  extsi38_outs_ready;
  wire [7:0] buffer2_outs;
  wire  buffer2_outs_valid;
  wire  buffer2_outs_ready;
  wire [7:0] buffer3_outs;
  wire  buffer3_outs_valid;
  wire  buffer3_outs_ready;
  wire [7:0] buffer4_outs;
  wire  buffer4_outs_valid;
  wire  buffer4_outs_ready;
  wire [7:0] buffer5_outs;
  wire  buffer5_outs_valid;
  wire  buffer5_outs_ready;
  wire [4:0] buffer0_outs;
  wire  buffer0_outs_valid;
  wire  buffer0_outs_ready;
  wire [4:0] buffer1_outs;
  wire  buffer1_outs_valid;
  wire  buffer1_outs_ready;
  wire [4:0] mux3_outs;
  wire  mux3_outs_valid;
  wire  mux3_outs_ready;
  wire [7:0] mux4_outs;
  wire  mux4_outs_valid;
  wire  mux4_outs_ready;
  wire [7:0] mux5_outs;
  wire  mux5_outs_valid;
  wire  mux5_outs_ready;
  wire [4:0] mux6_outs;
  wire  mux6_outs_valid;
  wire  mux6_outs_ready;
  wire  control_merge1_outs_valid;
  wire  control_merge1_outs_ready;
  wire [0:0] control_merge1_index;
  wire  control_merge1_index_valid;
  wire  control_merge1_index_ready;
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
  wire  buffer16_outs_valid;
  wire  buffer16_outs_ready;
  wire  buffer17_outs_valid;
  wire  buffer17_outs_ready;
  wire  fork4_outs_0_valid;
  wire  fork4_outs_0_ready;
  wire  fork4_outs_1_valid;
  wire  fork4_outs_1_ready;
  wire [0:0] constant31_outs;
  wire  constant31_outs_valid;
  wire  constant31_outs_ready;
  wire [0:0] fork5_outs_0;
  wire  fork5_outs_0_valid;
  wire  fork5_outs_0_ready;
  wire [0:0] fork5_outs_1;
  wire  fork5_outs_1_valid;
  wire  fork5_outs_1_ready;
  wire [4:0] extsi37_outs;
  wire  extsi37_outs_valid;
  wire  extsi37_outs_ready;
  wire [31:0] extsi40_outs;
  wire  extsi40_outs_valid;
  wire  extsi40_outs_ready;
  wire [7:0] buffer10_outs;
  wire  buffer10_outs_valid;
  wire  buffer10_outs_ready;
  wire [7:0] buffer11_outs;
  wire  buffer11_outs_valid;
  wire  buffer11_outs_ready;
  wire [7:0] buffer12_outs;
  wire  buffer12_outs_valid;
  wire  buffer12_outs_ready;
  wire [7:0] buffer13_outs;
  wire  buffer13_outs_valid;
  wire  buffer13_outs_ready;
  wire [4:0] buffer14_outs;
  wire  buffer14_outs_valid;
  wire  buffer14_outs_ready;
  wire [4:0] buffer15_outs;
  wire  buffer15_outs_valid;
  wire  buffer15_outs_ready;
  wire [4:0] buffer8_outs;
  wire  buffer8_outs_valid;
  wire  buffer8_outs_ready;
  wire [4:0] buffer9_outs;
  wire  buffer9_outs_valid;
  wire  buffer9_outs_ready;
  wire [4:0] mux7_outs;
  wire  mux7_outs_valid;
  wire  mux7_outs_ready;
  wire [4:0] buffer18_outs;
  wire  buffer18_outs_valid;
  wire  buffer18_outs_ready;
  wire [4:0] buffer19_outs;
  wire  buffer19_outs_valid;
  wire  buffer19_outs_ready;
  wire [4:0] fork6_outs_0;
  wire  fork6_outs_0_valid;
  wire  fork6_outs_0_ready;
  wire [4:0] fork6_outs_1;
  wire  fork6_outs_1_valid;
  wire  fork6_outs_1_ready;
  wire [4:0] fork6_outs_2;
  wire  fork6_outs_2_valid;
  wire  fork6_outs_2_ready;
  wire [6:0] extsi41_outs;
  wire  extsi41_outs_valid;
  wire  extsi41_outs_ready;
  wire [5:0] extsi42_outs;
  wire  extsi42_outs_valid;
  wire  extsi42_outs_ready;
  wire [31:0] extsi43_outs;
  wire  extsi43_outs_valid;
  wire  extsi43_outs_ready;
  wire [31:0] fork7_outs_0;
  wire  fork7_outs_0_valid;
  wire  fork7_outs_0_ready;
  wire [31:0] fork7_outs_1;
  wire  fork7_outs_1_valid;
  wire  fork7_outs_1_ready;
  wire [31:0] mux8_outs;
  wire  mux8_outs_valid;
  wire  mux8_outs_ready;
  wire [7:0] mux9_outs;
  wire  mux9_outs_valid;
  wire  mux9_outs_ready;
  wire [7:0] mux10_outs;
  wire  mux10_outs_valid;
  wire  mux10_outs_ready;
  wire [7:0] buffer24_outs;
  wire  buffer24_outs_valid;
  wire  buffer24_outs_ready;
  wire [7:0] buffer25_outs;
  wire  buffer25_outs_valid;
  wire  buffer25_outs_ready;
  wire [7:0] fork8_outs_0;
  wire  fork8_outs_0_valid;
  wire  fork8_outs_0_ready;
  wire [7:0] fork8_outs_1;
  wire  fork8_outs_1_valid;
  wire  fork8_outs_1_ready;
  wire [15:0] extsi44_outs;
  wire  extsi44_outs_valid;
  wire  extsi44_outs_ready;
  wire [4:0] mux11_outs;
  wire  mux11_outs_valid;
  wire  mux11_outs_ready;
  wire [4:0] buffer26_outs;
  wire  buffer26_outs_valid;
  wire  buffer26_outs_ready;
  wire [4:0] buffer27_outs;
  wire  buffer27_outs_valid;
  wire  buffer27_outs_ready;
  wire [4:0] fork9_outs_0;
  wire  fork9_outs_0_valid;
  wire  fork9_outs_0_ready;
  wire [4:0] fork9_outs_1;
  wire  fork9_outs_1_valid;
  wire  fork9_outs_1_ready;
  wire [31:0] extsi45_outs;
  wire  extsi45_outs_valid;
  wire  extsi45_outs_ready;
  wire [31:0] fork10_outs_0;
  wire  fork10_outs_0_valid;
  wire  fork10_outs_0_ready;
  wire [31:0] fork10_outs_1;
  wire  fork10_outs_1_valid;
  wire  fork10_outs_1_ready;
  wire [4:0] mux12_outs;
  wire  mux12_outs_valid;
  wire  mux12_outs_ready;
  wire [4:0] buffer28_outs;
  wire  buffer28_outs_valid;
  wire  buffer28_outs_ready;
  wire [4:0] buffer29_outs;
  wire  buffer29_outs_valid;
  wire  buffer29_outs_ready;
  wire [4:0] fork11_outs_0;
  wire  fork11_outs_0_valid;
  wire  fork11_outs_0_ready;
  wire [4:0] fork11_outs_1;
  wire  fork11_outs_1_valid;
  wire  fork11_outs_1_ready;
  wire [6:0] extsi46_outs;
  wire  extsi46_outs_valid;
  wire  extsi46_outs_ready;
  wire  control_merge2_outs_valid;
  wire  control_merge2_outs_ready;
  wire [0:0] control_merge2_index;
  wire  control_merge2_index_valid;
  wire  control_merge2_index_ready;
  wire [0:0] fork12_outs_0;
  wire  fork12_outs_0_valid;
  wire  fork12_outs_0_ready;
  wire [0:0] fork12_outs_1;
  wire  fork12_outs_1_valid;
  wire  fork12_outs_1_ready;
  wire [0:0] fork12_outs_2;
  wire  fork12_outs_2_valid;
  wire  fork12_outs_2_ready;
  wire [0:0] fork12_outs_3;
  wire  fork12_outs_3_valid;
  wire  fork12_outs_3_ready;
  wire [0:0] fork12_outs_4;
  wire  fork12_outs_4_valid;
  wire  fork12_outs_4_ready;
  wire [0:0] fork12_outs_5;
  wire  fork12_outs_5_valid;
  wire  fork12_outs_5_ready;
  wire  source0_outs_valid;
  wire  source0_outs_ready;
  wire [1:0] constant32_outs;
  wire  constant32_outs_valid;
  wire  constant32_outs_ready;
  wire [1:0] fork13_outs_0;
  wire  fork13_outs_0_valid;
  wire  fork13_outs_0_ready;
  wire [1:0] fork13_outs_1;
  wire  fork13_outs_1_valid;
  wire  fork13_outs_1_ready;
  wire [5:0] extsi47_outs;
  wire  extsi47_outs_valid;
  wire  extsi47_outs_ready;
  wire [31:0] extsi11_outs;
  wire  extsi11_outs_valid;
  wire  extsi11_outs_ready;
  wire [31:0] fork14_outs_0;
  wire  fork14_outs_0_valid;
  wire  fork14_outs_0_ready;
  wire [31:0] fork14_outs_1;
  wire  fork14_outs_1_valid;
  wire  fork14_outs_1_ready;
  wire  source1_outs_valid;
  wire  source1_outs_ready;
  wire [4:0] constant33_outs;
  wire  constant33_outs_valid;
  wire  constant33_outs_ready;
  wire [5:0] extsi48_outs;
  wire  extsi48_outs_valid;
  wire  extsi48_outs_ready;
  wire  source2_outs_valid;
  wire  source2_outs_ready;
  wire [2:0] constant34_outs;
  wire  constant34_outs_valid;
  wire  constant34_outs_ready;
  wire [31:0] extsi13_outs;
  wire  extsi13_outs_valid;
  wire  extsi13_outs_ready;
  wire [31:0] fork15_outs_0;
  wire  fork15_outs_0_valid;
  wire  fork15_outs_0_ready;
  wire [31:0] fork15_outs_1;
  wire  fork15_outs_1_valid;
  wire  fork15_outs_1_ready;
  wire [31:0] shli0_result;
  wire  shli0_result_valid;
  wire  shli0_result_ready;
  wire [6:0] trunci2_outs;
  wire  trunci2_outs_valid;
  wire  trunci2_outs_ready;
  wire [31:0] shli1_result;
  wire  shli1_result_valid;
  wire  shli1_result_ready;
  wire [6:0] trunci3_outs;
  wire  trunci3_outs_valid;
  wire  trunci3_outs_ready;
  wire [6:0] addi15_result;
  wire  addi15_result_valid;
  wire  addi15_result_ready;
  wire [6:0] addi2_result;
  wire  addi2_result_valid;
  wire  addi2_result_ready;
  wire [6:0] load0_addrOut;
  wire  load0_addrOut_valid;
  wire  load0_addrOut_ready;
  wire [7:0] load0_dataOut;
  wire  load0_dataOut_valid;
  wire  load0_dataOut_ready;
  wire [15:0] extsi49_outs;
  wire  extsi49_outs_valid;
  wire  extsi49_outs_ready;
  wire [15:0] muli0_result;
  wire  muli0_result_valid;
  wire  muli0_result_ready;
  wire [23:0] extsi50_outs;
  wire  extsi50_outs_valid;
  wire  extsi50_outs_ready;
  wire [31:0] shli2_result;
  wire  shli2_result_valid;
  wire  shli2_result_ready;
  wire [6:0] trunci4_outs;
  wire  trunci4_outs_valid;
  wire  trunci4_outs_ready;
  wire [31:0] shli3_result;
  wire  shli3_result_valid;
  wire  shli3_result_ready;
  wire [6:0] trunci5_outs;
  wire  trunci5_outs_valid;
  wire  trunci5_outs_ready;
  wire [6:0] addi16_result;
  wire  addi16_result_valid;
  wire  addi16_result_ready;
  wire [6:0] addi3_result;
  wire  addi3_result_valid;
  wire  addi3_result_ready;
  wire [6:0] load1_addrOut;
  wire  load1_addrOut_valid;
  wire  load1_addrOut_ready;
  wire [7:0] load1_dataOut;
  wire  load1_dataOut_valid;
  wire  load1_dataOut_ready;
  wire [23:0] extsi51_outs;
  wire  extsi51_outs_valid;
  wire  extsi51_outs_ready;
  wire [23:0] muli1_result;
  wire  muli1_result_valid;
  wire  muli1_result_ready;
  wire [31:0] extsi52_outs;
  wire  extsi52_outs_valid;
  wire  extsi52_outs_ready;
  wire [31:0] buffer20_outs;
  wire  buffer20_outs_valid;
  wire  buffer20_outs_ready;
  wire [31:0] buffer21_outs;
  wire  buffer21_outs_valid;
  wire  buffer21_outs_ready;
  wire [31:0] addi0_result;
  wire  addi0_result_valid;
  wire  addi0_result_ready;
  wire [5:0] addi9_result;
  wire  addi9_result_valid;
  wire  addi9_result_ready;
  wire [5:0] fork16_outs_0;
  wire  fork16_outs_0_valid;
  wire  fork16_outs_0_ready;
  wire [5:0] fork16_outs_1;
  wire  fork16_outs_1_valid;
  wire  fork16_outs_1_ready;
  wire [4:0] trunci6_outs;
  wire  trunci6_outs_valid;
  wire  trunci6_outs_ready;
  wire [0:0] cmpi0_result;
  wire  cmpi0_result_valid;
  wire  cmpi0_result_ready;
  wire [0:0] fork17_outs_0;
  wire  fork17_outs_0_valid;
  wire  fork17_outs_0_ready;
  wire [0:0] fork17_outs_1;
  wire  fork17_outs_1_valid;
  wire  fork17_outs_1_ready;
  wire [0:0] fork17_outs_2;
  wire  fork17_outs_2_valid;
  wire  fork17_outs_2_ready;
  wire [0:0] fork17_outs_3;
  wire  fork17_outs_3_valid;
  wire  fork17_outs_3_ready;
  wire [0:0] fork17_outs_4;
  wire  fork17_outs_4_valid;
  wire  fork17_outs_4_ready;
  wire [0:0] fork17_outs_5;
  wire  fork17_outs_5_valid;
  wire  fork17_outs_5_ready;
  wire [0:0] fork17_outs_6;
  wire  fork17_outs_6_valid;
  wire  fork17_outs_6_ready;
  wire [4:0] cond_br6_trueOut;
  wire  cond_br6_trueOut_valid;
  wire  cond_br6_trueOut_ready;
  wire [4:0] cond_br6_falseOut;
  wire  cond_br6_falseOut_valid;
  wire  cond_br6_falseOut_ready;
  wire [31:0] cond_br7_trueOut;
  wire  cond_br7_trueOut_valid;
  wire  cond_br7_trueOut_ready;
  wire [31:0] cond_br7_falseOut;
  wire  cond_br7_falseOut_valid;
  wire  cond_br7_falseOut_ready;
  wire [7:0] trunci7_outs;
  wire  trunci7_outs_valid;
  wire  trunci7_outs_ready;
  wire [7:0] buffer22_outs;
  wire  buffer22_outs_valid;
  wire  buffer22_outs_ready;
  wire [7:0] buffer23_outs;
  wire  buffer23_outs_valid;
  wire  buffer23_outs_ready;
  wire [7:0] cond_br8_trueOut;
  wire  cond_br8_trueOut_valid;
  wire  cond_br8_trueOut_ready;
  wire [7:0] cond_br8_falseOut;
  wire  cond_br8_falseOut_valid;
  wire  cond_br8_falseOut_ready;
  wire [7:0] cond_br9_trueOut;
  wire  cond_br9_trueOut_valid;
  wire  cond_br9_trueOut_ready;
  wire [7:0] cond_br9_falseOut;
  wire  cond_br9_falseOut_valid;
  wire  cond_br9_falseOut_ready;
  wire [4:0] cond_br10_trueOut;
  wire  cond_br10_trueOut_valid;
  wire  cond_br10_trueOut_ready;
  wire [4:0] cond_br10_falseOut;
  wire  cond_br10_falseOut_valid;
  wire  cond_br10_falseOut_ready;
  wire [4:0] cond_br11_trueOut;
  wire  cond_br11_trueOut_valid;
  wire  cond_br11_trueOut_ready;
  wire [4:0] cond_br11_falseOut;
  wire  cond_br11_falseOut_valid;
  wire  cond_br11_falseOut_ready;
  wire  buffer30_outs_valid;
  wire  buffer30_outs_ready;
  wire  buffer31_outs_valid;
  wire  buffer31_outs_ready;
  wire  cond_br12_trueOut_valid;
  wire  cond_br12_trueOut_ready;
  wire  cond_br12_falseOut_valid;
  wire  cond_br12_falseOut_ready;
  wire [4:0] buffer36_outs;
  wire  buffer36_outs_valid;
  wire  buffer36_outs_ready;
  wire [4:0] buffer37_outs;
  wire  buffer37_outs_valid;
  wire  buffer37_outs_ready;
  wire [4:0] fork18_outs_0;
  wire  fork18_outs_0_valid;
  wire  fork18_outs_0_ready;
  wire [4:0] fork18_outs_1;
  wire  fork18_outs_1_valid;
  wire  fork18_outs_1_ready;
  wire [31:0] extsi53_outs;
  wire  extsi53_outs_valid;
  wire  extsi53_outs_ready;
  wire [31:0] fork19_outs_0;
  wire  fork19_outs_0_valid;
  wire  fork19_outs_0_ready;
  wire [31:0] fork19_outs_1;
  wire  fork19_outs_1_valid;
  wire  fork19_outs_1_ready;
  wire [4:0] buffer38_outs;
  wire  buffer38_outs_valid;
  wire  buffer38_outs_ready;
  wire [4:0] buffer39_outs;
  wire  buffer39_outs_valid;
  wire  buffer39_outs_ready;
  wire [4:0] fork20_outs_0;
  wire  fork20_outs_0_valid;
  wire  fork20_outs_0_ready;
  wire [4:0] fork20_outs_1;
  wire  fork20_outs_1_valid;
  wire  fork20_outs_1_ready;
  wire [6:0] extsi54_outs;
  wire  extsi54_outs_valid;
  wire  extsi54_outs_ready;
  wire [5:0] extsi55_outs;
  wire  extsi55_outs_valid;
  wire  extsi55_outs_ready;
  wire  buffer42_outs_valid;
  wire  buffer42_outs_ready;
  wire  buffer43_outs_valid;
  wire  buffer43_outs_ready;
  wire  fork21_outs_0_valid;
  wire  fork21_outs_0_ready;
  wire  fork21_outs_1_valid;
  wire  fork21_outs_1_ready;
  wire [1:0] constant35_outs;
  wire  constant35_outs_valid;
  wire  constant35_outs_ready;
  wire [31:0] extsi14_outs;
  wire  extsi14_outs_valid;
  wire  extsi14_outs_ready;
  wire  source3_outs_valid;
  wire  source3_outs_ready;
  wire [1:0] constant36_outs;
  wire  constant36_outs_valid;
  wire  constant36_outs_ready;
  wire [1:0] fork22_outs_0;
  wire  fork22_outs_0_valid;
  wire  fork22_outs_0_ready;
  wire [1:0] fork22_outs_1;
  wire  fork22_outs_1_valid;
  wire  fork22_outs_1_ready;
  wire [5:0] extsi56_outs;
  wire  extsi56_outs_valid;
  wire  extsi56_outs_ready;
  wire [31:0] extsi15_outs;
  wire  extsi15_outs_valid;
  wire  extsi15_outs_ready;
  wire  source4_outs_valid;
  wire  source4_outs_ready;
  wire [4:0] constant37_outs;
  wire  constant37_outs_valid;
  wire  constant37_outs_ready;
  wire [5:0] extsi57_outs;
  wire  extsi57_outs_valid;
  wire  extsi57_outs_ready;
  wire  source5_outs_valid;
  wire  source5_outs_ready;
  wire [2:0] constant38_outs;
  wire  constant38_outs_valid;
  wire  constant38_outs_ready;
  wire [31:0] extsi17_outs;
  wire  extsi17_outs_valid;
  wire  extsi17_outs_ready;
  wire [31:0] shli4_result;
  wire  shli4_result_valid;
  wire  shli4_result_ready;
  wire [6:0] trunci8_outs;
  wire  trunci8_outs_valid;
  wire  trunci8_outs_ready;
  wire [31:0] shli5_result;
  wire  shli5_result_valid;
  wire  shli5_result_ready;
  wire [6:0] trunci9_outs;
  wire  trunci9_outs_valid;
  wire  trunci9_outs_ready;
  wire [6:0] addi17_result;
  wire  addi17_result_valid;
  wire  addi17_result_ready;
  wire [6:0] addi4_result;
  wire  addi4_result_valid;
  wire  addi4_result_ready;
  wire [7:0] buffer40_outs;
  wire  buffer40_outs_valid;
  wire  buffer40_outs_ready;
  wire [7:0] buffer41_outs;
  wire  buffer41_outs_valid;
  wire  buffer41_outs_ready;
  wire [6:0] store0_addrOut;
  wire  store0_addrOut_valid;
  wire  store0_addrOut_ready;
  wire [7:0] store0_dataToMem;
  wire  store0_dataToMem_valid;
  wire  store0_dataToMem_ready;
  wire [5:0] addi10_result;
  wire  addi10_result_valid;
  wire  addi10_result_ready;
  wire [5:0] fork23_outs_0;
  wire  fork23_outs_0_valid;
  wire  fork23_outs_0_ready;
  wire [5:0] fork23_outs_1;
  wire  fork23_outs_1_valid;
  wire  fork23_outs_1_ready;
  wire [4:0] trunci10_outs;
  wire  trunci10_outs_valid;
  wire  trunci10_outs_ready;
  wire [0:0] cmpi1_result;
  wire  cmpi1_result_valid;
  wire  cmpi1_result_ready;
  wire [0:0] fork24_outs_0;
  wire  fork24_outs_0_valid;
  wire  fork24_outs_0_ready;
  wire [0:0] fork24_outs_1;
  wire  fork24_outs_1_valid;
  wire  fork24_outs_1_ready;
  wire [0:0] fork24_outs_2;
  wire  fork24_outs_2_valid;
  wire  fork24_outs_2_ready;
  wire [0:0] fork24_outs_3;
  wire  fork24_outs_3_valid;
  wire  fork24_outs_3_ready;
  wire [0:0] fork24_outs_4;
  wire  fork24_outs_4_valid;
  wire  fork24_outs_4_ready;
  wire [4:0] cond_br13_trueOut;
  wire  cond_br13_trueOut_valid;
  wire  cond_br13_trueOut_ready;
  wire [4:0] cond_br13_falseOut;
  wire  cond_br13_falseOut_valid;
  wire  cond_br13_falseOut_ready;
  wire [7:0] buffer32_outs;
  wire  buffer32_outs_valid;
  wire  buffer32_outs_ready;
  wire [7:0] buffer33_outs;
  wire  buffer33_outs_valid;
  wire  buffer33_outs_ready;
  wire [7:0] cond_br14_trueOut;
  wire  cond_br14_trueOut_valid;
  wire  cond_br14_trueOut_ready;
  wire [7:0] cond_br14_falseOut;
  wire  cond_br14_falseOut_valid;
  wire  cond_br14_falseOut_ready;
  wire [7:0] buffer34_outs;
  wire  buffer34_outs_valid;
  wire  buffer34_outs_ready;
  wire [7:0] buffer35_outs;
  wire  buffer35_outs_valid;
  wire  buffer35_outs_ready;
  wire [7:0] cond_br15_trueOut;
  wire  cond_br15_trueOut_valid;
  wire  cond_br15_trueOut_ready;
  wire [7:0] cond_br15_falseOut;
  wire  cond_br15_falseOut_valid;
  wire  cond_br15_falseOut_ready;
  wire [4:0] cond_br16_trueOut;
  wire  cond_br16_trueOut_valid;
  wire  cond_br16_trueOut_ready;
  wire [4:0] cond_br16_falseOut;
  wire  cond_br16_falseOut_valid;
  wire  cond_br16_falseOut_ready;
  wire  cond_br17_trueOut_valid;
  wire  cond_br17_trueOut_ready;
  wire  cond_br17_falseOut_valid;
  wire  cond_br17_falseOut_ready;
  wire [4:0] buffer48_outs;
  wire  buffer48_outs_valid;
  wire  buffer48_outs_ready;
  wire [4:0] buffer49_outs;
  wire  buffer49_outs_valid;
  wire  buffer49_outs_ready;
  wire [5:0] extsi58_outs;
  wire  extsi58_outs_valid;
  wire  extsi58_outs_ready;
  wire  source6_outs_valid;
  wire  source6_outs_ready;
  wire [1:0] constant39_outs;
  wire  constant39_outs_valid;
  wire  constant39_outs_ready;
  wire [5:0] extsi59_outs;
  wire  extsi59_outs_valid;
  wire  extsi59_outs_ready;
  wire  source7_outs_valid;
  wire  source7_outs_ready;
  wire [4:0] constant40_outs;
  wire  constant40_outs_valid;
  wire  constant40_outs_ready;
  wire [5:0] extsi60_outs;
  wire  extsi60_outs_valid;
  wire  extsi60_outs_ready;
  wire [5:0] addi11_result;
  wire  addi11_result_valid;
  wire  addi11_result_ready;
  wire [5:0] fork25_outs_0;
  wire  fork25_outs_0_valid;
  wire  fork25_outs_0_ready;
  wire [5:0] fork25_outs_1;
  wire  fork25_outs_1_valid;
  wire  fork25_outs_1_ready;
  wire [4:0] trunci11_outs;
  wire  trunci11_outs_valid;
  wire  trunci11_outs_ready;
  wire [0:0] cmpi2_result;
  wire  cmpi2_result_valid;
  wire  cmpi2_result_ready;
  wire [0:0] fork26_outs_0;
  wire  fork26_outs_0_valid;
  wire  fork26_outs_0_ready;
  wire [0:0] fork26_outs_1;
  wire  fork26_outs_1_valid;
  wire  fork26_outs_1_ready;
  wire [0:0] fork26_outs_2;
  wire  fork26_outs_2_valid;
  wire  fork26_outs_2_ready;
  wire [0:0] fork26_outs_3;
  wire  fork26_outs_3_valid;
  wire  fork26_outs_3_ready;
  wire [4:0] cond_br18_trueOut;
  wire  cond_br18_trueOut_valid;
  wire  cond_br18_trueOut_ready;
  wire [4:0] cond_br18_falseOut;
  wire  cond_br18_falseOut_valid;
  wire  cond_br18_falseOut_ready;
  wire [7:0] buffer44_outs;
  wire  buffer44_outs_valid;
  wire  buffer44_outs_ready;
  wire [7:0] buffer45_outs;
  wire  buffer45_outs_valid;
  wire  buffer45_outs_ready;
  wire [7:0] cond_br19_trueOut;
  wire  cond_br19_trueOut_valid;
  wire  cond_br19_trueOut_ready;
  wire [7:0] cond_br19_falseOut;
  wire  cond_br19_falseOut_valid;
  wire  cond_br19_falseOut_ready;
  wire [7:0] buffer46_outs;
  wire  buffer46_outs_valid;
  wire  buffer46_outs_ready;
  wire [7:0] buffer47_outs;
  wire  buffer47_outs_valid;
  wire  buffer47_outs_ready;
  wire [7:0] cond_br20_trueOut;
  wire  cond_br20_trueOut_valid;
  wire  cond_br20_trueOut_ready;
  wire [7:0] cond_br20_falseOut;
  wire  cond_br20_falseOut_valid;
  wire  cond_br20_falseOut_ready;
  wire  buffer50_outs_valid;
  wire  buffer50_outs_ready;
  wire  buffer51_outs_valid;
  wire  buffer51_outs_ready;
  wire  cond_br21_trueOut_valid;
  wire  cond_br21_trueOut_ready;
  wire  cond_br21_falseOut_valid;
  wire  cond_br21_falseOut_ready;
  wire  buffer54_outs_valid;
  wire  buffer54_outs_ready;
  wire  buffer55_outs_valid;
  wire  buffer55_outs_ready;
  wire  fork27_outs_0_valid;
  wire  fork27_outs_0_ready;
  wire  fork27_outs_1_valid;
  wire  fork27_outs_1_ready;
  wire [0:0] constant41_outs;
  wire  constant41_outs_valid;
  wire  constant41_outs_ready;
  wire [4:0] extsi36_outs;
  wire  extsi36_outs_valid;
  wire  extsi36_outs_ready;
  wire [7:0] buffer52_outs;
  wire  buffer52_outs_valid;
  wire  buffer52_outs_ready;
  wire [7:0] buffer53_outs;
  wire  buffer53_outs_valid;
  wire  buffer53_outs_ready;
  wire [4:0] mux13_outs;
  wire  mux13_outs_valid;
  wire  mux13_outs_ready;
  wire [7:0] mux14_outs;
  wire  mux14_outs_valid;
  wire  mux14_outs_ready;
  wire  control_merge6_outs_valid;
  wire  control_merge6_outs_ready;
  wire [0:0] control_merge6_index;
  wire  control_merge6_index_valid;
  wire  control_merge6_index_ready;
  wire [0:0] fork28_outs_0;
  wire  fork28_outs_0_valid;
  wire  fork28_outs_0_ready;
  wire [0:0] fork28_outs_1;
  wire  fork28_outs_1_valid;
  wire  fork28_outs_1_ready;
  wire  buffer60_outs_valid;
  wire  buffer60_outs_ready;
  wire  buffer61_outs_valid;
  wire  buffer61_outs_ready;
  wire  fork29_outs_0_valid;
  wire  fork29_outs_0_ready;
  wire  fork29_outs_1_valid;
  wire  fork29_outs_1_ready;
  wire [0:0] constant42_outs;
  wire  constant42_outs_valid;
  wire  constant42_outs_ready;
  wire [4:0] extsi35_outs;
  wire  extsi35_outs_valid;
  wire  extsi35_outs_ready;
  wire [7:0] buffer58_outs;
  wire  buffer58_outs_valid;
  wire  buffer58_outs_ready;
  wire [7:0] buffer59_outs;
  wire  buffer59_outs_valid;
  wire  buffer59_outs_ready;
  wire [4:0] buffer56_outs;
  wire  buffer56_outs_valid;
  wire  buffer56_outs_ready;
  wire [4:0] buffer57_outs;
  wire  buffer57_outs_valid;
  wire  buffer57_outs_ready;
  wire [4:0] mux15_outs;
  wire  mux15_outs_valid;
  wire  mux15_outs_ready;
  wire [4:0] buffer62_outs;
  wire  buffer62_outs_valid;
  wire  buffer62_outs_ready;
  wire [4:0] buffer63_outs;
  wire  buffer63_outs_valid;
  wire  buffer63_outs_ready;
  wire [4:0] fork30_outs_0;
  wire  fork30_outs_0_valid;
  wire  fork30_outs_0_ready;
  wire [4:0] fork30_outs_1;
  wire  fork30_outs_1_valid;
  wire  fork30_outs_1_ready;
  wire [6:0] extsi61_outs;
  wire  extsi61_outs_valid;
  wire  extsi61_outs_ready;
  wire [7:0] mux16_outs;
  wire  mux16_outs_valid;
  wire  mux16_outs_ready;
  wire [7:0] buffer64_outs;
  wire  buffer64_outs_valid;
  wire  buffer64_outs_ready;
  wire [7:0] buffer65_outs;
  wire  buffer65_outs_valid;
  wire  buffer65_outs_ready;
  wire [7:0] fork31_outs_0;
  wire  fork31_outs_0_valid;
  wire  fork31_outs_0_ready;
  wire [7:0] fork31_outs_1;
  wire  fork31_outs_1_valid;
  wire  fork31_outs_1_ready;
  wire [15:0] extsi62_outs;
  wire  extsi62_outs_valid;
  wire  extsi62_outs_ready;
  wire [4:0] mux17_outs;
  wire  mux17_outs_valid;
  wire  mux17_outs_ready;
  wire [4:0] buffer66_outs;
  wire  buffer66_outs_valid;
  wire  buffer66_outs_ready;
  wire [4:0] buffer67_outs;
  wire  buffer67_outs_valid;
  wire  buffer67_outs_ready;
  wire [4:0] fork32_outs_0;
  wire  fork32_outs_0_valid;
  wire  fork32_outs_0_ready;
  wire [4:0] fork32_outs_1;
  wire  fork32_outs_1_valid;
  wire  fork32_outs_1_ready;
  wire [31:0] extsi63_outs;
  wire  extsi63_outs_valid;
  wire  extsi63_outs_ready;
  wire [31:0] fork33_outs_0;
  wire  fork33_outs_0_valid;
  wire  fork33_outs_0_ready;
  wire [31:0] fork33_outs_1;
  wire  fork33_outs_1_valid;
  wire  fork33_outs_1_ready;
  wire  control_merge7_outs_valid;
  wire  control_merge7_outs_ready;
  wire [0:0] control_merge7_index;
  wire  control_merge7_index_valid;
  wire  control_merge7_index_ready;
  wire [0:0] fork34_outs_0;
  wire  fork34_outs_0_valid;
  wire  fork34_outs_0_ready;
  wire [0:0] fork34_outs_1;
  wire  fork34_outs_1_valid;
  wire  fork34_outs_1_ready;
  wire [0:0] fork34_outs_2;
  wire  fork34_outs_2_valid;
  wire  fork34_outs_2_ready;
  wire  buffer68_outs_valid;
  wire  buffer68_outs_ready;
  wire  buffer69_outs_valid;
  wire  buffer69_outs_ready;
  wire  fork35_outs_0_valid;
  wire  fork35_outs_0_ready;
  wire  fork35_outs_1_valid;
  wire  fork35_outs_1_ready;
  wire  source8_outs_valid;
  wire  source8_outs_ready;
  wire [1:0] constant43_outs;
  wire  constant43_outs_valid;
  wire  constant43_outs_ready;
  wire [31:0] extsi22_outs;
  wire  extsi22_outs_valid;
  wire  extsi22_outs_ready;
  wire [0:0] constant44_outs;
  wire  constant44_outs_valid;
  wire  constant44_outs_ready;
  wire  source9_outs_valid;
  wire  source9_outs_ready;
  wire [2:0] constant45_outs;
  wire  constant45_outs_valid;
  wire  constant45_outs_ready;
  wire [31:0] extsi24_outs;
  wire  extsi24_outs_valid;
  wire  extsi24_outs_ready;
  wire [31:0] shli6_result;
  wire  shli6_result_valid;
  wire  shli6_result_ready;
  wire [6:0] trunci12_outs;
  wire  trunci12_outs_valid;
  wire  trunci12_outs_ready;
  wire [31:0] shli7_result;
  wire  shli7_result_valid;
  wire  shli7_result_ready;
  wire [6:0] trunci13_outs;
  wire  trunci13_outs_valid;
  wire  trunci13_outs_ready;
  wire [6:0] addi18_result;
  wire  addi18_result_valid;
  wire  addi18_result_ready;
  wire [6:0] addi5_result;
  wire  addi5_result_valid;
  wire  addi5_result_ready;
  wire [6:0] load2_addrOut;
  wire  load2_addrOut_valid;
  wire  load2_addrOut_ready;
  wire [7:0] load2_dataOut;
  wire  load2_dataOut_valid;
  wire  load2_dataOut_ready;
  wire [15:0] extsi64_outs;
  wire  extsi64_outs_valid;
  wire  extsi64_outs_ready;
  wire [15:0] muli2_result;
  wire  muli2_result_valid;
  wire  muli2_result_ready;
  wire [4:0] extsi34_outs;
  wire  extsi34_outs_valid;
  wire  extsi34_outs_ready;
  wire [31:0] extsi65_outs;
  wire  extsi65_outs_valid;
  wire  extsi65_outs_ready;
  wire [4:0] mux18_outs;
  wire  mux18_outs_valid;
  wire  mux18_outs_ready;
  wire [4:0] buffer70_outs;
  wire  buffer70_outs_valid;
  wire  buffer70_outs_ready;
  wire [4:0] buffer71_outs;
  wire  buffer71_outs_valid;
  wire  buffer71_outs_ready;
  wire [4:0] fork36_outs_0;
  wire  fork36_outs_0_valid;
  wire  fork36_outs_0_ready;
  wire [4:0] fork36_outs_1;
  wire  fork36_outs_1_valid;
  wire  fork36_outs_1_ready;
  wire [4:0] fork36_outs_2;
  wire  fork36_outs_2_valid;
  wire  fork36_outs_2_ready;
  wire [6:0] extsi66_outs;
  wire  extsi66_outs_valid;
  wire  extsi66_outs_ready;
  wire [5:0] extsi67_outs;
  wire  extsi67_outs_valid;
  wire  extsi67_outs_ready;
  wire [31:0] extsi68_outs;
  wire  extsi68_outs_valid;
  wire  extsi68_outs_ready;
  wire [31:0] fork37_outs_0;
  wire  fork37_outs_0_valid;
  wire  fork37_outs_0_ready;
  wire [31:0] fork37_outs_1;
  wire  fork37_outs_1_valid;
  wire  fork37_outs_1_ready;
  wire [31:0] mux19_outs;
  wire  mux19_outs_valid;
  wire  mux19_outs_ready;
  wire [7:0] mux20_outs;
  wire  mux20_outs_valid;
  wire  mux20_outs_ready;
  wire [4:0] mux21_outs;
  wire  mux21_outs_valid;
  wire  mux21_outs_ready;
  wire [4:0] buffer76_outs;
  wire  buffer76_outs_valid;
  wire  buffer76_outs_ready;
  wire [4:0] buffer77_outs;
  wire  buffer77_outs_valid;
  wire  buffer77_outs_ready;
  wire [4:0] fork38_outs_0;
  wire  fork38_outs_0_valid;
  wire  fork38_outs_0_ready;
  wire [4:0] fork38_outs_1;
  wire  fork38_outs_1_valid;
  wire  fork38_outs_1_ready;
  wire [31:0] extsi69_outs;
  wire  extsi69_outs_valid;
  wire  extsi69_outs_ready;
  wire [31:0] fork39_outs_0;
  wire  fork39_outs_0_valid;
  wire  fork39_outs_0_ready;
  wire [31:0] fork39_outs_1;
  wire  fork39_outs_1_valid;
  wire  fork39_outs_1_ready;
  wire [4:0] mux22_outs;
  wire  mux22_outs_valid;
  wire  mux22_outs_ready;
  wire [4:0] buffer78_outs;
  wire  buffer78_outs_valid;
  wire  buffer78_outs_ready;
  wire [4:0] buffer79_outs;
  wire  buffer79_outs_valid;
  wire  buffer79_outs_ready;
  wire [4:0] fork40_outs_0;
  wire  fork40_outs_0_valid;
  wire  fork40_outs_0_ready;
  wire [4:0] fork40_outs_1;
  wire  fork40_outs_1_valid;
  wire  fork40_outs_1_ready;
  wire [6:0] extsi70_outs;
  wire  extsi70_outs_valid;
  wire  extsi70_outs_ready;
  wire  control_merge8_outs_valid;
  wire  control_merge8_outs_ready;
  wire [0:0] control_merge8_index;
  wire  control_merge8_index_valid;
  wire  control_merge8_index_ready;
  wire [0:0] fork41_outs_0;
  wire  fork41_outs_0_valid;
  wire  fork41_outs_0_ready;
  wire [0:0] fork41_outs_1;
  wire  fork41_outs_1_valid;
  wire  fork41_outs_1_ready;
  wire [0:0] fork41_outs_2;
  wire  fork41_outs_2_valid;
  wire  fork41_outs_2_ready;
  wire [0:0] fork41_outs_3;
  wire  fork41_outs_3_valid;
  wire  fork41_outs_3_ready;
  wire [0:0] fork41_outs_4;
  wire  fork41_outs_4_valid;
  wire  fork41_outs_4_ready;
  wire  source10_outs_valid;
  wire  source10_outs_ready;
  wire [1:0] constant46_outs;
  wire  constant46_outs_valid;
  wire  constant46_outs_ready;
  wire [1:0] fork42_outs_0;
  wire  fork42_outs_0_valid;
  wire  fork42_outs_0_ready;
  wire [1:0] fork42_outs_1;
  wire  fork42_outs_1_valid;
  wire  fork42_outs_1_ready;
  wire [5:0] extsi71_outs;
  wire  extsi71_outs_valid;
  wire  extsi71_outs_ready;
  wire [31:0] extsi25_outs;
  wire  extsi25_outs_valid;
  wire  extsi25_outs_ready;
  wire [31:0] fork43_outs_0;
  wire  fork43_outs_0_valid;
  wire  fork43_outs_0_ready;
  wire [31:0] fork43_outs_1;
  wire  fork43_outs_1_valid;
  wire  fork43_outs_1_ready;
  wire  source11_outs_valid;
  wire  source11_outs_ready;
  wire [4:0] constant47_outs;
  wire  constant47_outs_valid;
  wire  constant47_outs_ready;
  wire [5:0] extsi72_outs;
  wire  extsi72_outs_valid;
  wire  extsi72_outs_ready;
  wire  source12_outs_valid;
  wire  source12_outs_ready;
  wire [2:0] constant48_outs;
  wire  constant48_outs_valid;
  wire  constant48_outs_ready;
  wire [31:0] extsi27_outs;
  wire  extsi27_outs_valid;
  wire  extsi27_outs_ready;
  wire [31:0] fork44_outs_0;
  wire  fork44_outs_0_valid;
  wire  fork44_outs_0_ready;
  wire [31:0] fork44_outs_1;
  wire  fork44_outs_1_valid;
  wire  fork44_outs_1_ready;
  wire [31:0] shli8_result;
  wire  shli8_result_valid;
  wire  shli8_result_ready;
  wire [6:0] trunci14_outs;
  wire  trunci14_outs_valid;
  wire  trunci14_outs_ready;
  wire [31:0] shli9_result;
  wire  shli9_result_valid;
  wire  shli9_result_ready;
  wire [6:0] trunci15_outs;
  wire  trunci15_outs_valid;
  wire  trunci15_outs_ready;
  wire [6:0] addi19_result;
  wire  addi19_result_valid;
  wire  addi19_result_ready;
  wire [6:0] addi6_result;
  wire  addi6_result_valid;
  wire  addi6_result_ready;
  wire [6:0] load3_addrOut;
  wire  load3_addrOut_valid;
  wire  load3_addrOut_ready;
  wire [7:0] load3_dataOut;
  wire  load3_dataOut_valid;
  wire  load3_dataOut_ready;
  wire [15:0] extsi73_outs;
  wire  extsi73_outs_valid;
  wire  extsi73_outs_ready;
  wire [31:0] shli10_result;
  wire  shli10_result_valid;
  wire  shli10_result_ready;
  wire [6:0] trunci16_outs;
  wire  trunci16_outs_valid;
  wire  trunci16_outs_ready;
  wire [31:0] shli11_result;
  wire  shli11_result_valid;
  wire  shli11_result_ready;
  wire [6:0] trunci17_outs;
  wire  trunci17_outs_valid;
  wire  trunci17_outs_ready;
  wire [6:0] addi20_result;
  wire  addi20_result_valid;
  wire  addi20_result_ready;
  wire [6:0] addi7_result;
  wire  addi7_result_valid;
  wire  addi7_result_ready;
  wire [6:0] load4_addrOut;
  wire  load4_addrOut_valid;
  wire  load4_addrOut_ready;
  wire [7:0] load4_dataOut;
  wire  load4_dataOut_valid;
  wire  load4_dataOut_ready;
  wire [15:0] extsi74_outs;
  wire  extsi74_outs_valid;
  wire  extsi74_outs_ready;
  wire [15:0] muli3_result;
  wire  muli3_result_valid;
  wire  muli3_result_ready;
  wire [31:0] extsi75_outs;
  wire  extsi75_outs_valid;
  wire  extsi75_outs_ready;
  wire [31:0] buffer72_outs;
  wire  buffer72_outs_valid;
  wire  buffer72_outs_ready;
  wire [31:0] buffer73_outs;
  wire  buffer73_outs_valid;
  wire  buffer73_outs_ready;
  wire [31:0] addi1_result;
  wire  addi1_result_valid;
  wire  addi1_result_ready;
  wire [5:0] addi12_result;
  wire  addi12_result_valid;
  wire  addi12_result_ready;
  wire [5:0] fork45_outs_0;
  wire  fork45_outs_0_valid;
  wire  fork45_outs_0_ready;
  wire [5:0] fork45_outs_1;
  wire  fork45_outs_1_valid;
  wire  fork45_outs_1_ready;
  wire [4:0] trunci18_outs;
  wire  trunci18_outs_valid;
  wire  trunci18_outs_ready;
  wire [0:0] cmpi3_result;
  wire  cmpi3_result_valid;
  wire  cmpi3_result_ready;
  wire [0:0] fork46_outs_0;
  wire  fork46_outs_0_valid;
  wire  fork46_outs_0_ready;
  wire [0:0] fork46_outs_1;
  wire  fork46_outs_1_valid;
  wire  fork46_outs_1_ready;
  wire [0:0] fork46_outs_2;
  wire  fork46_outs_2_valid;
  wire  fork46_outs_2_ready;
  wire [0:0] fork46_outs_3;
  wire  fork46_outs_3_valid;
  wire  fork46_outs_3_ready;
  wire [0:0] fork46_outs_4;
  wire  fork46_outs_4_valid;
  wire  fork46_outs_4_ready;
  wire [0:0] fork46_outs_5;
  wire  fork46_outs_5_valid;
  wire  fork46_outs_5_ready;
  wire [4:0] cond_br22_trueOut;
  wire  cond_br22_trueOut_valid;
  wire  cond_br22_trueOut_ready;
  wire [4:0] cond_br22_falseOut;
  wire  cond_br22_falseOut_valid;
  wire  cond_br22_falseOut_ready;
  wire [31:0] cond_br23_trueOut;
  wire  cond_br23_trueOut_valid;
  wire  cond_br23_trueOut_ready;
  wire [31:0] cond_br23_falseOut;
  wire  cond_br23_falseOut_valid;
  wire  cond_br23_falseOut_ready;
  wire [7:0] trunci19_outs;
  wire  trunci19_outs_valid;
  wire  trunci19_outs_ready;
  wire [7:0] buffer74_outs;
  wire  buffer74_outs_valid;
  wire  buffer74_outs_ready;
  wire [7:0] buffer75_outs;
  wire  buffer75_outs_valid;
  wire  buffer75_outs_ready;
  wire [7:0] cond_br24_trueOut;
  wire  cond_br24_trueOut_valid;
  wire  cond_br24_trueOut_ready;
  wire [7:0] cond_br24_falseOut;
  wire  cond_br24_falseOut_valid;
  wire  cond_br24_falseOut_ready;
  wire [4:0] cond_br25_trueOut;
  wire  cond_br25_trueOut_valid;
  wire  cond_br25_trueOut_ready;
  wire [4:0] cond_br25_falseOut;
  wire  cond_br25_falseOut_valid;
  wire  cond_br25_falseOut_ready;
  wire [4:0] cond_br26_trueOut;
  wire  cond_br26_trueOut_valid;
  wire  cond_br26_trueOut_ready;
  wire [4:0] cond_br26_falseOut;
  wire  cond_br26_falseOut_valid;
  wire  cond_br26_falseOut_ready;
  wire  buffer80_outs_valid;
  wire  buffer80_outs_ready;
  wire  buffer81_outs_valid;
  wire  buffer81_outs_ready;
  wire  cond_br27_trueOut_valid;
  wire  cond_br27_trueOut_ready;
  wire  cond_br27_falseOut_valid;
  wire  cond_br27_falseOut_ready;
  wire [4:0] buffer84_outs;
  wire  buffer84_outs_valid;
  wire  buffer84_outs_ready;
  wire [4:0] buffer85_outs;
  wire  buffer85_outs_valid;
  wire  buffer85_outs_ready;
  wire [4:0] fork47_outs_0;
  wire  fork47_outs_0_valid;
  wire  fork47_outs_0_ready;
  wire [4:0] fork47_outs_1;
  wire  fork47_outs_1_valid;
  wire  fork47_outs_1_ready;
  wire [31:0] extsi76_outs;
  wire  extsi76_outs_valid;
  wire  extsi76_outs_ready;
  wire [31:0] fork48_outs_0;
  wire  fork48_outs_0_valid;
  wire  fork48_outs_0_ready;
  wire [31:0] fork48_outs_1;
  wire  fork48_outs_1_valid;
  wire  fork48_outs_1_ready;
  wire [4:0] buffer86_outs;
  wire  buffer86_outs_valid;
  wire  buffer86_outs_ready;
  wire [4:0] buffer87_outs;
  wire  buffer87_outs_valid;
  wire  buffer87_outs_ready;
  wire [4:0] fork49_outs_0;
  wire  fork49_outs_0_valid;
  wire  fork49_outs_0_ready;
  wire [4:0] fork49_outs_1;
  wire  fork49_outs_1_valid;
  wire  fork49_outs_1_ready;
  wire [6:0] extsi77_outs;
  wire  extsi77_outs_valid;
  wire  extsi77_outs_ready;
  wire [5:0] extsi78_outs;
  wire  extsi78_outs_valid;
  wire  extsi78_outs_ready;
  wire  buffer90_outs_valid;
  wire  buffer90_outs_ready;
  wire  buffer91_outs_valid;
  wire  buffer91_outs_ready;
  wire  fork50_outs_0_valid;
  wire  fork50_outs_0_ready;
  wire  fork50_outs_1_valid;
  wire  fork50_outs_1_ready;
  wire [1:0] constant49_outs;
  wire  constant49_outs_valid;
  wire  constant49_outs_ready;
  wire [31:0] extsi28_outs;
  wire  extsi28_outs_valid;
  wire  extsi28_outs_ready;
  wire  source13_outs_valid;
  wire  source13_outs_ready;
  wire [1:0] constant50_outs;
  wire  constant50_outs_valid;
  wire  constant50_outs_ready;
  wire [1:0] fork51_outs_0;
  wire  fork51_outs_0_valid;
  wire  fork51_outs_0_ready;
  wire [1:0] fork51_outs_1;
  wire  fork51_outs_1_valid;
  wire  fork51_outs_1_ready;
  wire [5:0] extsi79_outs;
  wire  extsi79_outs_valid;
  wire  extsi79_outs_ready;
  wire [31:0] extsi29_outs;
  wire  extsi29_outs_valid;
  wire  extsi29_outs_ready;
  wire  source14_outs_valid;
  wire  source14_outs_ready;
  wire [4:0] constant51_outs;
  wire  constant51_outs_valid;
  wire  constant51_outs_ready;
  wire [5:0] extsi80_outs;
  wire  extsi80_outs_valid;
  wire  extsi80_outs_ready;
  wire  source15_outs_valid;
  wire  source15_outs_ready;
  wire [2:0] constant52_outs;
  wire  constant52_outs_valid;
  wire  constant52_outs_ready;
  wire [31:0] extsi31_outs;
  wire  extsi31_outs_valid;
  wire  extsi31_outs_ready;
  wire [31:0] shli12_result;
  wire  shli12_result_valid;
  wire  shli12_result_ready;
  wire [6:0] trunci20_outs;
  wire  trunci20_outs_valid;
  wire  trunci20_outs_ready;
  wire [31:0] shli13_result;
  wire  shli13_result_valid;
  wire  shli13_result_ready;
  wire [6:0] trunci21_outs;
  wire  trunci21_outs_valid;
  wire  trunci21_outs_ready;
  wire [6:0] addi21_result;
  wire  addi21_result_valid;
  wire  addi21_result_ready;
  wire [6:0] addi8_result;
  wire  addi8_result_valid;
  wire  addi8_result_ready;
  wire [7:0] buffer88_outs;
  wire  buffer88_outs_valid;
  wire  buffer88_outs_ready;
  wire [7:0] buffer89_outs;
  wire  buffer89_outs_valid;
  wire  buffer89_outs_ready;
  wire [6:0] store1_addrOut;
  wire  store1_addrOut_valid;
  wire  store1_addrOut_ready;
  wire [7:0] store1_dataToMem;
  wire  store1_dataToMem_valid;
  wire  store1_dataToMem_ready;
  wire [5:0] addi13_result;
  wire  addi13_result_valid;
  wire  addi13_result_ready;
  wire [5:0] fork52_outs_0;
  wire  fork52_outs_0_valid;
  wire  fork52_outs_0_ready;
  wire [5:0] fork52_outs_1;
  wire  fork52_outs_1_valid;
  wire  fork52_outs_1_ready;
  wire [4:0] trunci22_outs;
  wire  trunci22_outs_valid;
  wire  trunci22_outs_ready;
  wire [0:0] cmpi4_result;
  wire  cmpi4_result_valid;
  wire  cmpi4_result_ready;
  wire [0:0] fork53_outs_0;
  wire  fork53_outs_0_valid;
  wire  fork53_outs_0_ready;
  wire [0:0] fork53_outs_1;
  wire  fork53_outs_1_valid;
  wire  fork53_outs_1_ready;
  wire [0:0] fork53_outs_2;
  wire  fork53_outs_2_valid;
  wire  fork53_outs_2_ready;
  wire [0:0] fork53_outs_3;
  wire  fork53_outs_3_valid;
  wire  fork53_outs_3_ready;
  wire [4:0] cond_br28_trueOut;
  wire  cond_br28_trueOut_valid;
  wire  cond_br28_trueOut_ready;
  wire [4:0] cond_br28_falseOut;
  wire  cond_br28_falseOut_valid;
  wire  cond_br28_falseOut_ready;
  wire [7:0] buffer82_outs;
  wire  buffer82_outs_valid;
  wire  buffer82_outs_ready;
  wire [7:0] buffer83_outs;
  wire  buffer83_outs_valid;
  wire  buffer83_outs_ready;
  wire [7:0] cond_br29_trueOut;
  wire  cond_br29_trueOut_valid;
  wire  cond_br29_trueOut_ready;
  wire [7:0] cond_br29_falseOut;
  wire  cond_br29_falseOut_valid;
  wire  cond_br29_falseOut_ready;
  wire [4:0] cond_br30_trueOut;
  wire  cond_br30_trueOut_valid;
  wire  cond_br30_trueOut_ready;
  wire [4:0] cond_br30_falseOut;
  wire  cond_br30_falseOut_valid;
  wire  cond_br30_falseOut_ready;
  wire  cond_br31_trueOut_valid;
  wire  cond_br31_trueOut_ready;
  wire  cond_br31_falseOut_valid;
  wire  cond_br31_falseOut_ready;
  wire [4:0] buffer94_outs;
  wire  buffer94_outs_valid;
  wire  buffer94_outs_ready;
  wire [4:0] buffer95_outs;
  wire  buffer95_outs_valid;
  wire  buffer95_outs_ready;
  wire [5:0] extsi81_outs;
  wire  extsi81_outs_valid;
  wire  extsi81_outs_ready;
  wire  source16_outs_valid;
  wire  source16_outs_ready;
  wire [1:0] constant53_outs;
  wire  constant53_outs_valid;
  wire  constant53_outs_ready;
  wire [5:0] extsi82_outs;
  wire  extsi82_outs_valid;
  wire  extsi82_outs_ready;
  wire  source17_outs_valid;
  wire  source17_outs_ready;
  wire [4:0] constant54_outs;
  wire  constant54_outs_valid;
  wire  constant54_outs_ready;
  wire [5:0] extsi83_outs;
  wire  extsi83_outs_valid;
  wire  extsi83_outs_ready;
  wire [5:0] addi14_result;
  wire  addi14_result_valid;
  wire  addi14_result_ready;
  wire [5:0] fork54_outs_0;
  wire  fork54_outs_0_valid;
  wire  fork54_outs_0_ready;
  wire [5:0] fork54_outs_1;
  wire  fork54_outs_1_valid;
  wire  fork54_outs_1_ready;
  wire [4:0] trunci23_outs;
  wire  trunci23_outs_valid;
  wire  trunci23_outs_ready;
  wire [0:0] cmpi5_result;
  wire  cmpi5_result_valid;
  wire  cmpi5_result_ready;
  wire [0:0] fork55_outs_0;
  wire  fork55_outs_0_valid;
  wire  fork55_outs_0_ready;
  wire [0:0] fork55_outs_1;
  wire  fork55_outs_1_valid;
  wire  fork55_outs_1_ready;
  wire [0:0] fork55_outs_2;
  wire  fork55_outs_2_valid;
  wire  fork55_outs_2_ready;
  wire [4:0] cond_br32_trueOut;
  wire  cond_br32_trueOut_valid;
  wire  cond_br32_trueOut_ready;
  wire [4:0] cond_br32_falseOut;
  wire  cond_br32_falseOut_valid;
  wire  cond_br32_falseOut_ready;
  wire [7:0] buffer92_outs;
  wire  buffer92_outs_valid;
  wire  buffer92_outs_ready;
  wire [7:0] buffer93_outs;
  wire  buffer93_outs_valid;
  wire  buffer93_outs_ready;
  wire [7:0] cond_br33_trueOut;
  wire  cond_br33_trueOut_valid;
  wire  cond_br33_trueOut_ready;
  wire [7:0] cond_br33_falseOut;
  wire  cond_br33_falseOut_valid;
  wire  cond_br33_falseOut_ready;
  wire  buffer96_outs_valid;
  wire  buffer96_outs_ready;
  wire  buffer97_outs_valid;
  wire  buffer97_outs_ready;
  wire  cond_br34_trueOut_valid;
  wire  cond_br34_trueOut_ready;
  wire  cond_br34_falseOut_valid;
  wire  cond_br34_falseOut_ready;
  wire  buffer98_outs_valid;
  wire  buffer98_outs_ready;
  wire  buffer99_outs_valid;
  wire  buffer99_outs_ready;
  wire  fork56_outs_0_valid;
  wire  fork56_outs_0_ready;
  wire  fork56_outs_1_valid;
  wire  fork56_outs_1_ready;
  wire  fork56_outs_2_valid;
  wire  fork56_outs_2_ready;
  wire  fork56_outs_3_valid;
  wire  fork56_outs_3_ready;
  wire  fork56_outs_4_valid;
  wire  fork56_outs_4_ready;

  assign tmp_end_valid = mem_controller9_memEnd_valid;
  assign mem_controller9_memEnd_ready = tmp_end_ready;
  assign A_end_valid = mem_controller8_memEnd_valid;
  assign mem_controller8_memEnd_ready = A_end_ready;
  assign B_end_valid = mem_controller7_memEnd_valid;
  assign mem_controller7_memEnd_ready = B_end_ready;
  assign C_end_valid = mem_controller6_memEnd_valid;
  assign mem_controller6_memEnd_ready = C_end_ready;
  assign D_end_valid = mem_controller5_memEnd_valid;
  assign mem_controller5_memEnd_ready = D_end_ready;
  assign end_valid = fork0_outs_1_valid;
  assign fork0_outs_1_ready = end_ready;
  assign tmp_loadEn = mem_controller9_loadEn;
  assign tmp_loadAddr = mem_controller9_loadAddr;
  assign tmp_storeEn = mem_controller9_storeEn;
  assign tmp_storeAddr = mem_controller9_storeAddr;
  assign tmp_storeData = mem_controller9_storeData;
  assign A_loadEn = mem_controller8_loadEn;
  assign A_loadAddr = mem_controller8_loadAddr;
  assign A_storeEn = mem_controller8_storeEn;
  assign A_storeAddr = mem_controller8_storeAddr;
  assign A_storeData = mem_controller8_storeData;
  assign B_loadEn = mem_controller7_loadEn;
  assign B_loadAddr = mem_controller7_loadAddr;
  assign B_storeEn = mem_controller7_storeEn;
  assign B_storeAddr = mem_controller7_storeAddr;
  assign B_storeData = mem_controller7_storeData;
  assign C_loadEn = mem_controller6_loadEn;
  assign C_loadAddr = mem_controller6_loadAddr;
  assign C_storeEn = mem_controller6_storeEn;
  assign C_storeAddr = mem_controller6_storeAddr;
  assign C_storeData = mem_controller6_storeData;
  assign D_loadEn = mem_controller5_loadEn;
  assign D_loadAddr = mem_controller5_loadAddr;
  assign D_storeEn = mem_controller5_storeEn;
  assign D_storeAddr = mem_controller5_storeAddr;
  assign D_storeData = mem_controller5_storeData;

  fork_dataless #(.SIZE(3)) fork0(
    .ins_valid (start_valid),
    .ins_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready})
  );

  mem_controller #(.NUM_CONTROLS(1), .NUM_LOADS(1), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller5(
    .loadData (D_loadData),
    .memStart_valid (D_start_valid),
    .memStart_ready (D_start_ready),
    .ldAddr ({load2_addrOut}),
    .ldAddr_valid ({load2_addrOut_valid}),
    .ldAddr_ready ({load2_addrOut_ready}),
    .ctrl ({extsi28_outs}),
    .ctrl_valid ({extsi28_outs_valid}),
    .ctrl_ready ({extsi28_outs_ready}),
    .stAddr ({store1_addrOut}),
    .stAddr_valid ({store1_addrOut_valid}),
    .stAddr_ready ({store1_addrOut_ready}),
    .stData ({store1_dataToMem}),
    .stData_valid ({store1_dataToMem_valid}),
    .stData_ready ({store1_dataToMem_ready}),
    .ctrlEnd_valid (fork56_outs_4_valid),
    .ctrlEnd_ready (fork56_outs_4_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller5_ldData_0}),
    .ldData_valid ({mem_controller5_ldData_0_valid}),
    .ldData_ready ({mem_controller5_ldData_0_ready}),
    .memEnd_valid (mem_controller5_memEnd_valid),
    .memEnd_ready (mem_controller5_memEnd_ready),
    .loadEn (mem_controller5_loadEn),
    .loadAddr (mem_controller5_loadAddr),
    .storeEn (mem_controller5_storeEn),
    .storeAddr (mem_controller5_storeAddr),
    .storeData (mem_controller5_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller6(
    .loadData (C_loadData),
    .memStart_valid (C_start_valid),
    .memStart_ready (C_start_ready),
    .ldAddr ({load4_addrOut}),
    .ldAddr_valid ({load4_addrOut_valid}),
    .ldAddr_ready ({load4_addrOut_ready}),
    .ctrlEnd_valid (fork56_outs_3_valid),
    .ctrlEnd_ready (fork56_outs_3_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller6_ldData_0}),
    .ldData_valid ({mem_controller6_ldData_0_valid}),
    .ldData_ready ({mem_controller6_ldData_0_ready}),
    .memEnd_valid (mem_controller6_memEnd_valid),
    .memEnd_ready (mem_controller6_memEnd_ready),
    .loadEn (mem_controller6_loadEn),
    .loadAddr (mem_controller6_loadAddr),
    .storeEn (mem_controller6_storeEn),
    .storeAddr (mem_controller6_storeAddr),
    .storeData (mem_controller6_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller7(
    .loadData (B_loadData),
    .memStart_valid (B_start_valid),
    .memStart_ready (B_start_ready),
    .ldAddr ({load1_addrOut}),
    .ldAddr_valid ({load1_addrOut_valid}),
    .ldAddr_ready ({load1_addrOut_ready}),
    .ctrlEnd_valid (fork56_outs_2_valid),
    .ctrlEnd_ready (fork56_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller7_ldData_0}),
    .ldData_valid ({mem_controller7_ldData_0_valid}),
    .ldData_ready ({mem_controller7_ldData_0_ready}),
    .memEnd_valid (mem_controller7_memEnd_valid),
    .memEnd_ready (mem_controller7_memEnd_ready),
    .loadEn (mem_controller7_loadEn),
    .loadAddr (mem_controller7_loadAddr),
    .storeEn (mem_controller7_storeEn),
    .storeAddr (mem_controller7_storeAddr),
    .storeData (mem_controller7_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller8(
    .loadData (A_loadData),
    .memStart_valid (A_start_valid),
    .memStart_ready (A_start_ready),
    .ldAddr ({load0_addrOut}),
    .ldAddr_valid ({load0_addrOut_valid}),
    .ldAddr_ready ({load0_addrOut_ready}),
    .ctrlEnd_valid (fork56_outs_1_valid),
    .ctrlEnd_ready (fork56_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller8_ldData_0}),
    .ldData_valid ({mem_controller8_ldData_0_valid}),
    .ldData_ready ({mem_controller8_ldData_0_ready}),
    .memEnd_valid (mem_controller8_memEnd_valid),
    .memEnd_ready (mem_controller8_memEnd_ready),
    .loadEn (mem_controller8_loadEn),
    .loadAddr (mem_controller8_loadAddr),
    .storeEn (mem_controller8_storeEn),
    .storeAddr (mem_controller8_storeAddr),
    .storeData (mem_controller8_storeData)
  );

  mem_controller #(.NUM_CONTROLS(1), .NUM_LOADS(1), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller9(
    .loadData (tmp_loadData),
    .memStart_valid (tmp_start_valid),
    .memStart_ready (tmp_start_ready),
    .ctrl ({extsi14_outs}),
    .ctrl_valid ({extsi14_outs_valid}),
    .ctrl_ready ({extsi14_outs_ready}),
    .stAddr ({store0_addrOut}),
    .stAddr_valid ({store0_addrOut_valid}),
    .stAddr_ready ({store0_addrOut_ready}),
    .stData ({store0_dataToMem}),
    .stData_valid ({store0_dataToMem_valid}),
    .stData_ready ({store0_dataToMem_ready}),
    .ldAddr ({load3_addrOut}),
    .ldAddr_valid ({load3_addrOut_valid}),
    .ldAddr_ready ({load3_addrOut_ready}),
    .ctrlEnd_valid (fork56_outs_0_valid),
    .ctrlEnd_ready (fork56_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller9_ldData_0}),
    .ldData_valid ({mem_controller9_ldData_0_valid}),
    .ldData_ready ({mem_controller9_ldData_0_ready}),
    .memEnd_valid (mem_controller9_memEnd_valid),
    .memEnd_ready (mem_controller9_memEnd_ready),
    .loadEn (mem_controller9_loadEn),
    .loadAddr (mem_controller9_loadAddr),
    .storeEn (mem_controller9_storeEn),
    .storeAddr (mem_controller9_storeAddr),
    .storeData (mem_controller9_storeData)
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant29(
    .ctrl_valid (fork0_outs_0_valid),
    .ctrl_ready (fork0_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant29_outs),
    .outs_valid (constant29_outs_valid),
    .outs_ready (constant29_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi39(
    .ins (constant29_outs),
    .ins_valid (constant29_outs_valid),
    .ins_ready (constant29_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi39_outs),
    .outs_valid (extsi39_outs_valid),
    .outs_ready (extsi39_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux0(
    .index (fork1_outs_0),
    .index_valid (fork1_outs_0_valid),
    .index_ready (fork1_outs_0_ready),
    .ins ({cond_br18_trueOut, extsi39_outs}),
    .ins_valid ({cond_br18_trueOut_valid, extsi39_outs_valid}),
    .ins_ready ({cond_br18_trueOut_ready, extsi39_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux0_outs),
    .outs_valid (mux0_outs_valid),
    .outs_ready (mux0_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux1(
    .index (fork1_outs_2),
    .index_valid (fork1_outs_2_valid),
    .index_ready (fork1_outs_2_ready),
    .ins ({cond_br19_trueOut, beta}),
    .ins_valid ({cond_br19_trueOut_valid, beta_valid}),
    .ins_ready ({cond_br19_trueOut_ready, beta_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux1_outs),
    .outs_valid (mux1_outs_valid),
    .outs_ready (mux1_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux2(
    .index (fork1_outs_1),
    .index_valid (fork1_outs_1_valid),
    .index_ready (fork1_outs_1_ready),
    .ins ({cond_br20_trueOut, alpha}),
    .ins_valid ({cond_br20_trueOut_valid, alpha_valid}),
    .ins_ready ({cond_br20_trueOut_ready, alpha_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux2_outs),
    .outs_valid (mux2_outs_valid),
    .outs_ready (mux2_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .ins_valid ({cond_br21_trueOut_valid, fork0_outs_2_valid}),
    .ins_ready ({cond_br21_trueOut_ready, fork0_outs_2_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge0_outs_valid),
    .outs_ready (control_merge0_outs_ready),
    .index (control_merge0_index),
    .index_valid (control_merge0_index_valid),
    .index_ready (control_merge0_index_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork1(
    .ins (control_merge0_index),
    .ins_valid (control_merge0_index_valid),
    .ins_ready (control_merge0_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork1_outs_2, fork1_outs_1, fork1_outs_0}),
    .outs_valid ({fork1_outs_2_valid, fork1_outs_1_valid, fork1_outs_0_valid}),
    .outs_ready ({fork1_outs_2_ready, fork1_outs_1_ready, fork1_outs_0_ready})
  );

  oehb_dataless buffer6(
    .ins_valid (control_merge0_outs_valid),
    .ins_ready (control_merge0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer6_outs_valid),
    .outs_ready (buffer6_outs_ready)
  );

  tehb_dataless buffer7(
    .ins_valid (buffer6_outs_valid),
    .ins_ready (buffer6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer7_outs_valid),
    .outs_ready (buffer7_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork2(
    .ins_valid (buffer7_outs_valid),
    .ins_ready (buffer7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork2_outs_1_valid, fork2_outs_0_valid}),
    .outs_ready ({fork2_outs_1_ready, fork2_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant30(
    .ctrl_valid (fork2_outs_0_valid),
    .ctrl_ready (fork2_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant30_outs),
    .outs_valid (constant30_outs_valid),
    .outs_ready (constant30_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi38(
    .ins (constant30_outs),
    .ins_valid (constant30_outs_valid),
    .ins_ready (constant30_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi38_outs),
    .outs_valid (extsi38_outs_valid),
    .outs_ready (extsi38_outs_ready)
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

  oehb #(.DATA_TYPE(8)) buffer4(
    .ins (mux2_outs),
    .ins_valid (mux2_outs_valid),
    .ins_ready (mux2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer4_outs),
    .outs_valid (buffer4_outs_valid),
    .outs_ready (buffer4_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer5(
    .ins (buffer4_outs),
    .ins_valid (buffer4_outs_valid),
    .ins_ready (buffer4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer5_outs),
    .outs_valid (buffer5_outs_valid),
    .outs_ready (buffer5_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer0(
    .ins (mux0_outs),
    .ins_valid (mux0_outs_valid),
    .ins_ready (mux0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer0_outs),
    .outs_valid (buffer0_outs_valid),
    .outs_ready (buffer0_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer1(
    .ins (buffer0_outs),
    .ins_valid (buffer0_outs_valid),
    .ins_ready (buffer0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer1_outs),
    .outs_valid (buffer1_outs_valid),
    .outs_ready (buffer1_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux3(
    .index (fork3_outs_2),
    .index_valid (fork3_outs_2_valid),
    .index_ready (fork3_outs_2_ready),
    .ins ({cond_br13_trueOut, extsi38_outs}),
    .ins_valid ({cond_br13_trueOut_valid, extsi38_outs_valid}),
    .ins_ready ({cond_br13_trueOut_ready, extsi38_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux3_outs),
    .outs_valid (mux3_outs_valid),
    .outs_ready (mux3_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux4(
    .index (fork3_outs_3),
    .index_valid (fork3_outs_3_valid),
    .index_ready (fork3_outs_3_ready),
    .ins ({cond_br14_trueOut, buffer3_outs}),
    .ins_valid ({cond_br14_trueOut_valid, buffer3_outs_valid}),
    .ins_ready ({cond_br14_trueOut_ready, buffer3_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux4_outs),
    .outs_valid (mux4_outs_valid),
    .outs_ready (mux4_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux5(
    .index (fork3_outs_1),
    .index_valid (fork3_outs_1_valid),
    .index_ready (fork3_outs_1_ready),
    .ins ({cond_br15_trueOut, buffer5_outs}),
    .ins_valid ({cond_br15_trueOut_valid, buffer5_outs_valid}),
    .ins_ready ({cond_br15_trueOut_ready, buffer5_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux5_outs),
    .outs_valid (mux5_outs_valid),
    .outs_ready (mux5_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux6(
    .index (fork3_outs_0),
    .index_valid (fork3_outs_0_valid),
    .index_ready (fork3_outs_0_ready),
    .ins ({cond_br16_trueOut, buffer1_outs}),
    .ins_valid ({cond_br16_trueOut_valid, buffer1_outs_valid}),
    .ins_ready ({cond_br16_trueOut_ready, buffer1_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux6_outs),
    .outs_valid (mux6_outs_valid),
    .outs_ready (mux6_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge1(
    .ins_valid ({cond_br17_trueOut_valid, fork2_outs_1_valid}),
    .ins_ready ({cond_br17_trueOut_ready, fork2_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge1_outs_valid),
    .outs_ready (control_merge1_outs_ready),
    .index (control_merge1_index),
    .index_valid (control_merge1_index_valid),
    .index_ready (control_merge1_index_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork3(
    .ins (control_merge1_index),
    .ins_valid (control_merge1_index_valid),
    .ins_ready (control_merge1_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork3_outs_3, fork3_outs_2, fork3_outs_1, fork3_outs_0}),
    .outs_valid ({fork3_outs_3_valid, fork3_outs_2_valid, fork3_outs_1_valid, fork3_outs_0_valid}),
    .outs_ready ({fork3_outs_3_ready, fork3_outs_2_ready, fork3_outs_1_ready, fork3_outs_0_ready})
  );

  oehb_dataless buffer16(
    .ins_valid (control_merge1_outs_valid),
    .ins_ready (control_merge1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer16_outs_valid),
    .outs_ready (buffer16_outs_ready)
  );

  tehb_dataless buffer17(
    .ins_valid (buffer16_outs_valid),
    .ins_ready (buffer16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer17_outs_valid),
    .outs_ready (buffer17_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork4(
    .ins_valid (buffer17_outs_valid),
    .ins_ready (buffer17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork4_outs_1_valid, fork4_outs_0_valid}),
    .outs_ready ({fork4_outs_1_ready, fork4_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant31(
    .ctrl_valid (fork4_outs_0_valid),
    .ctrl_ready (fork4_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant31_outs),
    .outs_valid (constant31_outs_valid),
    .outs_ready (constant31_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork5(
    .ins (constant31_outs),
    .ins_valid (constant31_outs_valid),
    .ins_ready (constant31_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork5_outs_1, fork5_outs_0}),
    .outs_valid ({fork5_outs_1_valid, fork5_outs_0_valid}),
    .outs_ready ({fork5_outs_1_ready, fork5_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi37(
    .ins (fork5_outs_0),
    .ins_valid (fork5_outs_0_valid),
    .ins_ready (fork5_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi37_outs),
    .outs_valid (extsi37_outs_valid),
    .outs_ready (extsi37_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi40(
    .ins (fork5_outs_1),
    .ins_valid (fork5_outs_1_valid),
    .ins_ready (fork5_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi40_outs),
    .outs_valid (extsi40_outs_valid),
    .outs_ready (extsi40_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer10(
    .ins (mux4_outs),
    .ins_valid (mux4_outs_valid),
    .ins_ready (mux4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer10_outs),
    .outs_valid (buffer10_outs_valid),
    .outs_ready (buffer10_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer11(
    .ins (buffer10_outs),
    .ins_valid (buffer10_outs_valid),
    .ins_ready (buffer10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer11_outs),
    .outs_valid (buffer11_outs_valid),
    .outs_ready (buffer11_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer12(
    .ins (mux5_outs),
    .ins_valid (mux5_outs_valid),
    .ins_ready (mux5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer12_outs),
    .outs_valid (buffer12_outs_valid),
    .outs_ready (buffer12_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer13(
    .ins (buffer12_outs),
    .ins_valid (buffer12_outs_valid),
    .ins_ready (buffer12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer13_outs),
    .outs_valid (buffer13_outs_valid),
    .outs_ready (buffer13_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer14(
    .ins (mux6_outs),
    .ins_valid (mux6_outs_valid),
    .ins_ready (mux6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer14_outs),
    .outs_valid (buffer14_outs_valid),
    .outs_ready (buffer14_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer15(
    .ins (buffer14_outs),
    .ins_valid (buffer14_outs_valid),
    .ins_ready (buffer14_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer15_outs),
    .outs_valid (buffer15_outs_valid),
    .outs_ready (buffer15_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer8(
    .ins (mux3_outs),
    .ins_valid (mux3_outs_valid),
    .ins_ready (mux3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer8_outs),
    .outs_valid (buffer8_outs_valid),
    .outs_ready (buffer8_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer9(
    .ins (buffer8_outs),
    .ins_valid (buffer8_outs_valid),
    .ins_ready (buffer8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer9_outs),
    .outs_valid (buffer9_outs_valid),
    .outs_ready (buffer9_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux7(
    .index (fork12_outs_3),
    .index_valid (fork12_outs_3_valid),
    .index_ready (fork12_outs_3_ready),
    .ins ({cond_br6_trueOut, extsi37_outs}),
    .ins_valid ({cond_br6_trueOut_valid, extsi37_outs_valid}),
    .ins_ready ({cond_br6_trueOut_ready, extsi37_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux7_outs),
    .outs_valid (mux7_outs_valid),
    .outs_ready (mux7_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer18(
    .ins (mux7_outs),
    .ins_valid (mux7_outs_valid),
    .ins_ready (mux7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer18_outs),
    .outs_valid (buffer18_outs_valid),
    .outs_ready (buffer18_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer19(
    .ins (buffer18_outs),
    .ins_valid (buffer18_outs_valid),
    .ins_ready (buffer18_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer19_outs),
    .outs_valid (buffer19_outs_valid),
    .outs_ready (buffer19_outs_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(5)) fork6(
    .ins (buffer19_outs),
    .ins_valid (buffer19_outs_valid),
    .ins_ready (buffer19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork6_outs_2, fork6_outs_1, fork6_outs_0}),
    .outs_valid ({fork6_outs_2_valid, fork6_outs_1_valid, fork6_outs_0_valid}),
    .outs_ready ({fork6_outs_2_ready, fork6_outs_1_ready, fork6_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi41(
    .ins (fork6_outs_0),
    .ins_valid (fork6_outs_0_valid),
    .ins_ready (fork6_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi41_outs),
    .outs_valid (extsi41_outs_valid),
    .outs_ready (extsi41_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi42(
    .ins (fork6_outs_1),
    .ins_valid (fork6_outs_1_valid),
    .ins_ready (fork6_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi42_outs),
    .outs_valid (extsi42_outs_valid),
    .outs_ready (extsi42_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi43(
    .ins (fork6_outs_2),
    .ins_valid (fork6_outs_2_valid),
    .ins_ready (fork6_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi43_outs),
    .outs_valid (extsi43_outs_valid),
    .outs_ready (extsi43_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork7(
    .ins (extsi43_outs),
    .ins_valid (extsi43_outs_valid),
    .ins_ready (extsi43_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork7_outs_1, fork7_outs_0}),
    .outs_valid ({fork7_outs_1_valid, fork7_outs_0_valid}),
    .outs_ready ({fork7_outs_1_ready, fork7_outs_0_ready})
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux8(
    .index (fork12_outs_4),
    .index_valid (fork12_outs_4_valid),
    .index_ready (fork12_outs_4_ready),
    .ins ({cond_br7_trueOut, extsi40_outs}),
    .ins_valid ({cond_br7_trueOut_valid, extsi40_outs_valid}),
    .ins_ready ({cond_br7_trueOut_ready, extsi40_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux8_outs),
    .outs_valid (mux8_outs_valid),
    .outs_ready (mux8_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux9(
    .index (fork12_outs_5),
    .index_valid (fork12_outs_5_valid),
    .index_ready (fork12_outs_5_ready),
    .ins ({cond_br8_trueOut, buffer11_outs}),
    .ins_valid ({cond_br8_trueOut_valid, buffer11_outs_valid}),
    .ins_ready ({cond_br8_trueOut_ready, buffer11_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux9_outs),
    .outs_valid (mux9_outs_valid),
    .outs_ready (mux9_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux10(
    .index (fork12_outs_1),
    .index_valid (fork12_outs_1_valid),
    .index_ready (fork12_outs_1_ready),
    .ins ({cond_br9_trueOut, buffer13_outs}),
    .ins_valid ({cond_br9_trueOut_valid, buffer13_outs_valid}),
    .ins_ready ({cond_br9_trueOut_ready, buffer13_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux10_outs),
    .outs_valid (mux10_outs_valid),
    .outs_ready (mux10_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer24(
    .ins (mux10_outs),
    .ins_valid (mux10_outs_valid),
    .ins_ready (mux10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer24_outs),
    .outs_valid (buffer24_outs_valid),
    .outs_ready (buffer24_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer25(
    .ins (buffer24_outs),
    .ins_valid (buffer24_outs_valid),
    .ins_ready (buffer24_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer25_outs),
    .outs_valid (buffer25_outs_valid),
    .outs_ready (buffer25_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork8(
    .ins (buffer25_outs),
    .ins_valid (buffer25_outs_valid),
    .ins_ready (buffer25_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork8_outs_1, fork8_outs_0}),
    .outs_valid ({fork8_outs_1_valid, fork8_outs_0_valid}),
    .outs_ready ({fork8_outs_1_ready, fork8_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi44(
    .ins (fork8_outs_1),
    .ins_valid (fork8_outs_1_valid),
    .ins_ready (fork8_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi44_outs),
    .outs_valid (extsi44_outs_valid),
    .outs_ready (extsi44_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux11(
    .index (fork12_outs_0),
    .index_valid (fork12_outs_0_valid),
    .index_ready (fork12_outs_0_ready),
    .ins ({cond_br10_trueOut, buffer15_outs}),
    .ins_valid ({cond_br10_trueOut_valid, buffer15_outs_valid}),
    .ins_ready ({cond_br10_trueOut_ready, buffer15_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux11_outs),
    .outs_valid (mux11_outs_valid),
    .outs_ready (mux11_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer26(
    .ins (mux11_outs),
    .ins_valid (mux11_outs_valid),
    .ins_ready (mux11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer26_outs),
    .outs_valid (buffer26_outs_valid),
    .outs_ready (buffer26_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer27(
    .ins (buffer26_outs),
    .ins_valid (buffer26_outs_valid),
    .ins_ready (buffer26_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer27_outs),
    .outs_valid (buffer27_outs_valid),
    .outs_ready (buffer27_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork9(
    .ins (buffer27_outs),
    .ins_valid (buffer27_outs_valid),
    .ins_ready (buffer27_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork9_outs_1, fork9_outs_0}),
    .outs_valid ({fork9_outs_1_valid, fork9_outs_0_valid}),
    .outs_ready ({fork9_outs_1_ready, fork9_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi45(
    .ins (fork9_outs_1),
    .ins_valid (fork9_outs_1_valid),
    .ins_ready (fork9_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi45_outs),
    .outs_valid (extsi45_outs_valid),
    .outs_ready (extsi45_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork10(
    .ins (extsi45_outs),
    .ins_valid (extsi45_outs_valid),
    .ins_ready (extsi45_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork10_outs_1, fork10_outs_0}),
    .outs_valid ({fork10_outs_1_valid, fork10_outs_0_valid}),
    .outs_ready ({fork10_outs_1_ready, fork10_outs_0_ready})
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux12(
    .index (fork12_outs_2),
    .index_valid (fork12_outs_2_valid),
    .index_ready (fork12_outs_2_ready),
    .ins ({cond_br11_trueOut, buffer9_outs}),
    .ins_valid ({cond_br11_trueOut_valid, buffer9_outs_valid}),
    .ins_ready ({cond_br11_trueOut_ready, buffer9_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux12_outs),
    .outs_valid (mux12_outs_valid),
    .outs_ready (mux12_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer28(
    .ins (mux12_outs),
    .ins_valid (mux12_outs_valid),
    .ins_ready (mux12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer28_outs),
    .outs_valid (buffer28_outs_valid),
    .outs_ready (buffer28_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer29(
    .ins (buffer28_outs),
    .ins_valid (buffer28_outs_valid),
    .ins_ready (buffer28_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer29_outs),
    .outs_valid (buffer29_outs_valid),
    .outs_ready (buffer29_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork11(
    .ins (buffer29_outs),
    .ins_valid (buffer29_outs_valid),
    .ins_ready (buffer29_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork11_outs_1, fork11_outs_0}),
    .outs_valid ({fork11_outs_1_valid, fork11_outs_0_valid}),
    .outs_ready ({fork11_outs_1_ready, fork11_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi46(
    .ins (fork11_outs_0),
    .ins_valid (fork11_outs_0_valid),
    .ins_ready (fork11_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi46_outs),
    .outs_valid (extsi46_outs_valid),
    .outs_ready (extsi46_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge2(
    .ins_valid ({cond_br12_trueOut_valid, fork4_outs_1_valid}),
    .ins_ready ({cond_br12_trueOut_ready, fork4_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge2_outs_valid),
    .outs_ready (control_merge2_outs_ready),
    .index (control_merge2_index),
    .index_valid (control_merge2_index_valid),
    .index_ready (control_merge2_index_ready)
  );

  fork_type #(.SIZE(6), .DATA_TYPE(1)) fork12(
    .ins (control_merge2_index),
    .ins_valid (control_merge2_index_valid),
    .ins_ready (control_merge2_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork12_outs_5, fork12_outs_4, fork12_outs_3, fork12_outs_2, fork12_outs_1, fork12_outs_0}),
    .outs_valid ({fork12_outs_5_valid, fork12_outs_4_valid, fork12_outs_3_valid, fork12_outs_2_valid, fork12_outs_1_valid, fork12_outs_0_valid}),
    .outs_ready ({fork12_outs_5_ready, fork12_outs_4_ready, fork12_outs_3_ready, fork12_outs_2_ready, fork12_outs_1_ready, fork12_outs_0_ready})
  );

  source source0(
    .clk (clk),
    .rst (rst),
    .outs_valid (source0_outs_valid),
    .outs_ready (source0_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant32(
    .ctrl_valid (source0_outs_valid),
    .ctrl_ready (source0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant32_outs),
    .outs_valid (constant32_outs_valid),
    .outs_ready (constant32_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork13(
    .ins (constant32_outs),
    .ins_valid (constant32_outs_valid),
    .ins_ready (constant32_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork13_outs_1, fork13_outs_0}),
    .outs_valid ({fork13_outs_1_valid, fork13_outs_0_valid}),
    .outs_ready ({fork13_outs_1_ready, fork13_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi47(
    .ins (fork13_outs_0),
    .ins_valid (fork13_outs_0_valid),
    .ins_ready (fork13_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi47_outs),
    .outs_valid (extsi47_outs_valid),
    .outs_ready (extsi47_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi11(
    .ins (fork13_outs_1),
    .ins_valid (fork13_outs_1_valid),
    .ins_ready (fork13_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi11_outs),
    .outs_valid (extsi11_outs_valid),
    .outs_ready (extsi11_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork14(
    .ins (extsi11_outs),
    .ins_valid (extsi11_outs_valid),
    .ins_ready (extsi11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork14_outs_1, fork14_outs_0}),
    .outs_valid ({fork14_outs_1_valid, fork14_outs_0_valid}),
    .outs_ready ({fork14_outs_1_ready, fork14_outs_0_ready})
  );

  source source1(
    .clk (clk),
    .rst (rst),
    .outs_valid (source1_outs_valid),
    .outs_ready (source1_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant33(
    .ctrl_valid (source1_outs_valid),
    .ctrl_ready (source1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant33_outs),
    .outs_valid (constant33_outs_valid),
    .outs_ready (constant33_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi48(
    .ins (constant33_outs),
    .ins_valid (constant33_outs_valid),
    .ins_ready (constant33_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi48_outs),
    .outs_valid (extsi48_outs_valid),
    .outs_ready (extsi48_outs_ready)
  );

  source source2(
    .clk (clk),
    .rst (rst),
    .outs_valid (source2_outs_valid),
    .outs_ready (source2_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant34(
    .ctrl_valid (source2_outs_valid),
    .ctrl_ready (source2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant34_outs),
    .outs_valid (constant34_outs_valid),
    .outs_ready (constant34_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi13(
    .ins (constant34_outs),
    .ins_valid (constant34_outs_valid),
    .ins_ready (constant34_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi13_outs),
    .outs_valid (extsi13_outs_valid),
    .outs_ready (extsi13_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork15(
    .ins (extsi13_outs),
    .ins_valid (extsi13_outs_valid),
    .ins_ready (extsi13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork15_outs_1, fork15_outs_0}),
    .outs_valid ({fork15_outs_1_valid, fork15_outs_0_valid}),
    .outs_ready ({fork15_outs_1_ready, fork15_outs_0_ready})
  );

  shli #(.DATA_TYPE(32)) shli0(
    .lhs (fork10_outs_0),
    .lhs_valid (fork10_outs_0_valid),
    .lhs_ready (fork10_outs_0_ready),
    .rhs (fork14_outs_0),
    .rhs_valid (fork14_outs_0_valid),
    .rhs_ready (fork14_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .result (shli0_result),
    .result_valid (shli0_result_valid),
    .result_ready (shli0_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci2(
    .ins (shli0_result),
    .ins_valid (shli0_result_valid),
    .ins_ready (shli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci2_outs),
    .outs_valid (trunci2_outs_valid),
    .outs_ready (trunci2_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli1(
    .lhs (fork10_outs_1),
    .lhs_valid (fork10_outs_1_valid),
    .lhs_ready (fork10_outs_1_ready),
    .rhs (fork15_outs_0),
    .rhs_valid (fork15_outs_0_valid),
    .rhs_ready (fork15_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .result (shli1_result),
    .result_valid (shli1_result_valid),
    .result_ready (shli1_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci3(
    .ins (shli1_result),
    .ins_valid (shli1_result_valid),
    .ins_ready (shli1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci3_outs),
    .outs_valid (trunci3_outs_valid),
    .outs_ready (trunci3_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi15(
    .lhs (trunci2_outs),
    .lhs_valid (trunci2_outs_valid),
    .lhs_ready (trunci2_outs_ready),
    .rhs (trunci3_outs),
    .rhs_valid (trunci3_outs_valid),
    .rhs_ready (trunci3_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi15_result),
    .result_valid (addi15_result_valid),
    .result_ready (addi15_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi2(
    .lhs (extsi41_outs),
    .lhs_valid (extsi41_outs_valid),
    .lhs_ready (extsi41_outs_ready),
    .rhs (addi15_result),
    .rhs_valid (addi15_result_valid),
    .rhs_ready (addi15_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi2_result),
    .result_valid (addi2_result_valid),
    .result_ready (addi2_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load0(
    .addrIn (addi2_result),
    .addrIn_valid (addi2_result_valid),
    .addrIn_ready (addi2_result_ready),
    .dataFromMem (mem_controller8_ldData_0),
    .dataFromMem_valid (mem_controller8_ldData_0_valid),
    .dataFromMem_ready (mem_controller8_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load0_addrOut),
    .addrOut_valid (load0_addrOut_valid),
    .addrOut_ready (load0_addrOut_ready),
    .dataOut (load0_dataOut),
    .dataOut_valid (load0_dataOut_valid),
    .dataOut_ready (load0_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi49(
    .ins (load0_dataOut),
    .ins_valid (load0_dataOut_valid),
    .ins_ready (load0_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi49_outs),
    .outs_valid (extsi49_outs_valid),
    .outs_ready (extsi49_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli0(
    .lhs (extsi44_outs),
    .lhs_valid (extsi44_outs_valid),
    .lhs_ready (extsi44_outs_ready),
    .rhs (extsi49_outs),
    .rhs_valid (extsi49_outs_valid),
    .rhs_ready (extsi49_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli0_result),
    .result_valid (muli0_result_valid),
    .result_ready (muli0_result_ready)
  );

  extsi #(.INPUT_TYPE(16), .OUTPUT_TYPE(24)) extsi50(
    .ins (muli0_result),
    .ins_valid (muli0_result_valid),
    .ins_ready (muli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi50_outs),
    .outs_valid (extsi50_outs_valid),
    .outs_ready (extsi50_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli2(
    .lhs (fork7_outs_0),
    .lhs_valid (fork7_outs_0_valid),
    .lhs_ready (fork7_outs_0_ready),
    .rhs (fork14_outs_1),
    .rhs_valid (fork14_outs_1_valid),
    .rhs_ready (fork14_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .result (shli2_result),
    .result_valid (shli2_result_valid),
    .result_ready (shli2_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci4(
    .ins (shli2_result),
    .ins_valid (shli2_result_valid),
    .ins_ready (shli2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci4_outs),
    .outs_valid (trunci4_outs_valid),
    .outs_ready (trunci4_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli3(
    .lhs (fork7_outs_1),
    .lhs_valid (fork7_outs_1_valid),
    .lhs_ready (fork7_outs_1_ready),
    .rhs (fork15_outs_1),
    .rhs_valid (fork15_outs_1_valid),
    .rhs_ready (fork15_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .result (shli3_result),
    .result_valid (shli3_result_valid),
    .result_ready (shli3_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci5(
    .ins (shli3_result),
    .ins_valid (shli3_result_valid),
    .ins_ready (shli3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci5_outs),
    .outs_valid (trunci5_outs_valid),
    .outs_ready (trunci5_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi16(
    .lhs (trunci4_outs),
    .lhs_valid (trunci4_outs_valid),
    .lhs_ready (trunci4_outs_ready),
    .rhs (trunci5_outs),
    .rhs_valid (trunci5_outs_valid),
    .rhs_ready (trunci5_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi16_result),
    .result_valid (addi16_result_valid),
    .result_ready (addi16_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi3(
    .lhs (extsi46_outs),
    .lhs_valid (extsi46_outs_valid),
    .lhs_ready (extsi46_outs_ready),
    .rhs (addi16_result),
    .rhs_valid (addi16_result_valid),
    .rhs_ready (addi16_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi3_result),
    .result_valid (addi3_result_valid),
    .result_ready (addi3_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load1(
    .addrIn (addi3_result),
    .addrIn_valid (addi3_result_valid),
    .addrIn_ready (addi3_result_ready),
    .dataFromMem (mem_controller7_ldData_0),
    .dataFromMem_valid (mem_controller7_ldData_0_valid),
    .dataFromMem_ready (mem_controller7_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load1_addrOut),
    .addrOut_valid (load1_addrOut_valid),
    .addrOut_ready (load1_addrOut_ready),
    .dataOut (load1_dataOut),
    .dataOut_valid (load1_dataOut_valid),
    .dataOut_ready (load1_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(24)) extsi51(
    .ins (load1_dataOut),
    .ins_valid (load1_dataOut_valid),
    .ins_ready (load1_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi51_outs),
    .outs_valid (extsi51_outs_valid),
    .outs_ready (extsi51_outs_ready)
  );

  muli #(.DATA_TYPE(24)) muli1(
    .lhs (extsi50_outs),
    .lhs_valid (extsi50_outs_valid),
    .lhs_ready (extsi50_outs_ready),
    .rhs (extsi51_outs),
    .rhs_valid (extsi51_outs_valid),
    .rhs_ready (extsi51_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli1_result),
    .result_valid (muli1_result_valid),
    .result_ready (muli1_result_ready)
  );

  extsi #(.INPUT_TYPE(24), .OUTPUT_TYPE(32)) extsi52(
    .ins (muli1_result),
    .ins_valid (muli1_result_valid),
    .ins_ready (muli1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi52_outs),
    .outs_valid (extsi52_outs_valid),
    .outs_ready (extsi52_outs_ready)
  );

  oehb #(.DATA_TYPE(32)) buffer20(
    .ins (mux8_outs),
    .ins_valid (mux8_outs_valid),
    .ins_ready (mux8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer20_outs),
    .outs_valid (buffer20_outs_valid),
    .outs_ready (buffer20_outs_ready)
  );

  tehb #(.DATA_TYPE(32)) buffer21(
    .ins (buffer20_outs),
    .ins_valid (buffer20_outs_valid),
    .ins_ready (buffer20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer21_outs),
    .outs_valid (buffer21_outs_valid),
    .outs_ready (buffer21_outs_ready)
  );

  addi #(.DATA_TYPE(32)) addi0(
    .lhs (buffer21_outs),
    .lhs_valid (buffer21_outs_valid),
    .lhs_ready (buffer21_outs_ready),
    .rhs (extsi52_outs),
    .rhs_valid (extsi52_outs_valid),
    .rhs_ready (extsi52_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi0_result),
    .result_valid (addi0_result_valid),
    .result_ready (addi0_result_ready)
  );

  addi #(.DATA_TYPE(6)) addi9(
    .lhs (extsi42_outs),
    .lhs_valid (extsi42_outs_valid),
    .lhs_ready (extsi42_outs_ready),
    .rhs (extsi47_outs),
    .rhs_valid (extsi47_outs_valid),
    .rhs_ready (extsi47_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi9_result),
    .result_valid (addi9_result_valid),
    .result_ready (addi9_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork16(
    .ins (addi9_result),
    .ins_valid (addi9_result_valid),
    .ins_ready (addi9_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork16_outs_1, fork16_outs_0}),
    .outs_valid ({fork16_outs_1_valid, fork16_outs_0_valid}),
    .outs_ready ({fork16_outs_1_ready, fork16_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci6(
    .ins (fork16_outs_0),
    .ins_valid (fork16_outs_0_valid),
    .ins_ready (fork16_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci6_outs),
    .outs_valid (trunci6_outs_valid),
    .outs_ready (trunci6_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi0(
    .lhs (fork16_outs_1),
    .lhs_valid (fork16_outs_1_valid),
    .lhs_ready (fork16_outs_1_ready),
    .rhs (extsi48_outs),
    .rhs_valid (extsi48_outs_valid),
    .rhs_ready (extsi48_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi0_result),
    .result_valid (cmpi0_result_valid),
    .result_ready (cmpi0_result_ready)
  );

  fork_type #(.SIZE(7), .DATA_TYPE(1)) fork17(
    .ins (cmpi0_result),
    .ins_valid (cmpi0_result_valid),
    .ins_ready (cmpi0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork17_outs_6, fork17_outs_5, fork17_outs_4, fork17_outs_3, fork17_outs_2, fork17_outs_1, fork17_outs_0}),
    .outs_valid ({fork17_outs_6_valid, fork17_outs_5_valid, fork17_outs_4_valid, fork17_outs_3_valid, fork17_outs_2_valid, fork17_outs_1_valid, fork17_outs_0_valid}),
    .outs_ready ({fork17_outs_6_ready, fork17_outs_5_ready, fork17_outs_4_ready, fork17_outs_3_ready, fork17_outs_2_ready, fork17_outs_1_ready, fork17_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br6(
    .condition (fork17_outs_0),
    .condition_valid (fork17_outs_0_valid),
    .condition_ready (fork17_outs_0_ready),
    .data (trunci6_outs),
    .data_valid (trunci6_outs_valid),
    .data_ready (trunci6_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br6_trueOut),
    .trueOut_valid (cond_br6_trueOut_valid),
    .trueOut_ready (cond_br6_trueOut_ready),
    .falseOut (cond_br6_falseOut),
    .falseOut_valid (cond_br6_falseOut_valid),
    .falseOut_ready (cond_br6_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink0(
    .ins (cond_br6_falseOut),
    .ins_valid (cond_br6_falseOut_valid),
    .ins_ready (cond_br6_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br7(
    .condition (fork17_outs_4),
    .condition_valid (fork17_outs_4_valid),
    .condition_ready (fork17_outs_4_ready),
    .data (addi0_result),
    .data_valid (addi0_result_valid),
    .data_ready (addi0_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br7_trueOut),
    .trueOut_valid (cond_br7_trueOut_valid),
    .trueOut_ready (cond_br7_trueOut_ready),
    .falseOut (cond_br7_falseOut),
    .falseOut_valid (cond_br7_falseOut_valid),
    .falseOut_ready (cond_br7_falseOut_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci7(
    .ins (cond_br7_falseOut),
    .ins_valid (cond_br7_falseOut_valid),
    .ins_ready (cond_br7_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci7_outs),
    .outs_valid (trunci7_outs_valid),
    .outs_ready (trunci7_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer22(
    .ins (mux9_outs),
    .ins_valid (mux9_outs_valid),
    .ins_ready (mux9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer22_outs),
    .outs_valid (buffer22_outs_valid),
    .outs_ready (buffer22_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer23(
    .ins (buffer22_outs),
    .ins_valid (buffer22_outs_valid),
    .ins_ready (buffer22_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer23_outs),
    .outs_valid (buffer23_outs_valid),
    .outs_ready (buffer23_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br8(
    .condition (fork17_outs_5),
    .condition_valid (fork17_outs_5_valid),
    .condition_ready (fork17_outs_5_ready),
    .data (buffer23_outs),
    .data_valid (buffer23_outs_valid),
    .data_ready (buffer23_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br8_trueOut),
    .trueOut_valid (cond_br8_trueOut_valid),
    .trueOut_ready (cond_br8_trueOut_ready),
    .falseOut (cond_br8_falseOut),
    .falseOut_valid (cond_br8_falseOut_valid),
    .falseOut_ready (cond_br8_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br9(
    .condition (fork17_outs_2),
    .condition_valid (fork17_outs_2_valid),
    .condition_ready (fork17_outs_2_ready),
    .data (fork8_outs_0),
    .data_valid (fork8_outs_0_valid),
    .data_ready (fork8_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br9_trueOut),
    .trueOut_valid (cond_br9_trueOut_valid),
    .trueOut_ready (cond_br9_trueOut_ready),
    .falseOut (cond_br9_falseOut),
    .falseOut_valid (cond_br9_falseOut_valid),
    .falseOut_ready (cond_br9_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br10(
    .condition (fork17_outs_1),
    .condition_valid (fork17_outs_1_valid),
    .condition_ready (fork17_outs_1_ready),
    .data (fork9_outs_0),
    .data_valid (fork9_outs_0_valid),
    .data_ready (fork9_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br10_trueOut),
    .trueOut_valid (cond_br10_trueOut_valid),
    .trueOut_ready (cond_br10_trueOut_ready),
    .falseOut (cond_br10_falseOut),
    .falseOut_valid (cond_br10_falseOut_valid),
    .falseOut_ready (cond_br10_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br11(
    .condition (fork17_outs_3),
    .condition_valid (fork17_outs_3_valid),
    .condition_ready (fork17_outs_3_ready),
    .data (fork11_outs_1),
    .data_valid (fork11_outs_1_valid),
    .data_ready (fork11_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br11_trueOut),
    .trueOut_valid (cond_br11_trueOut_valid),
    .trueOut_ready (cond_br11_trueOut_ready),
    .falseOut (cond_br11_falseOut),
    .falseOut_valid (cond_br11_falseOut_valid),
    .falseOut_ready (cond_br11_falseOut_ready)
  );

  oehb_dataless buffer30(
    .ins_valid (control_merge2_outs_valid),
    .ins_ready (control_merge2_outs_ready),
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

  cond_br_dataless cond_br12(
    .condition (fork17_outs_6),
    .condition_valid (fork17_outs_6_valid),
    .condition_ready (fork17_outs_6_ready),
    .data_valid (buffer31_outs_valid),
    .data_ready (buffer31_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br12_trueOut_valid),
    .trueOut_ready (cond_br12_trueOut_ready),
    .falseOut_valid (cond_br12_falseOut_valid),
    .falseOut_ready (cond_br12_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer36(
    .ins (cond_br10_falseOut),
    .ins_valid (cond_br10_falseOut_valid),
    .ins_ready (cond_br10_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer36_outs),
    .outs_valid (buffer36_outs_valid),
    .outs_ready (buffer36_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer37(
    .ins (buffer36_outs),
    .ins_valid (buffer36_outs_valid),
    .ins_ready (buffer36_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer37_outs),
    .outs_valid (buffer37_outs_valid),
    .outs_ready (buffer37_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork18(
    .ins (buffer37_outs),
    .ins_valid (buffer37_outs_valid),
    .ins_ready (buffer37_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork18_outs_1, fork18_outs_0}),
    .outs_valid ({fork18_outs_1_valid, fork18_outs_0_valid}),
    .outs_ready ({fork18_outs_1_ready, fork18_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi53(
    .ins (fork18_outs_1),
    .ins_valid (fork18_outs_1_valid),
    .ins_ready (fork18_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi53_outs),
    .outs_valid (extsi53_outs_valid),
    .outs_ready (extsi53_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork19(
    .ins (extsi53_outs),
    .ins_valid (extsi53_outs_valid),
    .ins_ready (extsi53_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork19_outs_1, fork19_outs_0}),
    .outs_valid ({fork19_outs_1_valid, fork19_outs_0_valid}),
    .outs_ready ({fork19_outs_1_ready, fork19_outs_0_ready})
  );

  oehb #(.DATA_TYPE(5)) buffer38(
    .ins (cond_br11_falseOut),
    .ins_valid (cond_br11_falseOut_valid),
    .ins_ready (cond_br11_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer38_outs),
    .outs_valid (buffer38_outs_valid),
    .outs_ready (buffer38_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer39(
    .ins (buffer38_outs),
    .ins_valid (buffer38_outs_valid),
    .ins_ready (buffer38_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer39_outs),
    .outs_valid (buffer39_outs_valid),
    .outs_ready (buffer39_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork20(
    .ins (buffer39_outs),
    .ins_valid (buffer39_outs_valid),
    .ins_ready (buffer39_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork20_outs_1, fork20_outs_0}),
    .outs_valid ({fork20_outs_1_valid, fork20_outs_0_valid}),
    .outs_ready ({fork20_outs_1_ready, fork20_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi54(
    .ins (fork20_outs_0),
    .ins_valid (fork20_outs_0_valid),
    .ins_ready (fork20_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi54_outs),
    .outs_valid (extsi54_outs_valid),
    .outs_ready (extsi54_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi55(
    .ins (fork20_outs_1),
    .ins_valid (fork20_outs_1_valid),
    .ins_ready (fork20_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi55_outs),
    .outs_valid (extsi55_outs_valid),
    .outs_ready (extsi55_outs_ready)
  );

  oehb_dataless buffer42(
    .ins_valid (cond_br12_falseOut_valid),
    .ins_ready (cond_br12_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer42_outs_valid),
    .outs_ready (buffer42_outs_ready)
  );

  tehb_dataless buffer43(
    .ins_valid (buffer42_outs_valid),
    .ins_ready (buffer42_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer43_outs_valid),
    .outs_ready (buffer43_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork21(
    .ins_valid (buffer43_outs_valid),
    .ins_ready (buffer43_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork21_outs_1_valid, fork21_outs_0_valid}),
    .outs_ready ({fork21_outs_1_ready, fork21_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant35(
    .ctrl_valid (fork21_outs_0_valid),
    .ctrl_ready (fork21_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant35_outs),
    .outs_valid (constant35_outs_valid),
    .outs_ready (constant35_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi14(
    .ins (constant35_outs),
    .ins_valid (constant35_outs_valid),
    .ins_ready (constant35_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi14_outs),
    .outs_valid (extsi14_outs_valid),
    .outs_ready (extsi14_outs_ready)
  );

  source source3(
    .clk (clk),
    .rst (rst),
    .outs_valid (source3_outs_valid),
    .outs_ready (source3_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant36(
    .ctrl_valid (source3_outs_valid),
    .ctrl_ready (source3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant36_outs),
    .outs_valid (constant36_outs_valid),
    .outs_ready (constant36_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork22(
    .ins (constant36_outs),
    .ins_valid (constant36_outs_valid),
    .ins_ready (constant36_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork22_outs_1, fork22_outs_0}),
    .outs_valid ({fork22_outs_1_valid, fork22_outs_0_valid}),
    .outs_ready ({fork22_outs_1_ready, fork22_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi56(
    .ins (fork22_outs_0),
    .ins_valid (fork22_outs_0_valid),
    .ins_ready (fork22_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi56_outs),
    .outs_valid (extsi56_outs_valid),
    .outs_ready (extsi56_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi15(
    .ins (fork22_outs_1),
    .ins_valid (fork22_outs_1_valid),
    .ins_ready (fork22_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi15_outs),
    .outs_valid (extsi15_outs_valid),
    .outs_ready (extsi15_outs_ready)
  );

  source source4(
    .clk (clk),
    .rst (rst),
    .outs_valid (source4_outs_valid),
    .outs_ready (source4_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant37(
    .ctrl_valid (source4_outs_valid),
    .ctrl_ready (source4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant37_outs),
    .outs_valid (constant37_outs_valid),
    .outs_ready (constant37_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi57(
    .ins (constant37_outs),
    .ins_valid (constant37_outs_valid),
    .ins_ready (constant37_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi57_outs),
    .outs_valid (extsi57_outs_valid),
    .outs_ready (extsi57_outs_ready)
  );

  source source5(
    .clk (clk),
    .rst (rst),
    .outs_valid (source5_outs_valid),
    .outs_ready (source5_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant38(
    .ctrl_valid (source5_outs_valid),
    .ctrl_ready (source5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant38_outs),
    .outs_valid (constant38_outs_valid),
    .outs_ready (constant38_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi17(
    .ins (constant38_outs),
    .ins_valid (constant38_outs_valid),
    .ins_ready (constant38_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi17_outs),
    .outs_valid (extsi17_outs_valid),
    .outs_ready (extsi17_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli4(
    .lhs (fork19_outs_0),
    .lhs_valid (fork19_outs_0_valid),
    .lhs_ready (fork19_outs_0_ready),
    .rhs (extsi15_outs),
    .rhs_valid (extsi15_outs_valid),
    .rhs_ready (extsi15_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli4_result),
    .result_valid (shli4_result_valid),
    .result_ready (shli4_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci8(
    .ins (shli4_result),
    .ins_valid (shli4_result_valid),
    .ins_ready (shli4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci8_outs),
    .outs_valid (trunci8_outs_valid),
    .outs_ready (trunci8_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli5(
    .lhs (fork19_outs_1),
    .lhs_valid (fork19_outs_1_valid),
    .lhs_ready (fork19_outs_1_ready),
    .rhs (extsi17_outs),
    .rhs_valid (extsi17_outs_valid),
    .rhs_ready (extsi17_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli5_result),
    .result_valid (shli5_result_valid),
    .result_ready (shli5_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci9(
    .ins (shli5_result),
    .ins_valid (shli5_result_valid),
    .ins_ready (shli5_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci9_outs),
    .outs_valid (trunci9_outs_valid),
    .outs_ready (trunci9_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi17(
    .lhs (trunci8_outs),
    .lhs_valid (trunci8_outs_valid),
    .lhs_ready (trunci8_outs_ready),
    .rhs (trunci9_outs),
    .rhs_valid (trunci9_outs_valid),
    .rhs_ready (trunci9_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi17_result),
    .result_valid (addi17_result_valid),
    .result_ready (addi17_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi4(
    .lhs (extsi54_outs),
    .lhs_valid (extsi54_outs_valid),
    .lhs_ready (extsi54_outs_ready),
    .rhs (addi17_result),
    .rhs_valid (addi17_result_valid),
    .rhs_ready (addi17_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi4_result),
    .result_valid (addi4_result_valid),
    .result_ready (addi4_result_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer40(
    .ins (trunci7_outs),
    .ins_valid (trunci7_outs_valid),
    .ins_ready (trunci7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer40_outs),
    .outs_valid (buffer40_outs_valid),
    .outs_ready (buffer40_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer41(
    .ins (buffer40_outs),
    .ins_valid (buffer40_outs_valid),
    .ins_ready (buffer40_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer41_outs),
    .outs_valid (buffer41_outs_valid),
    .outs_ready (buffer41_outs_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(7)) store0(
    .addrIn (addi4_result),
    .addrIn_valid (addi4_result_valid),
    .addrIn_ready (addi4_result_ready),
    .dataIn (buffer41_outs),
    .dataIn_valid (buffer41_outs_valid),
    .dataIn_ready (buffer41_outs_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store0_addrOut),
    .addrOut_valid (store0_addrOut_valid),
    .addrOut_ready (store0_addrOut_ready),
    .dataToMem (store0_dataToMem),
    .dataToMem_valid (store0_dataToMem_valid),
    .dataToMem_ready (store0_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi10(
    .lhs (extsi55_outs),
    .lhs_valid (extsi55_outs_valid),
    .lhs_ready (extsi55_outs_ready),
    .rhs (extsi56_outs),
    .rhs_valid (extsi56_outs_valid),
    .rhs_ready (extsi56_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi10_result),
    .result_valid (addi10_result_valid),
    .result_ready (addi10_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork23(
    .ins (addi10_result),
    .ins_valid (addi10_result_valid),
    .ins_ready (addi10_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork23_outs_1, fork23_outs_0}),
    .outs_valid ({fork23_outs_1_valid, fork23_outs_0_valid}),
    .outs_ready ({fork23_outs_1_ready, fork23_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci10(
    .ins (fork23_outs_0),
    .ins_valid (fork23_outs_0_valid),
    .ins_ready (fork23_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci10_outs),
    .outs_valid (trunci10_outs_valid),
    .outs_ready (trunci10_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi1(
    .lhs (fork23_outs_1),
    .lhs_valid (fork23_outs_1_valid),
    .lhs_ready (fork23_outs_1_ready),
    .rhs (extsi57_outs),
    .rhs_valid (extsi57_outs_valid),
    .rhs_ready (extsi57_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi1_result),
    .result_valid (cmpi1_result_valid),
    .result_ready (cmpi1_result_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork24(
    .ins (cmpi1_result),
    .ins_valid (cmpi1_result_valid),
    .ins_ready (cmpi1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork24_outs_4, fork24_outs_3, fork24_outs_2, fork24_outs_1, fork24_outs_0}),
    .outs_valid ({fork24_outs_4_valid, fork24_outs_3_valid, fork24_outs_2_valid, fork24_outs_1_valid, fork24_outs_0_valid}),
    .outs_ready ({fork24_outs_4_ready, fork24_outs_3_ready, fork24_outs_2_ready, fork24_outs_1_ready, fork24_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br13(
    .condition (fork24_outs_0),
    .condition_valid (fork24_outs_0_valid),
    .condition_ready (fork24_outs_0_ready),
    .data (trunci10_outs),
    .data_valid (trunci10_outs_valid),
    .data_ready (trunci10_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br13_trueOut),
    .trueOut_valid (cond_br13_trueOut_valid),
    .trueOut_ready (cond_br13_trueOut_ready),
    .falseOut (cond_br13_falseOut),
    .falseOut_valid (cond_br13_falseOut_valid),
    .falseOut_ready (cond_br13_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink2(
    .ins (cond_br13_falseOut),
    .ins_valid (cond_br13_falseOut_valid),
    .ins_ready (cond_br13_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer32(
    .ins (cond_br8_falseOut),
    .ins_valid (cond_br8_falseOut_valid),
    .ins_ready (cond_br8_falseOut_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br14(
    .condition (fork24_outs_3),
    .condition_valid (fork24_outs_3_valid),
    .condition_ready (fork24_outs_3_ready),
    .data (buffer33_outs),
    .data_valid (buffer33_outs_valid),
    .data_ready (buffer33_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br14_trueOut),
    .trueOut_valid (cond_br14_trueOut_valid),
    .trueOut_ready (cond_br14_trueOut_ready),
    .falseOut (cond_br14_falseOut),
    .falseOut_valid (cond_br14_falseOut_valid),
    .falseOut_ready (cond_br14_falseOut_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer34(
    .ins (cond_br9_falseOut),
    .ins_valid (cond_br9_falseOut_valid),
    .ins_ready (cond_br9_falseOut_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br15(
    .condition (fork24_outs_2),
    .condition_valid (fork24_outs_2_valid),
    .condition_ready (fork24_outs_2_ready),
    .data (buffer35_outs),
    .data_valid (buffer35_outs_valid),
    .data_ready (buffer35_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br15_trueOut),
    .trueOut_valid (cond_br15_trueOut_valid),
    .trueOut_ready (cond_br15_trueOut_ready),
    .falseOut (cond_br15_falseOut),
    .falseOut_valid (cond_br15_falseOut_valid),
    .falseOut_ready (cond_br15_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br16(
    .condition (fork24_outs_1),
    .condition_valid (fork24_outs_1_valid),
    .condition_ready (fork24_outs_1_ready),
    .data (fork18_outs_0),
    .data_valid (fork18_outs_0_valid),
    .data_ready (fork18_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br16_trueOut),
    .trueOut_valid (cond_br16_trueOut_valid),
    .trueOut_ready (cond_br16_trueOut_ready),
    .falseOut (cond_br16_falseOut),
    .falseOut_valid (cond_br16_falseOut_valid),
    .falseOut_ready (cond_br16_falseOut_ready)
  );

  cond_br_dataless cond_br17(
    .condition (fork24_outs_4),
    .condition_valid (fork24_outs_4_valid),
    .condition_ready (fork24_outs_4_ready),
    .data_valid (fork21_outs_1_valid),
    .data_ready (fork21_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br17_trueOut_valid),
    .trueOut_ready (cond_br17_trueOut_ready),
    .falseOut_valid (cond_br17_falseOut_valid),
    .falseOut_ready (cond_br17_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer48(
    .ins (cond_br16_falseOut),
    .ins_valid (cond_br16_falseOut_valid),
    .ins_ready (cond_br16_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer48_outs),
    .outs_valid (buffer48_outs_valid),
    .outs_ready (buffer48_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer49(
    .ins (buffer48_outs),
    .ins_valid (buffer48_outs_valid),
    .ins_ready (buffer48_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer49_outs),
    .outs_valid (buffer49_outs_valid),
    .outs_ready (buffer49_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi58(
    .ins (buffer49_outs),
    .ins_valid (buffer49_outs_valid),
    .ins_ready (buffer49_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi58_outs),
    .outs_valid (extsi58_outs_valid),
    .outs_ready (extsi58_outs_ready)
  );

  source source6(
    .clk (clk),
    .rst (rst),
    .outs_valid (source6_outs_valid),
    .outs_ready (source6_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant39(
    .ctrl_valid (source6_outs_valid),
    .ctrl_ready (source6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant39_outs),
    .outs_valid (constant39_outs_valid),
    .outs_ready (constant39_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi59(
    .ins (constant39_outs),
    .ins_valid (constant39_outs_valid),
    .ins_ready (constant39_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi59_outs),
    .outs_valid (extsi59_outs_valid),
    .outs_ready (extsi59_outs_ready)
  );

  source source7(
    .clk (clk),
    .rst (rst),
    .outs_valid (source7_outs_valid),
    .outs_ready (source7_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant40(
    .ctrl_valid (source7_outs_valid),
    .ctrl_ready (source7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant40_outs),
    .outs_valid (constant40_outs_valid),
    .outs_ready (constant40_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi60(
    .ins (constant40_outs),
    .ins_valid (constant40_outs_valid),
    .ins_ready (constant40_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi60_outs),
    .outs_valid (extsi60_outs_valid),
    .outs_ready (extsi60_outs_ready)
  );

  addi #(.DATA_TYPE(6)) addi11(
    .lhs (extsi58_outs),
    .lhs_valid (extsi58_outs_valid),
    .lhs_ready (extsi58_outs_ready),
    .rhs (extsi59_outs),
    .rhs_valid (extsi59_outs_valid),
    .rhs_ready (extsi59_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi11_result),
    .result_valid (addi11_result_valid),
    .result_ready (addi11_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork25(
    .ins (addi11_result),
    .ins_valid (addi11_result_valid),
    .ins_ready (addi11_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork25_outs_1, fork25_outs_0}),
    .outs_valid ({fork25_outs_1_valid, fork25_outs_0_valid}),
    .outs_ready ({fork25_outs_1_ready, fork25_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci11(
    .ins (fork25_outs_0),
    .ins_valid (fork25_outs_0_valid),
    .ins_ready (fork25_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci11_outs),
    .outs_valid (trunci11_outs_valid),
    .outs_ready (trunci11_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi2(
    .lhs (fork25_outs_1),
    .lhs_valid (fork25_outs_1_valid),
    .lhs_ready (fork25_outs_1_ready),
    .rhs (extsi60_outs),
    .rhs_valid (extsi60_outs_valid),
    .rhs_ready (extsi60_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi2_result),
    .result_valid (cmpi2_result_valid),
    .result_ready (cmpi2_result_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork26(
    .ins (cmpi2_result),
    .ins_valid (cmpi2_result_valid),
    .ins_ready (cmpi2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork26_outs_3, fork26_outs_2, fork26_outs_1, fork26_outs_0}),
    .outs_valid ({fork26_outs_3_valid, fork26_outs_2_valid, fork26_outs_1_valid, fork26_outs_0_valid}),
    .outs_ready ({fork26_outs_3_ready, fork26_outs_2_ready, fork26_outs_1_ready, fork26_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br18(
    .condition (fork26_outs_0),
    .condition_valid (fork26_outs_0_valid),
    .condition_ready (fork26_outs_0_ready),
    .data (trunci11_outs),
    .data_valid (trunci11_outs_valid),
    .data_ready (trunci11_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br18_trueOut),
    .trueOut_valid (cond_br18_trueOut_valid),
    .trueOut_ready (cond_br18_trueOut_ready),
    .falseOut (cond_br18_falseOut),
    .falseOut_valid (cond_br18_falseOut_valid),
    .falseOut_ready (cond_br18_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink4(
    .ins (cond_br18_falseOut),
    .ins_valid (cond_br18_falseOut_valid),
    .ins_ready (cond_br18_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer44(
    .ins (cond_br14_falseOut),
    .ins_valid (cond_br14_falseOut_valid),
    .ins_ready (cond_br14_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer44_outs),
    .outs_valid (buffer44_outs_valid),
    .outs_ready (buffer44_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer45(
    .ins (buffer44_outs),
    .ins_valid (buffer44_outs_valid),
    .ins_ready (buffer44_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer45_outs),
    .outs_valid (buffer45_outs_valid),
    .outs_ready (buffer45_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br19(
    .condition (fork26_outs_1),
    .condition_valid (fork26_outs_1_valid),
    .condition_ready (fork26_outs_1_ready),
    .data (buffer45_outs),
    .data_valid (buffer45_outs_valid),
    .data_ready (buffer45_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br19_trueOut),
    .trueOut_valid (cond_br19_trueOut_valid),
    .trueOut_ready (cond_br19_trueOut_ready),
    .falseOut (cond_br19_falseOut),
    .falseOut_valid (cond_br19_falseOut_valid),
    .falseOut_ready (cond_br19_falseOut_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer46(
    .ins (cond_br15_falseOut),
    .ins_valid (cond_br15_falseOut_valid),
    .ins_ready (cond_br15_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer46_outs),
    .outs_valid (buffer46_outs_valid),
    .outs_ready (buffer46_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer47(
    .ins (buffer46_outs),
    .ins_valid (buffer46_outs_valid),
    .ins_ready (buffer46_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer47_outs),
    .outs_valid (buffer47_outs_valid),
    .outs_ready (buffer47_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br20(
    .condition (fork26_outs_3),
    .condition_valid (fork26_outs_3_valid),
    .condition_ready (fork26_outs_3_ready),
    .data (buffer47_outs),
    .data_valid (buffer47_outs_valid),
    .data_ready (buffer47_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br20_trueOut),
    .trueOut_valid (cond_br20_trueOut_valid),
    .trueOut_ready (cond_br20_trueOut_ready),
    .falseOut (cond_br20_falseOut),
    .falseOut_valid (cond_br20_falseOut_valid),
    .falseOut_ready (cond_br20_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink5(
    .ins (cond_br20_falseOut),
    .ins_valid (cond_br20_falseOut_valid),
    .ins_ready (cond_br20_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb_dataless buffer50(
    .ins_valid (cond_br17_falseOut_valid),
    .ins_ready (cond_br17_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer50_outs_valid),
    .outs_ready (buffer50_outs_ready)
  );

  tehb_dataless buffer51(
    .ins_valid (buffer50_outs_valid),
    .ins_ready (buffer50_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer51_outs_valid),
    .outs_ready (buffer51_outs_ready)
  );

  cond_br_dataless cond_br21(
    .condition (fork26_outs_2),
    .condition_valid (fork26_outs_2_valid),
    .condition_ready (fork26_outs_2_ready),
    .data_valid (buffer51_outs_valid),
    .data_ready (buffer51_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br21_trueOut_valid),
    .trueOut_ready (cond_br21_trueOut_ready),
    .falseOut_valid (cond_br21_falseOut_valid),
    .falseOut_ready (cond_br21_falseOut_ready)
  );

  oehb_dataless buffer54(
    .ins_valid (cond_br21_falseOut_valid),
    .ins_ready (cond_br21_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer54_outs_valid),
    .outs_ready (buffer54_outs_ready)
  );

  tehb_dataless buffer55(
    .ins_valid (buffer54_outs_valid),
    .ins_ready (buffer54_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer55_outs_valid),
    .outs_ready (buffer55_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork27(
    .ins_valid (buffer55_outs_valid),
    .ins_ready (buffer55_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork27_outs_1_valid, fork27_outs_0_valid}),
    .outs_ready ({fork27_outs_1_ready, fork27_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant41(
    .ctrl_valid (fork27_outs_0_valid),
    .ctrl_ready (fork27_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant41_outs),
    .outs_valid (constant41_outs_valid),
    .outs_ready (constant41_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi36(
    .ins (constant41_outs),
    .ins_valid (constant41_outs_valid),
    .ins_ready (constant41_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi36_outs),
    .outs_valid (extsi36_outs_valid),
    .outs_ready (extsi36_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer52(
    .ins (cond_br19_falseOut),
    .ins_valid (cond_br19_falseOut_valid),
    .ins_ready (cond_br19_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer52_outs),
    .outs_valid (buffer52_outs_valid),
    .outs_ready (buffer52_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer53(
    .ins (buffer52_outs),
    .ins_valid (buffer52_outs_valid),
    .ins_ready (buffer52_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer53_outs),
    .outs_valid (buffer53_outs_valid),
    .outs_ready (buffer53_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux13(
    .index (fork28_outs_0),
    .index_valid (fork28_outs_0_valid),
    .index_ready (fork28_outs_0_ready),
    .ins ({cond_br32_trueOut, extsi36_outs}),
    .ins_valid ({cond_br32_trueOut_valid, extsi36_outs_valid}),
    .ins_ready ({cond_br32_trueOut_ready, extsi36_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux13_outs),
    .outs_valid (mux13_outs_valid),
    .outs_ready (mux13_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux14(
    .index (fork28_outs_1),
    .index_valid (fork28_outs_1_valid),
    .index_ready (fork28_outs_1_ready),
    .ins ({cond_br33_trueOut, buffer53_outs}),
    .ins_valid ({cond_br33_trueOut_valid, buffer53_outs_valid}),
    .ins_ready ({cond_br33_trueOut_ready, buffer53_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux14_outs),
    .outs_valid (mux14_outs_valid),
    .outs_ready (mux14_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge6(
    .ins_valid ({cond_br34_trueOut_valid, fork27_outs_1_valid}),
    .ins_ready ({cond_br34_trueOut_ready, fork27_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge6_outs_valid),
    .outs_ready (control_merge6_outs_ready),
    .index (control_merge6_index),
    .index_valid (control_merge6_index_valid),
    .index_ready (control_merge6_index_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork28(
    .ins (control_merge6_index),
    .ins_valid (control_merge6_index_valid),
    .ins_ready (control_merge6_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork28_outs_1, fork28_outs_0}),
    .outs_valid ({fork28_outs_1_valid, fork28_outs_0_valid}),
    .outs_ready ({fork28_outs_1_ready, fork28_outs_0_ready})
  );

  oehb_dataless buffer60(
    .ins_valid (control_merge6_outs_valid),
    .ins_ready (control_merge6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer60_outs_valid),
    .outs_ready (buffer60_outs_ready)
  );

  tehb_dataless buffer61(
    .ins_valid (buffer60_outs_valid),
    .ins_ready (buffer60_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer61_outs_valid),
    .outs_ready (buffer61_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork29(
    .ins_valid (buffer61_outs_valid),
    .ins_ready (buffer61_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork29_outs_1_valid, fork29_outs_0_valid}),
    .outs_ready ({fork29_outs_1_ready, fork29_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant42(
    .ctrl_valid (fork29_outs_0_valid),
    .ctrl_ready (fork29_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant42_outs),
    .outs_valid (constant42_outs_valid),
    .outs_ready (constant42_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi35(
    .ins (constant42_outs),
    .ins_valid (constant42_outs_valid),
    .ins_ready (constant42_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi35_outs),
    .outs_valid (extsi35_outs_valid),
    .outs_ready (extsi35_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer58(
    .ins (mux14_outs),
    .ins_valid (mux14_outs_valid),
    .ins_ready (mux14_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer58_outs),
    .outs_valid (buffer58_outs_valid),
    .outs_ready (buffer58_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer59(
    .ins (buffer58_outs),
    .ins_valid (buffer58_outs_valid),
    .ins_ready (buffer58_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer59_outs),
    .outs_valid (buffer59_outs_valid),
    .outs_ready (buffer59_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer56(
    .ins (mux13_outs),
    .ins_valid (mux13_outs_valid),
    .ins_ready (mux13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer56_outs),
    .outs_valid (buffer56_outs_valid),
    .outs_ready (buffer56_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer57(
    .ins (buffer56_outs),
    .ins_valid (buffer56_outs_valid),
    .ins_ready (buffer56_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer57_outs),
    .outs_valid (buffer57_outs_valid),
    .outs_ready (buffer57_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux15(
    .index (fork34_outs_1),
    .index_valid (fork34_outs_1_valid),
    .index_ready (fork34_outs_1_ready),
    .ins ({cond_br28_trueOut, extsi35_outs}),
    .ins_valid ({cond_br28_trueOut_valid, extsi35_outs_valid}),
    .ins_ready ({cond_br28_trueOut_ready, extsi35_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux15_outs),
    .outs_valid (mux15_outs_valid),
    .outs_ready (mux15_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer62(
    .ins (mux15_outs),
    .ins_valid (mux15_outs_valid),
    .ins_ready (mux15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer62_outs),
    .outs_valid (buffer62_outs_valid),
    .outs_ready (buffer62_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer63(
    .ins (buffer62_outs),
    .ins_valid (buffer62_outs_valid),
    .ins_ready (buffer62_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer63_outs),
    .outs_valid (buffer63_outs_valid),
    .outs_ready (buffer63_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork30(
    .ins (buffer63_outs),
    .ins_valid (buffer63_outs_valid),
    .ins_ready (buffer63_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork30_outs_1, fork30_outs_0}),
    .outs_valid ({fork30_outs_1_valid, fork30_outs_0_valid}),
    .outs_ready ({fork30_outs_1_ready, fork30_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi61(
    .ins (fork30_outs_0),
    .ins_valid (fork30_outs_0_valid),
    .ins_ready (fork30_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi61_outs),
    .outs_valid (extsi61_outs_valid),
    .outs_ready (extsi61_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux16(
    .index (fork34_outs_2),
    .index_valid (fork34_outs_2_valid),
    .index_ready (fork34_outs_2_ready),
    .ins ({cond_br29_trueOut, buffer59_outs}),
    .ins_valid ({cond_br29_trueOut_valid, buffer59_outs_valid}),
    .ins_ready ({cond_br29_trueOut_ready, buffer59_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux16_outs),
    .outs_valid (mux16_outs_valid),
    .outs_ready (mux16_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer64(
    .ins (mux16_outs),
    .ins_valid (mux16_outs_valid),
    .ins_ready (mux16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer64_outs),
    .outs_valid (buffer64_outs_valid),
    .outs_ready (buffer64_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer65(
    .ins (buffer64_outs),
    .ins_valid (buffer64_outs_valid),
    .ins_ready (buffer64_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer65_outs),
    .outs_valid (buffer65_outs_valid),
    .outs_ready (buffer65_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork31(
    .ins (buffer65_outs),
    .ins_valid (buffer65_outs_valid),
    .ins_ready (buffer65_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork31_outs_1, fork31_outs_0}),
    .outs_valid ({fork31_outs_1_valid, fork31_outs_0_valid}),
    .outs_ready ({fork31_outs_1_ready, fork31_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi62(
    .ins (fork31_outs_1),
    .ins_valid (fork31_outs_1_valid),
    .ins_ready (fork31_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi62_outs),
    .outs_valid (extsi62_outs_valid),
    .outs_ready (extsi62_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux17(
    .index (fork34_outs_0),
    .index_valid (fork34_outs_0_valid),
    .index_ready (fork34_outs_0_ready),
    .ins ({cond_br30_trueOut, buffer57_outs}),
    .ins_valid ({cond_br30_trueOut_valid, buffer57_outs_valid}),
    .ins_ready ({cond_br30_trueOut_ready, buffer57_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux17_outs),
    .outs_valid (mux17_outs_valid),
    .outs_ready (mux17_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer66(
    .ins (mux17_outs),
    .ins_valid (mux17_outs_valid),
    .ins_ready (mux17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer66_outs),
    .outs_valid (buffer66_outs_valid),
    .outs_ready (buffer66_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer67(
    .ins (buffer66_outs),
    .ins_valid (buffer66_outs_valid),
    .ins_ready (buffer66_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer67_outs),
    .outs_valid (buffer67_outs_valid),
    .outs_ready (buffer67_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork32(
    .ins (buffer67_outs),
    .ins_valid (buffer67_outs_valid),
    .ins_ready (buffer67_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork32_outs_1, fork32_outs_0}),
    .outs_valid ({fork32_outs_1_valid, fork32_outs_0_valid}),
    .outs_ready ({fork32_outs_1_ready, fork32_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi63(
    .ins (fork32_outs_1),
    .ins_valid (fork32_outs_1_valid),
    .ins_ready (fork32_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi63_outs),
    .outs_valid (extsi63_outs_valid),
    .outs_ready (extsi63_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork33(
    .ins (extsi63_outs),
    .ins_valid (extsi63_outs_valid),
    .ins_ready (extsi63_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork33_outs_1, fork33_outs_0}),
    .outs_valid ({fork33_outs_1_valid, fork33_outs_0_valid}),
    .outs_ready ({fork33_outs_1_ready, fork33_outs_0_ready})
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge7(
    .ins_valid ({cond_br31_trueOut_valid, fork29_outs_1_valid}),
    .ins_ready ({cond_br31_trueOut_ready, fork29_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge7_outs_valid),
    .outs_ready (control_merge7_outs_ready),
    .index (control_merge7_index),
    .index_valid (control_merge7_index_valid),
    .index_ready (control_merge7_index_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork34(
    .ins (control_merge7_index),
    .ins_valid (control_merge7_index_valid),
    .ins_ready (control_merge7_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork34_outs_2, fork34_outs_1, fork34_outs_0}),
    .outs_valid ({fork34_outs_2_valid, fork34_outs_1_valid, fork34_outs_0_valid}),
    .outs_ready ({fork34_outs_2_ready, fork34_outs_1_ready, fork34_outs_0_ready})
  );

  oehb_dataless buffer68(
    .ins_valid (control_merge7_outs_valid),
    .ins_ready (control_merge7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer68_outs_valid),
    .outs_ready (buffer68_outs_ready)
  );

  tehb_dataless buffer69(
    .ins_valid (buffer68_outs_valid),
    .ins_ready (buffer68_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer69_outs_valid),
    .outs_ready (buffer69_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork35(
    .ins_valid (buffer69_outs_valid),
    .ins_ready (buffer69_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork35_outs_1_valid, fork35_outs_0_valid}),
    .outs_ready ({fork35_outs_1_ready, fork35_outs_0_ready})
  );

  source source8(
    .clk (clk),
    .rst (rst),
    .outs_valid (source8_outs_valid),
    .outs_ready (source8_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant43(
    .ctrl_valid (source8_outs_valid),
    .ctrl_ready (source8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant43_outs),
    .outs_valid (constant43_outs_valid),
    .outs_ready (constant43_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi22(
    .ins (constant43_outs),
    .ins_valid (constant43_outs_valid),
    .ins_ready (constant43_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi22_outs),
    .outs_valid (extsi22_outs_valid),
    .outs_ready (extsi22_outs_ready)
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant44(
    .ctrl_valid (fork35_outs_0_valid),
    .ctrl_ready (fork35_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant44_outs),
    .outs_valid (constant44_outs_valid),
    .outs_ready (constant44_outs_ready)
  );

  source source9(
    .clk (clk),
    .rst (rst),
    .outs_valid (source9_outs_valid),
    .outs_ready (source9_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant45(
    .ctrl_valid (source9_outs_valid),
    .ctrl_ready (source9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant45_outs),
    .outs_valid (constant45_outs_valid),
    .outs_ready (constant45_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi24(
    .ins (constant45_outs),
    .ins_valid (constant45_outs_valid),
    .ins_ready (constant45_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi24_outs),
    .outs_valid (extsi24_outs_valid),
    .outs_ready (extsi24_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli6(
    .lhs (fork33_outs_0),
    .lhs_valid (fork33_outs_0_valid),
    .lhs_ready (fork33_outs_0_ready),
    .rhs (extsi22_outs),
    .rhs_valid (extsi22_outs_valid),
    .rhs_ready (extsi22_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli6_result),
    .result_valid (shli6_result_valid),
    .result_ready (shli6_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci12(
    .ins (shli6_result),
    .ins_valid (shli6_result_valid),
    .ins_ready (shli6_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci12_outs),
    .outs_valid (trunci12_outs_valid),
    .outs_ready (trunci12_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli7(
    .lhs (fork33_outs_1),
    .lhs_valid (fork33_outs_1_valid),
    .lhs_ready (fork33_outs_1_ready),
    .rhs (extsi24_outs),
    .rhs_valid (extsi24_outs_valid),
    .rhs_ready (extsi24_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli7_result),
    .result_valid (shli7_result_valid),
    .result_ready (shli7_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci13(
    .ins (shli7_result),
    .ins_valid (shli7_result_valid),
    .ins_ready (shli7_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci13_outs),
    .outs_valid (trunci13_outs_valid),
    .outs_ready (trunci13_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi18(
    .lhs (trunci12_outs),
    .lhs_valid (trunci12_outs_valid),
    .lhs_ready (trunci12_outs_ready),
    .rhs (trunci13_outs),
    .rhs_valid (trunci13_outs_valid),
    .rhs_ready (trunci13_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi18_result),
    .result_valid (addi18_result_valid),
    .result_ready (addi18_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi5(
    .lhs (extsi61_outs),
    .lhs_valid (extsi61_outs_valid),
    .lhs_ready (extsi61_outs_ready),
    .rhs (addi18_result),
    .rhs_valid (addi18_result_valid),
    .rhs_ready (addi18_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi5_result),
    .result_valid (addi5_result_valid),
    .result_ready (addi5_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load2(
    .addrIn (addi5_result),
    .addrIn_valid (addi5_result_valid),
    .addrIn_ready (addi5_result_ready),
    .dataFromMem (mem_controller5_ldData_0),
    .dataFromMem_valid (mem_controller5_ldData_0_valid),
    .dataFromMem_ready (mem_controller5_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load2_addrOut),
    .addrOut_valid (load2_addrOut_valid),
    .addrOut_ready (load2_addrOut_ready),
    .dataOut (load2_dataOut),
    .dataOut_valid (load2_dataOut_valid),
    .dataOut_ready (load2_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi64(
    .ins (load2_dataOut),
    .ins_valid (load2_dataOut_valid),
    .ins_ready (load2_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi64_outs),
    .outs_valid (extsi64_outs_valid),
    .outs_ready (extsi64_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli2(
    .lhs (extsi64_outs),
    .lhs_valid (extsi64_outs_valid),
    .lhs_ready (extsi64_outs_ready),
    .rhs (extsi62_outs),
    .rhs_valid (extsi62_outs_valid),
    .rhs_ready (extsi62_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli2_result),
    .result_valid (muli2_result_valid),
    .result_ready (muli2_result_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi34(
    .ins (constant44_outs),
    .ins_valid (constant44_outs_valid),
    .ins_ready (constant44_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi34_outs),
    .outs_valid (extsi34_outs_valid),
    .outs_ready (extsi34_outs_ready)
  );

  extsi #(.INPUT_TYPE(16), .OUTPUT_TYPE(32)) extsi65(
    .ins (muli2_result),
    .ins_valid (muli2_result_valid),
    .ins_ready (muli2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi65_outs),
    .outs_valid (extsi65_outs_valid),
    .outs_ready (extsi65_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux18(
    .index (fork41_outs_2),
    .index_valid (fork41_outs_2_valid),
    .index_ready (fork41_outs_2_ready),
    .ins ({cond_br22_trueOut, extsi34_outs}),
    .ins_valid ({cond_br22_trueOut_valid, extsi34_outs_valid}),
    .ins_ready ({cond_br22_trueOut_ready, extsi34_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux18_outs),
    .outs_valid (mux18_outs_valid),
    .outs_ready (mux18_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer70(
    .ins (mux18_outs),
    .ins_valid (mux18_outs_valid),
    .ins_ready (mux18_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer70_outs),
    .outs_valid (buffer70_outs_valid),
    .outs_ready (buffer70_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer71(
    .ins (buffer70_outs),
    .ins_valid (buffer70_outs_valid),
    .ins_ready (buffer70_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer71_outs),
    .outs_valid (buffer71_outs_valid),
    .outs_ready (buffer71_outs_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(5)) fork36(
    .ins (buffer71_outs),
    .ins_valid (buffer71_outs_valid),
    .ins_ready (buffer71_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork36_outs_2, fork36_outs_1, fork36_outs_0}),
    .outs_valid ({fork36_outs_2_valid, fork36_outs_1_valid, fork36_outs_0_valid}),
    .outs_ready ({fork36_outs_2_ready, fork36_outs_1_ready, fork36_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi66(
    .ins (fork36_outs_0),
    .ins_valid (fork36_outs_0_valid),
    .ins_ready (fork36_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi66_outs),
    .outs_valid (extsi66_outs_valid),
    .outs_ready (extsi66_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi67(
    .ins (fork36_outs_1),
    .ins_valid (fork36_outs_1_valid),
    .ins_ready (fork36_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi67_outs),
    .outs_valid (extsi67_outs_valid),
    .outs_ready (extsi67_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi68(
    .ins (fork36_outs_2),
    .ins_valid (fork36_outs_2_valid),
    .ins_ready (fork36_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi68_outs),
    .outs_valid (extsi68_outs_valid),
    .outs_ready (extsi68_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork37(
    .ins (extsi68_outs),
    .ins_valid (extsi68_outs_valid),
    .ins_ready (extsi68_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork37_outs_1, fork37_outs_0}),
    .outs_valid ({fork37_outs_1_valid, fork37_outs_0_valid}),
    .outs_ready ({fork37_outs_1_ready, fork37_outs_0_ready})
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux19(
    .index (fork41_outs_4),
    .index_valid (fork41_outs_4_valid),
    .index_ready (fork41_outs_4_ready),
    .ins ({cond_br23_trueOut, extsi65_outs}),
    .ins_valid ({cond_br23_trueOut_valid, extsi65_outs_valid}),
    .ins_ready ({cond_br23_trueOut_ready, extsi65_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux19_outs),
    .outs_valid (mux19_outs_valid),
    .outs_ready (mux19_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux20(
    .index (fork41_outs_3),
    .index_valid (fork41_outs_3_valid),
    .index_ready (fork41_outs_3_ready),
    .ins ({cond_br24_trueOut, fork31_outs_0}),
    .ins_valid ({cond_br24_trueOut_valid, fork31_outs_0_valid}),
    .ins_ready ({cond_br24_trueOut_ready, fork31_outs_0_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux20_outs),
    .outs_valid (mux20_outs_valid),
    .outs_ready (mux20_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux21(
    .index (fork41_outs_0),
    .index_valid (fork41_outs_0_valid),
    .index_ready (fork41_outs_0_ready),
    .ins ({cond_br25_trueOut, fork32_outs_0}),
    .ins_valid ({cond_br25_trueOut_valid, fork32_outs_0_valid}),
    .ins_ready ({cond_br25_trueOut_ready, fork32_outs_0_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux21_outs),
    .outs_valid (mux21_outs_valid),
    .outs_ready (mux21_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer76(
    .ins (mux21_outs),
    .ins_valid (mux21_outs_valid),
    .ins_ready (mux21_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer76_outs),
    .outs_valid (buffer76_outs_valid),
    .outs_ready (buffer76_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer77(
    .ins (buffer76_outs),
    .ins_valid (buffer76_outs_valid),
    .ins_ready (buffer76_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer77_outs),
    .outs_valid (buffer77_outs_valid),
    .outs_ready (buffer77_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork38(
    .ins (buffer77_outs),
    .ins_valid (buffer77_outs_valid),
    .ins_ready (buffer77_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork38_outs_1, fork38_outs_0}),
    .outs_valid ({fork38_outs_1_valid, fork38_outs_0_valid}),
    .outs_ready ({fork38_outs_1_ready, fork38_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi69(
    .ins (fork38_outs_1),
    .ins_valid (fork38_outs_1_valid),
    .ins_ready (fork38_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi69_outs),
    .outs_valid (extsi69_outs_valid),
    .outs_ready (extsi69_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork39(
    .ins (extsi69_outs),
    .ins_valid (extsi69_outs_valid),
    .ins_ready (extsi69_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork39_outs_1, fork39_outs_0}),
    .outs_valid ({fork39_outs_1_valid, fork39_outs_0_valid}),
    .outs_ready ({fork39_outs_1_ready, fork39_outs_0_ready})
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux22(
    .index (fork41_outs_1),
    .index_valid (fork41_outs_1_valid),
    .index_ready (fork41_outs_1_ready),
    .ins ({cond_br26_trueOut, fork30_outs_1}),
    .ins_valid ({cond_br26_trueOut_valid, fork30_outs_1_valid}),
    .ins_ready ({cond_br26_trueOut_ready, fork30_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux22_outs),
    .outs_valid (mux22_outs_valid),
    .outs_ready (mux22_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer78(
    .ins (mux22_outs),
    .ins_valid (mux22_outs_valid),
    .ins_ready (mux22_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer78_outs),
    .outs_valid (buffer78_outs_valid),
    .outs_ready (buffer78_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer79(
    .ins (buffer78_outs),
    .ins_valid (buffer78_outs_valid),
    .ins_ready (buffer78_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer79_outs),
    .outs_valid (buffer79_outs_valid),
    .outs_ready (buffer79_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork40(
    .ins (buffer79_outs),
    .ins_valid (buffer79_outs_valid),
    .ins_ready (buffer79_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork40_outs_1, fork40_outs_0}),
    .outs_valid ({fork40_outs_1_valid, fork40_outs_0_valid}),
    .outs_ready ({fork40_outs_1_ready, fork40_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi70(
    .ins (fork40_outs_0),
    .ins_valid (fork40_outs_0_valid),
    .ins_ready (fork40_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi70_outs),
    .outs_valid (extsi70_outs_valid),
    .outs_ready (extsi70_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge8(
    .ins_valid ({cond_br27_trueOut_valid, fork35_outs_1_valid}),
    .ins_ready ({cond_br27_trueOut_ready, fork35_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge8_outs_valid),
    .outs_ready (control_merge8_outs_ready),
    .index (control_merge8_index),
    .index_valid (control_merge8_index_valid),
    .index_ready (control_merge8_index_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork41(
    .ins (control_merge8_index),
    .ins_valid (control_merge8_index_valid),
    .ins_ready (control_merge8_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork41_outs_4, fork41_outs_3, fork41_outs_2, fork41_outs_1, fork41_outs_0}),
    .outs_valid ({fork41_outs_4_valid, fork41_outs_3_valid, fork41_outs_2_valid, fork41_outs_1_valid, fork41_outs_0_valid}),
    .outs_ready ({fork41_outs_4_ready, fork41_outs_3_ready, fork41_outs_2_ready, fork41_outs_1_ready, fork41_outs_0_ready})
  );

  source source10(
    .clk (clk),
    .rst (rst),
    .outs_valid (source10_outs_valid),
    .outs_ready (source10_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant46(
    .ctrl_valid (source10_outs_valid),
    .ctrl_ready (source10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant46_outs),
    .outs_valid (constant46_outs_valid),
    .outs_ready (constant46_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork42(
    .ins (constant46_outs),
    .ins_valid (constant46_outs_valid),
    .ins_ready (constant46_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork42_outs_1, fork42_outs_0}),
    .outs_valid ({fork42_outs_1_valid, fork42_outs_0_valid}),
    .outs_ready ({fork42_outs_1_ready, fork42_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi71(
    .ins (fork42_outs_0),
    .ins_valid (fork42_outs_0_valid),
    .ins_ready (fork42_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi71_outs),
    .outs_valid (extsi71_outs_valid),
    .outs_ready (extsi71_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi25(
    .ins (fork42_outs_1),
    .ins_valid (fork42_outs_1_valid),
    .ins_ready (fork42_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi25_outs),
    .outs_valid (extsi25_outs_valid),
    .outs_ready (extsi25_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork43(
    .ins (extsi25_outs),
    .ins_valid (extsi25_outs_valid),
    .ins_ready (extsi25_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork43_outs_1, fork43_outs_0}),
    .outs_valid ({fork43_outs_1_valid, fork43_outs_0_valid}),
    .outs_ready ({fork43_outs_1_ready, fork43_outs_0_ready})
  );

  source source11(
    .clk (clk),
    .rst (rst),
    .outs_valid (source11_outs_valid),
    .outs_ready (source11_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant47(
    .ctrl_valid (source11_outs_valid),
    .ctrl_ready (source11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant47_outs),
    .outs_valid (constant47_outs_valid),
    .outs_ready (constant47_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi72(
    .ins (constant47_outs),
    .ins_valid (constant47_outs_valid),
    .ins_ready (constant47_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi72_outs),
    .outs_valid (extsi72_outs_valid),
    .outs_ready (extsi72_outs_ready)
  );

  source source12(
    .clk (clk),
    .rst (rst),
    .outs_valid (source12_outs_valid),
    .outs_ready (source12_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant48(
    .ctrl_valid (source12_outs_valid),
    .ctrl_ready (source12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant48_outs),
    .outs_valid (constant48_outs_valid),
    .outs_ready (constant48_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi27(
    .ins (constant48_outs),
    .ins_valid (constant48_outs_valid),
    .ins_ready (constant48_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi27_outs),
    .outs_valid (extsi27_outs_valid),
    .outs_ready (extsi27_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork44(
    .ins (extsi27_outs),
    .ins_valid (extsi27_outs_valid),
    .ins_ready (extsi27_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork44_outs_1, fork44_outs_0}),
    .outs_valid ({fork44_outs_1_valid, fork44_outs_0_valid}),
    .outs_ready ({fork44_outs_1_ready, fork44_outs_0_ready})
  );

  shli #(.DATA_TYPE(32)) shli8(
    .lhs (fork39_outs_0),
    .lhs_valid (fork39_outs_0_valid),
    .lhs_ready (fork39_outs_0_ready),
    .rhs (fork43_outs_0),
    .rhs_valid (fork43_outs_0_valid),
    .rhs_ready (fork43_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .result (shli8_result),
    .result_valid (shli8_result_valid),
    .result_ready (shli8_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci14(
    .ins (shli8_result),
    .ins_valid (shli8_result_valid),
    .ins_ready (shli8_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci14_outs),
    .outs_valid (trunci14_outs_valid),
    .outs_ready (trunci14_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli9(
    .lhs (fork39_outs_1),
    .lhs_valid (fork39_outs_1_valid),
    .lhs_ready (fork39_outs_1_ready),
    .rhs (fork44_outs_0),
    .rhs_valid (fork44_outs_0_valid),
    .rhs_ready (fork44_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .result (shli9_result),
    .result_valid (shli9_result_valid),
    .result_ready (shli9_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci15(
    .ins (shli9_result),
    .ins_valid (shli9_result_valid),
    .ins_ready (shli9_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci15_outs),
    .outs_valid (trunci15_outs_valid),
    .outs_ready (trunci15_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi19(
    .lhs (trunci14_outs),
    .lhs_valid (trunci14_outs_valid),
    .lhs_ready (trunci14_outs_ready),
    .rhs (trunci15_outs),
    .rhs_valid (trunci15_outs_valid),
    .rhs_ready (trunci15_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi19_result),
    .result_valid (addi19_result_valid),
    .result_ready (addi19_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi6(
    .lhs (extsi66_outs),
    .lhs_valid (extsi66_outs_valid),
    .lhs_ready (extsi66_outs_ready),
    .rhs (addi19_result),
    .rhs_valid (addi19_result_valid),
    .rhs_ready (addi19_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi6_result),
    .result_valid (addi6_result_valid),
    .result_ready (addi6_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load3(
    .addrIn (addi6_result),
    .addrIn_valid (addi6_result_valid),
    .addrIn_ready (addi6_result_ready),
    .dataFromMem (mem_controller9_ldData_0),
    .dataFromMem_valid (mem_controller9_ldData_0_valid),
    .dataFromMem_ready (mem_controller9_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load3_addrOut),
    .addrOut_valid (load3_addrOut_valid),
    .addrOut_ready (load3_addrOut_ready),
    .dataOut (load3_dataOut),
    .dataOut_valid (load3_dataOut_valid),
    .dataOut_ready (load3_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi73(
    .ins (load3_dataOut),
    .ins_valid (load3_dataOut_valid),
    .ins_ready (load3_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi73_outs),
    .outs_valid (extsi73_outs_valid),
    .outs_ready (extsi73_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli10(
    .lhs (fork37_outs_0),
    .lhs_valid (fork37_outs_0_valid),
    .lhs_ready (fork37_outs_0_ready),
    .rhs (fork43_outs_1),
    .rhs_valid (fork43_outs_1_valid),
    .rhs_ready (fork43_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .result (shli10_result),
    .result_valid (shli10_result_valid),
    .result_ready (shli10_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci16(
    .ins (shli10_result),
    .ins_valid (shli10_result_valid),
    .ins_ready (shli10_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci16_outs),
    .outs_valid (trunci16_outs_valid),
    .outs_ready (trunci16_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli11(
    .lhs (fork37_outs_1),
    .lhs_valid (fork37_outs_1_valid),
    .lhs_ready (fork37_outs_1_ready),
    .rhs (fork44_outs_1),
    .rhs_valid (fork44_outs_1_valid),
    .rhs_ready (fork44_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .result (shli11_result),
    .result_valid (shli11_result_valid),
    .result_ready (shli11_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci17(
    .ins (shli11_result),
    .ins_valid (shli11_result_valid),
    .ins_ready (shli11_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci17_outs),
    .outs_valid (trunci17_outs_valid),
    .outs_ready (trunci17_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi20(
    .lhs (trunci16_outs),
    .lhs_valid (trunci16_outs_valid),
    .lhs_ready (trunci16_outs_ready),
    .rhs (trunci17_outs),
    .rhs_valid (trunci17_outs_valid),
    .rhs_ready (trunci17_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi20_result),
    .result_valid (addi20_result_valid),
    .result_ready (addi20_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi7(
    .lhs (extsi70_outs),
    .lhs_valid (extsi70_outs_valid),
    .lhs_ready (extsi70_outs_ready),
    .rhs (addi20_result),
    .rhs_valid (addi20_result_valid),
    .rhs_ready (addi20_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi7_result),
    .result_valid (addi7_result_valid),
    .result_ready (addi7_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load4(
    .addrIn (addi7_result),
    .addrIn_valid (addi7_result_valid),
    .addrIn_ready (addi7_result_ready),
    .dataFromMem (mem_controller6_ldData_0),
    .dataFromMem_valid (mem_controller6_ldData_0_valid),
    .dataFromMem_ready (mem_controller6_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load4_addrOut),
    .addrOut_valid (load4_addrOut_valid),
    .addrOut_ready (load4_addrOut_ready),
    .dataOut (load4_dataOut),
    .dataOut_valid (load4_dataOut_valid),
    .dataOut_ready (load4_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi74(
    .ins (load4_dataOut),
    .ins_valid (load4_dataOut_valid),
    .ins_ready (load4_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi74_outs),
    .outs_valid (extsi74_outs_valid),
    .outs_ready (extsi74_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli3(
    .lhs (extsi73_outs),
    .lhs_valid (extsi73_outs_valid),
    .lhs_ready (extsi73_outs_ready),
    .rhs (extsi74_outs),
    .rhs_valid (extsi74_outs_valid),
    .rhs_ready (extsi74_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli3_result),
    .result_valid (muli3_result_valid),
    .result_ready (muli3_result_ready)
  );

  extsi #(.INPUT_TYPE(16), .OUTPUT_TYPE(32)) extsi75(
    .ins (muli3_result),
    .ins_valid (muli3_result_valid),
    .ins_ready (muli3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi75_outs),
    .outs_valid (extsi75_outs_valid),
    .outs_ready (extsi75_outs_ready)
  );

  oehb #(.DATA_TYPE(32)) buffer72(
    .ins (mux19_outs),
    .ins_valid (mux19_outs_valid),
    .ins_ready (mux19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer72_outs),
    .outs_valid (buffer72_outs_valid),
    .outs_ready (buffer72_outs_ready)
  );

  tehb #(.DATA_TYPE(32)) buffer73(
    .ins (buffer72_outs),
    .ins_valid (buffer72_outs_valid),
    .ins_ready (buffer72_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer73_outs),
    .outs_valid (buffer73_outs_valid),
    .outs_ready (buffer73_outs_ready)
  );

  addi #(.DATA_TYPE(32)) addi1(
    .lhs (buffer73_outs),
    .lhs_valid (buffer73_outs_valid),
    .lhs_ready (buffer73_outs_ready),
    .rhs (extsi75_outs),
    .rhs_valid (extsi75_outs_valid),
    .rhs_ready (extsi75_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi1_result),
    .result_valid (addi1_result_valid),
    .result_ready (addi1_result_ready)
  );

  addi #(.DATA_TYPE(6)) addi12(
    .lhs (extsi67_outs),
    .lhs_valid (extsi67_outs_valid),
    .lhs_ready (extsi67_outs_ready),
    .rhs (extsi71_outs),
    .rhs_valid (extsi71_outs_valid),
    .rhs_ready (extsi71_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi12_result),
    .result_valid (addi12_result_valid),
    .result_ready (addi12_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork45(
    .ins (addi12_result),
    .ins_valid (addi12_result_valid),
    .ins_ready (addi12_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork45_outs_1, fork45_outs_0}),
    .outs_valid ({fork45_outs_1_valid, fork45_outs_0_valid}),
    .outs_ready ({fork45_outs_1_ready, fork45_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci18(
    .ins (fork45_outs_0),
    .ins_valid (fork45_outs_0_valid),
    .ins_ready (fork45_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci18_outs),
    .outs_valid (trunci18_outs_valid),
    .outs_ready (trunci18_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi3(
    .lhs (fork45_outs_1),
    .lhs_valid (fork45_outs_1_valid),
    .lhs_ready (fork45_outs_1_ready),
    .rhs (extsi72_outs),
    .rhs_valid (extsi72_outs_valid),
    .rhs_ready (extsi72_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi3_result),
    .result_valid (cmpi3_result_valid),
    .result_ready (cmpi3_result_ready)
  );

  fork_type #(.SIZE(6), .DATA_TYPE(1)) fork46(
    .ins (cmpi3_result),
    .ins_valid (cmpi3_result_valid),
    .ins_ready (cmpi3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork46_outs_5, fork46_outs_4, fork46_outs_3, fork46_outs_2, fork46_outs_1, fork46_outs_0}),
    .outs_valid ({fork46_outs_5_valid, fork46_outs_4_valid, fork46_outs_3_valid, fork46_outs_2_valid, fork46_outs_1_valid, fork46_outs_0_valid}),
    .outs_ready ({fork46_outs_5_ready, fork46_outs_4_ready, fork46_outs_3_ready, fork46_outs_2_ready, fork46_outs_1_ready, fork46_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br22(
    .condition (fork46_outs_0),
    .condition_valid (fork46_outs_0_valid),
    .condition_ready (fork46_outs_0_ready),
    .data (trunci18_outs),
    .data_valid (trunci18_outs_valid),
    .data_ready (trunci18_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br22_trueOut),
    .trueOut_valid (cond_br22_trueOut_valid),
    .trueOut_ready (cond_br22_trueOut_ready),
    .falseOut (cond_br22_falseOut),
    .falseOut_valid (cond_br22_falseOut_valid),
    .falseOut_ready (cond_br22_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink7(
    .ins (cond_br22_falseOut),
    .ins_valid (cond_br22_falseOut_valid),
    .ins_ready (cond_br22_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br23(
    .condition (fork46_outs_3),
    .condition_valid (fork46_outs_3_valid),
    .condition_ready (fork46_outs_3_ready),
    .data (addi1_result),
    .data_valid (addi1_result_valid),
    .data_ready (addi1_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br23_trueOut),
    .trueOut_valid (cond_br23_trueOut_valid),
    .trueOut_ready (cond_br23_trueOut_ready),
    .falseOut (cond_br23_falseOut),
    .falseOut_valid (cond_br23_falseOut_valid),
    .falseOut_ready (cond_br23_falseOut_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci19(
    .ins (cond_br23_falseOut),
    .ins_valid (cond_br23_falseOut_valid),
    .ins_ready (cond_br23_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci19_outs),
    .outs_valid (trunci19_outs_valid),
    .outs_ready (trunci19_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer74(
    .ins (mux20_outs),
    .ins_valid (mux20_outs_valid),
    .ins_ready (mux20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer74_outs),
    .outs_valid (buffer74_outs_valid),
    .outs_ready (buffer74_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer75(
    .ins (buffer74_outs),
    .ins_valid (buffer74_outs_valid),
    .ins_ready (buffer74_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer75_outs),
    .outs_valid (buffer75_outs_valid),
    .outs_ready (buffer75_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br24(
    .condition (fork46_outs_5),
    .condition_valid (fork46_outs_5_valid),
    .condition_ready (fork46_outs_5_ready),
    .data (buffer75_outs),
    .data_valid (buffer75_outs_valid),
    .data_ready (buffer75_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br24_trueOut),
    .trueOut_valid (cond_br24_trueOut_valid),
    .trueOut_ready (cond_br24_trueOut_ready),
    .falseOut (cond_br24_falseOut),
    .falseOut_valid (cond_br24_falseOut_valid),
    .falseOut_ready (cond_br24_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br25(
    .condition (fork46_outs_1),
    .condition_valid (fork46_outs_1_valid),
    .condition_ready (fork46_outs_1_ready),
    .data (fork38_outs_0),
    .data_valid (fork38_outs_0_valid),
    .data_ready (fork38_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br25_trueOut),
    .trueOut_valid (cond_br25_trueOut_valid),
    .trueOut_ready (cond_br25_trueOut_ready),
    .falseOut (cond_br25_falseOut),
    .falseOut_valid (cond_br25_falseOut_valid),
    .falseOut_ready (cond_br25_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br26(
    .condition (fork46_outs_2),
    .condition_valid (fork46_outs_2_valid),
    .condition_ready (fork46_outs_2_ready),
    .data (fork40_outs_1),
    .data_valid (fork40_outs_1_valid),
    .data_ready (fork40_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br26_trueOut),
    .trueOut_valid (cond_br26_trueOut_valid),
    .trueOut_ready (cond_br26_trueOut_ready),
    .falseOut (cond_br26_falseOut),
    .falseOut_valid (cond_br26_falseOut_valid),
    .falseOut_ready (cond_br26_falseOut_ready)
  );

  oehb_dataless buffer80(
    .ins_valid (control_merge8_outs_valid),
    .ins_ready (control_merge8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer80_outs_valid),
    .outs_ready (buffer80_outs_ready)
  );

  tehb_dataless buffer81(
    .ins_valid (buffer80_outs_valid),
    .ins_ready (buffer80_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer81_outs_valid),
    .outs_ready (buffer81_outs_ready)
  );

  cond_br_dataless cond_br27(
    .condition (fork46_outs_4),
    .condition_valid (fork46_outs_4_valid),
    .condition_ready (fork46_outs_4_ready),
    .data_valid (buffer81_outs_valid),
    .data_ready (buffer81_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br27_trueOut_valid),
    .trueOut_ready (cond_br27_trueOut_ready),
    .falseOut_valid (cond_br27_falseOut_valid),
    .falseOut_ready (cond_br27_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer84(
    .ins (cond_br25_falseOut),
    .ins_valid (cond_br25_falseOut_valid),
    .ins_ready (cond_br25_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer84_outs),
    .outs_valid (buffer84_outs_valid),
    .outs_ready (buffer84_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer85(
    .ins (buffer84_outs),
    .ins_valid (buffer84_outs_valid),
    .ins_ready (buffer84_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer85_outs),
    .outs_valid (buffer85_outs_valid),
    .outs_ready (buffer85_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork47(
    .ins (buffer85_outs),
    .ins_valid (buffer85_outs_valid),
    .ins_ready (buffer85_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork47_outs_1, fork47_outs_0}),
    .outs_valid ({fork47_outs_1_valid, fork47_outs_0_valid}),
    .outs_ready ({fork47_outs_1_ready, fork47_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi76(
    .ins (fork47_outs_1),
    .ins_valid (fork47_outs_1_valid),
    .ins_ready (fork47_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi76_outs),
    .outs_valid (extsi76_outs_valid),
    .outs_ready (extsi76_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork48(
    .ins (extsi76_outs),
    .ins_valid (extsi76_outs_valid),
    .ins_ready (extsi76_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork48_outs_1, fork48_outs_0}),
    .outs_valid ({fork48_outs_1_valid, fork48_outs_0_valid}),
    .outs_ready ({fork48_outs_1_ready, fork48_outs_0_ready})
  );

  oehb #(.DATA_TYPE(5)) buffer86(
    .ins (cond_br26_falseOut),
    .ins_valid (cond_br26_falseOut_valid),
    .ins_ready (cond_br26_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer86_outs),
    .outs_valid (buffer86_outs_valid),
    .outs_ready (buffer86_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer87(
    .ins (buffer86_outs),
    .ins_valid (buffer86_outs_valid),
    .ins_ready (buffer86_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer87_outs),
    .outs_valid (buffer87_outs_valid),
    .outs_ready (buffer87_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork49(
    .ins (buffer87_outs),
    .ins_valid (buffer87_outs_valid),
    .ins_ready (buffer87_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork49_outs_1, fork49_outs_0}),
    .outs_valid ({fork49_outs_1_valid, fork49_outs_0_valid}),
    .outs_ready ({fork49_outs_1_ready, fork49_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi77(
    .ins (fork49_outs_0),
    .ins_valid (fork49_outs_0_valid),
    .ins_ready (fork49_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi77_outs),
    .outs_valid (extsi77_outs_valid),
    .outs_ready (extsi77_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi78(
    .ins (fork49_outs_1),
    .ins_valid (fork49_outs_1_valid),
    .ins_ready (fork49_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi78_outs),
    .outs_valid (extsi78_outs_valid),
    .outs_ready (extsi78_outs_ready)
  );

  oehb_dataless buffer90(
    .ins_valid (cond_br27_falseOut_valid),
    .ins_ready (cond_br27_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer90_outs_valid),
    .outs_ready (buffer90_outs_ready)
  );

  tehb_dataless buffer91(
    .ins_valid (buffer90_outs_valid),
    .ins_ready (buffer90_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer91_outs_valid),
    .outs_ready (buffer91_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork50(
    .ins_valid (buffer91_outs_valid),
    .ins_ready (buffer91_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork50_outs_1_valid, fork50_outs_0_valid}),
    .outs_ready ({fork50_outs_1_ready, fork50_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant49(
    .ctrl_valid (fork50_outs_0_valid),
    .ctrl_ready (fork50_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant49_outs),
    .outs_valid (constant49_outs_valid),
    .outs_ready (constant49_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi28(
    .ins (constant49_outs),
    .ins_valid (constant49_outs_valid),
    .ins_ready (constant49_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi28_outs),
    .outs_valid (extsi28_outs_valid),
    .outs_ready (extsi28_outs_ready)
  );

  source source13(
    .clk (clk),
    .rst (rst),
    .outs_valid (source13_outs_valid),
    .outs_ready (source13_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant50(
    .ctrl_valid (source13_outs_valid),
    .ctrl_ready (source13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant50_outs),
    .outs_valid (constant50_outs_valid),
    .outs_ready (constant50_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork51(
    .ins (constant50_outs),
    .ins_valid (constant50_outs_valid),
    .ins_ready (constant50_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork51_outs_1, fork51_outs_0}),
    .outs_valid ({fork51_outs_1_valid, fork51_outs_0_valid}),
    .outs_ready ({fork51_outs_1_ready, fork51_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi79(
    .ins (fork51_outs_0),
    .ins_valid (fork51_outs_0_valid),
    .ins_ready (fork51_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi79_outs),
    .outs_valid (extsi79_outs_valid),
    .outs_ready (extsi79_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi29(
    .ins (fork51_outs_1),
    .ins_valid (fork51_outs_1_valid),
    .ins_ready (fork51_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi29_outs),
    .outs_valid (extsi29_outs_valid),
    .outs_ready (extsi29_outs_ready)
  );

  source source14(
    .clk (clk),
    .rst (rst),
    .outs_valid (source14_outs_valid),
    .outs_ready (source14_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant51(
    .ctrl_valid (source14_outs_valid),
    .ctrl_ready (source14_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant51_outs),
    .outs_valid (constant51_outs_valid),
    .outs_ready (constant51_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi80(
    .ins (constant51_outs),
    .ins_valid (constant51_outs_valid),
    .ins_ready (constant51_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi80_outs),
    .outs_valid (extsi80_outs_valid),
    .outs_ready (extsi80_outs_ready)
  );

  source source15(
    .clk (clk),
    .rst (rst),
    .outs_valid (source15_outs_valid),
    .outs_ready (source15_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant52(
    .ctrl_valid (source15_outs_valid),
    .ctrl_ready (source15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant52_outs),
    .outs_valid (constant52_outs_valid),
    .outs_ready (constant52_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi31(
    .ins (constant52_outs),
    .ins_valid (constant52_outs_valid),
    .ins_ready (constant52_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi31_outs),
    .outs_valid (extsi31_outs_valid),
    .outs_ready (extsi31_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli12(
    .lhs (fork48_outs_0),
    .lhs_valid (fork48_outs_0_valid),
    .lhs_ready (fork48_outs_0_ready),
    .rhs (extsi29_outs),
    .rhs_valid (extsi29_outs_valid),
    .rhs_ready (extsi29_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli12_result),
    .result_valid (shli12_result_valid),
    .result_ready (shli12_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci20(
    .ins (shli12_result),
    .ins_valid (shli12_result_valid),
    .ins_ready (shli12_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci20_outs),
    .outs_valid (trunci20_outs_valid),
    .outs_ready (trunci20_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli13(
    .lhs (fork48_outs_1),
    .lhs_valid (fork48_outs_1_valid),
    .lhs_ready (fork48_outs_1_ready),
    .rhs (extsi31_outs),
    .rhs_valid (extsi31_outs_valid),
    .rhs_ready (extsi31_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli13_result),
    .result_valid (shli13_result_valid),
    .result_ready (shli13_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci21(
    .ins (shli13_result),
    .ins_valid (shli13_result_valid),
    .ins_ready (shli13_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci21_outs),
    .outs_valid (trunci21_outs_valid),
    .outs_ready (trunci21_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi21(
    .lhs (trunci20_outs),
    .lhs_valid (trunci20_outs_valid),
    .lhs_ready (trunci20_outs_ready),
    .rhs (trunci21_outs),
    .rhs_valid (trunci21_outs_valid),
    .rhs_ready (trunci21_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi21_result),
    .result_valid (addi21_result_valid),
    .result_ready (addi21_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi8(
    .lhs (extsi77_outs),
    .lhs_valid (extsi77_outs_valid),
    .lhs_ready (extsi77_outs_ready),
    .rhs (addi21_result),
    .rhs_valid (addi21_result_valid),
    .rhs_ready (addi21_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi8_result),
    .result_valid (addi8_result_valid),
    .result_ready (addi8_result_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer88(
    .ins (trunci19_outs),
    .ins_valid (trunci19_outs_valid),
    .ins_ready (trunci19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer88_outs),
    .outs_valid (buffer88_outs_valid),
    .outs_ready (buffer88_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer89(
    .ins (buffer88_outs),
    .ins_valid (buffer88_outs_valid),
    .ins_ready (buffer88_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer89_outs),
    .outs_valid (buffer89_outs_valid),
    .outs_ready (buffer89_outs_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(7)) store1(
    .addrIn (addi8_result),
    .addrIn_valid (addi8_result_valid),
    .addrIn_ready (addi8_result_ready),
    .dataIn (buffer89_outs),
    .dataIn_valid (buffer89_outs_valid),
    .dataIn_ready (buffer89_outs_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store1_addrOut),
    .addrOut_valid (store1_addrOut_valid),
    .addrOut_ready (store1_addrOut_ready),
    .dataToMem (store1_dataToMem),
    .dataToMem_valid (store1_dataToMem_valid),
    .dataToMem_ready (store1_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi13(
    .lhs (extsi78_outs),
    .lhs_valid (extsi78_outs_valid),
    .lhs_ready (extsi78_outs_ready),
    .rhs (extsi79_outs),
    .rhs_valid (extsi79_outs_valid),
    .rhs_ready (extsi79_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi13_result),
    .result_valid (addi13_result_valid),
    .result_ready (addi13_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork52(
    .ins (addi13_result),
    .ins_valid (addi13_result_valid),
    .ins_ready (addi13_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork52_outs_1, fork52_outs_0}),
    .outs_valid ({fork52_outs_1_valid, fork52_outs_0_valid}),
    .outs_ready ({fork52_outs_1_ready, fork52_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci22(
    .ins (fork52_outs_0),
    .ins_valid (fork52_outs_0_valid),
    .ins_ready (fork52_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci22_outs),
    .outs_valid (trunci22_outs_valid),
    .outs_ready (trunci22_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi4(
    .lhs (fork52_outs_1),
    .lhs_valid (fork52_outs_1_valid),
    .lhs_ready (fork52_outs_1_ready),
    .rhs (extsi80_outs),
    .rhs_valid (extsi80_outs_valid),
    .rhs_ready (extsi80_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi4_result),
    .result_valid (cmpi4_result_valid),
    .result_ready (cmpi4_result_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork53(
    .ins (cmpi4_result),
    .ins_valid (cmpi4_result_valid),
    .ins_ready (cmpi4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork53_outs_3, fork53_outs_2, fork53_outs_1, fork53_outs_0}),
    .outs_valid ({fork53_outs_3_valid, fork53_outs_2_valid, fork53_outs_1_valid, fork53_outs_0_valid}),
    .outs_ready ({fork53_outs_3_ready, fork53_outs_2_ready, fork53_outs_1_ready, fork53_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br28(
    .condition (fork53_outs_0),
    .condition_valid (fork53_outs_0_valid),
    .condition_ready (fork53_outs_0_ready),
    .data (trunci22_outs),
    .data_valid (trunci22_outs_valid),
    .data_ready (trunci22_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br28_trueOut),
    .trueOut_valid (cond_br28_trueOut_valid),
    .trueOut_ready (cond_br28_trueOut_ready),
    .falseOut (cond_br28_falseOut),
    .falseOut_valid (cond_br28_falseOut_valid),
    .falseOut_ready (cond_br28_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink9(
    .ins (cond_br28_falseOut),
    .ins_valid (cond_br28_falseOut_valid),
    .ins_ready (cond_br28_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer82(
    .ins (cond_br24_falseOut),
    .ins_valid (cond_br24_falseOut_valid),
    .ins_ready (cond_br24_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer82_outs),
    .outs_valid (buffer82_outs_valid),
    .outs_ready (buffer82_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer83(
    .ins (buffer82_outs),
    .ins_valid (buffer82_outs_valid),
    .ins_ready (buffer82_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer83_outs),
    .outs_valid (buffer83_outs_valid),
    .outs_ready (buffer83_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br29(
    .condition (fork53_outs_3),
    .condition_valid (fork53_outs_3_valid),
    .condition_ready (fork53_outs_3_ready),
    .data (buffer83_outs),
    .data_valid (buffer83_outs_valid),
    .data_ready (buffer83_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br29_trueOut),
    .trueOut_valid (cond_br29_trueOut_valid),
    .trueOut_ready (cond_br29_trueOut_ready),
    .falseOut (cond_br29_falseOut),
    .falseOut_valid (cond_br29_falseOut_valid),
    .falseOut_ready (cond_br29_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br30(
    .condition (fork53_outs_1),
    .condition_valid (fork53_outs_1_valid),
    .condition_ready (fork53_outs_1_ready),
    .data (fork47_outs_0),
    .data_valid (fork47_outs_0_valid),
    .data_ready (fork47_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br30_trueOut),
    .trueOut_valid (cond_br30_trueOut_valid),
    .trueOut_ready (cond_br30_trueOut_ready),
    .falseOut (cond_br30_falseOut),
    .falseOut_valid (cond_br30_falseOut_valid),
    .falseOut_ready (cond_br30_falseOut_ready)
  );

  cond_br_dataless cond_br31(
    .condition (fork53_outs_2),
    .condition_valid (fork53_outs_2_valid),
    .condition_ready (fork53_outs_2_ready),
    .data_valid (fork50_outs_1_valid),
    .data_ready (fork50_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br31_trueOut_valid),
    .trueOut_ready (cond_br31_trueOut_ready),
    .falseOut_valid (cond_br31_falseOut_valid),
    .falseOut_ready (cond_br31_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer94(
    .ins (cond_br30_falseOut),
    .ins_valid (cond_br30_falseOut_valid),
    .ins_ready (cond_br30_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer94_outs),
    .outs_valid (buffer94_outs_valid),
    .outs_ready (buffer94_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer95(
    .ins (buffer94_outs),
    .ins_valid (buffer94_outs_valid),
    .ins_ready (buffer94_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer95_outs),
    .outs_valid (buffer95_outs_valid),
    .outs_ready (buffer95_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi81(
    .ins (buffer95_outs),
    .ins_valid (buffer95_outs_valid),
    .ins_ready (buffer95_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi81_outs),
    .outs_valid (extsi81_outs_valid),
    .outs_ready (extsi81_outs_ready)
  );

  source source16(
    .clk (clk),
    .rst (rst),
    .outs_valid (source16_outs_valid),
    .outs_ready (source16_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant53(
    .ctrl_valid (source16_outs_valid),
    .ctrl_ready (source16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant53_outs),
    .outs_valid (constant53_outs_valid),
    .outs_ready (constant53_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi82(
    .ins (constant53_outs),
    .ins_valid (constant53_outs_valid),
    .ins_ready (constant53_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi82_outs),
    .outs_valid (extsi82_outs_valid),
    .outs_ready (extsi82_outs_ready)
  );

  source source17(
    .clk (clk),
    .rst (rst),
    .outs_valid (source17_outs_valid),
    .outs_ready (source17_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant54(
    .ctrl_valid (source17_outs_valid),
    .ctrl_ready (source17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant54_outs),
    .outs_valid (constant54_outs_valid),
    .outs_ready (constant54_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi83(
    .ins (constant54_outs),
    .ins_valid (constant54_outs_valid),
    .ins_ready (constant54_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi83_outs),
    .outs_valid (extsi83_outs_valid),
    .outs_ready (extsi83_outs_ready)
  );

  addi #(.DATA_TYPE(6)) addi14(
    .lhs (extsi81_outs),
    .lhs_valid (extsi81_outs_valid),
    .lhs_ready (extsi81_outs_ready),
    .rhs (extsi82_outs),
    .rhs_valid (extsi82_outs_valid),
    .rhs_ready (extsi82_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi14_result),
    .result_valid (addi14_result_valid),
    .result_ready (addi14_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork54(
    .ins (addi14_result),
    .ins_valid (addi14_result_valid),
    .ins_ready (addi14_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork54_outs_1, fork54_outs_0}),
    .outs_valid ({fork54_outs_1_valid, fork54_outs_0_valid}),
    .outs_ready ({fork54_outs_1_ready, fork54_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci23(
    .ins (fork54_outs_0),
    .ins_valid (fork54_outs_0_valid),
    .ins_ready (fork54_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci23_outs),
    .outs_valid (trunci23_outs_valid),
    .outs_ready (trunci23_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi5(
    .lhs (fork54_outs_1),
    .lhs_valid (fork54_outs_1_valid),
    .lhs_ready (fork54_outs_1_ready),
    .rhs (extsi83_outs),
    .rhs_valid (extsi83_outs_valid),
    .rhs_ready (extsi83_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi5_result),
    .result_valid (cmpi5_result_valid),
    .result_ready (cmpi5_result_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork55(
    .ins (cmpi5_result),
    .ins_valid (cmpi5_result_valid),
    .ins_ready (cmpi5_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork55_outs_2, fork55_outs_1, fork55_outs_0}),
    .outs_valid ({fork55_outs_2_valid, fork55_outs_1_valid, fork55_outs_0_valid}),
    .outs_ready ({fork55_outs_2_ready, fork55_outs_1_ready, fork55_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br32(
    .condition (fork55_outs_0),
    .condition_valid (fork55_outs_0_valid),
    .condition_ready (fork55_outs_0_ready),
    .data (trunci23_outs),
    .data_valid (trunci23_outs_valid),
    .data_ready (trunci23_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br32_trueOut),
    .trueOut_valid (cond_br32_trueOut_valid),
    .trueOut_ready (cond_br32_trueOut_ready),
    .falseOut (cond_br32_falseOut),
    .falseOut_valid (cond_br32_falseOut_valid),
    .falseOut_ready (cond_br32_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink11(
    .ins (cond_br32_falseOut),
    .ins_valid (cond_br32_falseOut_valid),
    .ins_ready (cond_br32_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer92(
    .ins (cond_br29_falseOut),
    .ins_valid (cond_br29_falseOut_valid),
    .ins_ready (cond_br29_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer92_outs),
    .outs_valid (buffer92_outs_valid),
    .outs_ready (buffer92_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer93(
    .ins (buffer92_outs),
    .ins_valid (buffer92_outs_valid),
    .ins_ready (buffer92_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer93_outs),
    .outs_valid (buffer93_outs_valid),
    .outs_ready (buffer93_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br33(
    .condition (fork55_outs_2),
    .condition_valid (fork55_outs_2_valid),
    .condition_ready (fork55_outs_2_ready),
    .data (buffer93_outs),
    .data_valid (buffer93_outs_valid),
    .data_ready (buffer93_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br33_trueOut),
    .trueOut_valid (cond_br33_trueOut_valid),
    .trueOut_ready (cond_br33_trueOut_ready),
    .falseOut (cond_br33_falseOut),
    .falseOut_valid (cond_br33_falseOut_valid),
    .falseOut_ready (cond_br33_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink12(
    .ins (cond_br33_falseOut),
    .ins_valid (cond_br33_falseOut_valid),
    .ins_ready (cond_br33_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb_dataless buffer96(
    .ins_valid (cond_br31_falseOut_valid),
    .ins_ready (cond_br31_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer96_outs_valid),
    .outs_ready (buffer96_outs_ready)
  );

  tehb_dataless buffer97(
    .ins_valid (buffer96_outs_valid),
    .ins_ready (buffer96_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer97_outs_valid),
    .outs_ready (buffer97_outs_ready)
  );

  cond_br_dataless cond_br34(
    .condition (fork55_outs_1),
    .condition_valid (fork55_outs_1_valid),
    .condition_ready (fork55_outs_1_ready),
    .data_valid (buffer97_outs_valid),
    .data_ready (buffer97_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br34_trueOut_valid),
    .trueOut_ready (cond_br34_trueOut_ready),
    .falseOut_valid (cond_br34_falseOut_valid),
    .falseOut_ready (cond_br34_falseOut_ready)
  );

  oehb_dataless buffer98(
    .ins_valid (cond_br34_falseOut_valid),
    .ins_ready (cond_br34_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer98_outs_valid),
    .outs_ready (buffer98_outs_ready)
  );

  tehb_dataless buffer99(
    .ins_valid (buffer98_outs_valid),
    .ins_ready (buffer98_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer99_outs_valid),
    .outs_ready (buffer99_outs_ready)
  );

  fork_dataless #(.SIZE(5)) fork56(
    .ins_valid (buffer99_outs_valid),
    .ins_ready (buffer99_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork56_outs_4_valid, fork56_outs_3_valid, fork56_outs_2_valid, fork56_outs_1_valid, fork56_outs_0_valid}),
    .outs_ready ({fork56_outs_4_ready, fork56_outs_3_ready, fork56_outs_2_ready, fork56_outs_1_ready, fork56_outs_0_ready})
  );

endmodule
