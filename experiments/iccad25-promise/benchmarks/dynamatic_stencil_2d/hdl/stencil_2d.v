module stencil_2d(
  input [7:0] orig_loadData,
  input [7:0] filter_loadData,
  input [7:0] sol_loadData,
  input  orig_start_valid,
  input  filter_start_valid,
  input  sol_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  orig_end_ready,
  input  filter_end_ready,
  input  sol_end_ready,
  input  end_ready,
  output  orig_start_ready,
  output  filter_start_ready,
  output  sol_start_ready,
  output  start_ready,
  output [7:0] out0,
  output  out0_valid,
  output  orig_end_valid,
  output  filter_end_valid,
  output  sol_end_valid,
  output  end_valid,
  output  orig_loadEn,
  output [9:0] orig_loadAddr,
  output  orig_storeEn,
  output [9:0] orig_storeAddr,
  output [7:0] orig_storeData,
  output  filter_loadEn,
  output [3:0] filter_loadAddr,
  output  filter_storeEn,
  output [3:0] filter_storeAddr,
  output [7:0] filter_storeData,
  output  sol_loadEn,
  output [9:0] sol_loadAddr,
  output  sol_storeEn,
  output [9:0] sol_storeAddr,
  output [7:0] sol_storeData
);
  wire  fork0_outs_0_valid;
  wire  fork0_outs_0_ready;
  wire  fork0_outs_1_valid;
  wire  fork0_outs_1_ready;
  wire  fork0_outs_2_valid;
  wire  fork0_outs_2_ready;
  wire  mem_controller3_memEnd_valid;
  wire  mem_controller3_memEnd_ready;
  wire  mem_controller3_loadEn;
  wire [9:0] mem_controller3_loadAddr;
  wire  mem_controller3_storeEn;
  wire [9:0] mem_controller3_storeAddr;
  wire [7:0] mem_controller3_storeData;
  wire [7:0] mem_controller4_ldData_0;
  wire  mem_controller4_ldData_0_valid;
  wire  mem_controller4_ldData_0_ready;
  wire  mem_controller4_memEnd_valid;
  wire  mem_controller4_memEnd_ready;
  wire  mem_controller4_loadEn;
  wire [3:0] mem_controller4_loadAddr;
  wire  mem_controller4_storeEn;
  wire [3:0] mem_controller4_storeAddr;
  wire [7:0] mem_controller4_storeData;
  wire [7:0] mem_controller5_ldData_0;
  wire  mem_controller5_ldData_0_valid;
  wire  mem_controller5_ldData_0_ready;
  wire  mem_controller5_memEnd_valid;
  wire  mem_controller5_memEnd_ready;
  wire  mem_controller5_loadEn;
  wire [9:0] mem_controller5_loadAddr;
  wire  mem_controller5_storeEn;
  wire [9:0] mem_controller5_storeAddr;
  wire [7:0] mem_controller5_storeData;
  wire [0:0] constant3_outs;
  wire  constant3_outs_valid;
  wire  constant3_outs_ready;
  wire [5:0] extsi17_outs;
  wire  extsi17_outs_valid;
  wire  extsi17_outs_ready;
  wire [5:0] mux0_outs;
  wire  mux0_outs_valid;
  wire  mux0_outs_ready;
  wire  control_merge0_outs_valid;
  wire  control_merge0_outs_ready;
  wire [0:0] control_merge0_index;
  wire  control_merge0_index_valid;
  wire  control_merge0_index_ready;
  wire  buffer2_outs_valid;
  wire  buffer2_outs_ready;
  wire  buffer3_outs_valid;
  wire  buffer3_outs_ready;
  wire  fork1_outs_0_valid;
  wire  fork1_outs_0_ready;
  wire  fork1_outs_1_valid;
  wire  fork1_outs_1_ready;
  wire [0:0] constant4_outs;
  wire  constant4_outs_valid;
  wire  constant4_outs_ready;
  wire [0:0] fork2_outs_0;
  wire  fork2_outs_0_valid;
  wire  fork2_outs_0_ready;
  wire [0:0] fork2_outs_1;
  wire  fork2_outs_1_valid;
  wire  fork2_outs_1_ready;
  wire [2:0] extsi15_outs;
  wire  extsi15_outs_valid;
  wire  extsi15_outs_ready;
  wire [7:0] extsi18_outs;
  wire  extsi18_outs_valid;
  wire  extsi18_outs_ready;
  wire [5:0] buffer0_outs;
  wire  buffer0_outs_valid;
  wire  buffer0_outs_ready;
  wire [5:0] buffer1_outs;
  wire  buffer1_outs_valid;
  wire  buffer1_outs_ready;
  wire [2:0] mux1_outs;
  wire  mux1_outs_valid;
  wire  mux1_outs_ready;
  wire [7:0] mux2_outs;
  wire  mux2_outs_valid;
  wire  mux2_outs_ready;
  wire [5:0] mux3_outs;
  wire  mux3_outs_valid;
  wire  mux3_outs_ready;
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
  wire  buffer10_outs_valid;
  wire  buffer10_outs_ready;
  wire  buffer11_outs_valid;
  wire  buffer11_outs_ready;
  wire  fork4_outs_0_valid;
  wire  fork4_outs_0_ready;
  wire  fork4_outs_1_valid;
  wire  fork4_outs_1_ready;
  wire [0:0] constant5_outs;
  wire  constant5_outs_valid;
  wire  constant5_outs_ready;
  wire [2:0] extsi14_outs;
  wire  extsi14_outs_valid;
  wire  extsi14_outs_ready;
  wire [7:0] buffer6_outs;
  wire  buffer6_outs_valid;
  wire  buffer6_outs_ready;
  wire [7:0] buffer7_outs;
  wire  buffer7_outs_valid;
  wire  buffer7_outs_ready;
  wire [5:0] buffer8_outs;
  wire  buffer8_outs_valid;
  wire  buffer8_outs_ready;
  wire [5:0] buffer9_outs;
  wire  buffer9_outs_valid;
  wire  buffer9_outs_ready;
  wire [2:0] buffer4_outs;
  wire  buffer4_outs_valid;
  wire  buffer4_outs_ready;
  wire [2:0] buffer5_outs;
  wire  buffer5_outs_valid;
  wire  buffer5_outs_ready;
  wire [2:0] mux4_outs;
  wire  mux4_outs_valid;
  wire  mux4_outs_ready;
  wire [2:0] buffer12_outs;
  wire  buffer12_outs_valid;
  wire  buffer12_outs_ready;
  wire [2:0] buffer13_outs;
  wire  buffer13_outs_valid;
  wire  buffer13_outs_ready;
  wire [2:0] fork5_outs_0;
  wire  fork5_outs_0_valid;
  wire  fork5_outs_0_ready;
  wire [2:0] fork5_outs_1;
  wire  fork5_outs_1_valid;
  wire  fork5_outs_1_ready;
  wire [2:0] fork5_outs_2;
  wire  fork5_outs_2_valid;
  wire  fork5_outs_2_ready;
  wire [3:0] extsi19_outs;
  wire  extsi19_outs_valid;
  wire  extsi19_outs_ready;
  wire [6:0] extsi20_outs;
  wire  extsi20_outs_valid;
  wire  extsi20_outs_ready;
  wire [3:0] extsi21_outs;
  wire  extsi21_outs_valid;
  wire  extsi21_outs_ready;
  wire [7:0] mux5_outs;
  wire  mux5_outs_valid;
  wire  mux5_outs_ready;
  wire [5:0] mux6_outs;
  wire  mux6_outs_valid;
  wire  mux6_outs_ready;
  wire [5:0] buffer16_outs;
  wire  buffer16_outs_valid;
  wire  buffer16_outs_ready;
  wire [5:0] buffer17_outs;
  wire  buffer17_outs_valid;
  wire  buffer17_outs_ready;
  wire [5:0] fork6_outs_0;
  wire  fork6_outs_0_valid;
  wire  fork6_outs_0_ready;
  wire [5:0] fork6_outs_1;
  wire  fork6_outs_1_valid;
  wire  fork6_outs_1_ready;
  wire [6:0] extsi22_outs;
  wire  extsi22_outs_valid;
  wire  extsi22_outs_ready;
  wire [2:0] mux7_outs;
  wire  mux7_outs_valid;
  wire  mux7_outs_ready;
  wire [2:0] buffer18_outs;
  wire  buffer18_outs_valid;
  wire  buffer18_outs_ready;
  wire [2:0] buffer19_outs;
  wire  buffer19_outs_valid;
  wire  buffer19_outs_ready;
  wire [2:0] fork7_outs_0;
  wire  fork7_outs_0_valid;
  wire  fork7_outs_0_ready;
  wire [2:0] fork7_outs_1;
  wire  fork7_outs_1_valid;
  wire  fork7_outs_1_ready;
  wire [2:0] fork7_outs_2;
  wire  fork7_outs_2_valid;
  wire  fork7_outs_2_ready;
  wire [2:0] fork7_outs_3;
  wire  fork7_outs_3_valid;
  wire  fork7_outs_3_ready;
  wire [3:0] extsi23_outs;
  wire  extsi23_outs_valid;
  wire  extsi23_outs_ready;
  wire [8:0] extsi24_outs;
  wire  extsi24_outs_valid;
  wire  extsi24_outs_ready;
  wire [31:0] extsi25_outs;
  wire  extsi25_outs_valid;
  wire  extsi25_outs_ready;
  wire  control_merge2_outs_valid;
  wire  control_merge2_outs_ready;
  wire [0:0] control_merge2_index;
  wire  control_merge2_index_valid;
  wire  control_merge2_index_ready;
  wire [0:0] fork8_outs_0;
  wire  fork8_outs_0_valid;
  wire  fork8_outs_0_ready;
  wire [0:0] fork8_outs_1;
  wire  fork8_outs_1_valid;
  wire  fork8_outs_1_ready;
  wire [0:0] fork8_outs_2;
  wire  fork8_outs_2_valid;
  wire  fork8_outs_2_ready;
  wire [0:0] fork8_outs_3;
  wire  fork8_outs_3_valid;
  wire  fork8_outs_3_ready;
  wire  source0_outs_valid;
  wire  source0_outs_ready;
  wire [5:0] constant16_outs;
  wire  constant16_outs_valid;
  wire  constant16_outs_ready;
  wire [8:0] extsi26_outs;
  wire  extsi26_outs_valid;
  wire  extsi26_outs_ready;
  wire  source1_outs_valid;
  wire  source1_outs_ready;
  wire [2:0] constant17_outs;
  wire  constant17_outs_valid;
  wire  constant17_outs_ready;
  wire [3:0] extsi27_outs;
  wire  extsi27_outs_valid;
  wire  extsi27_outs_ready;
  wire  source2_outs_valid;
  wire  source2_outs_ready;
  wire [1:0] constant18_outs;
  wire  constant18_outs_valid;
  wire  constant18_outs_ready;
  wire [1:0] fork9_outs_0;
  wire  fork9_outs_0_valid;
  wire  fork9_outs_0_ready;
  wire [1:0] fork9_outs_1;
  wire  fork9_outs_1_valid;
  wire  fork9_outs_1_ready;
  wire [3:0] extsi28_outs;
  wire  extsi28_outs_valid;
  wire  extsi28_outs_ready;
  wire [31:0] extsi8_outs;
  wire  extsi8_outs_valid;
  wire  extsi8_outs_ready;
  wire [31:0] shli0_result;
  wire  shli0_result_valid;
  wire  shli0_result_ready;
  wire [3:0] trunci1_outs;
  wire  trunci1_outs_valid;
  wire  trunci1_outs_ready;
  wire [3:0] addi7_result;
  wire  addi7_result_valid;
  wire  addi7_result_ready;
  wire [3:0] addi1_result;
  wire  addi1_result_valid;
  wire  addi1_result_ready;
  wire [3:0] load0_addrOut;
  wire  load0_addrOut_valid;
  wire  load0_addrOut_ready;
  wire [7:0] load0_dataOut;
  wire  load0_dataOut_valid;
  wire  load0_dataOut_ready;
  wire [15:0] extsi29_outs;
  wire  extsi29_outs_valid;
  wire  extsi29_outs_ready;
  wire [6:0] addi2_result;
  wire  addi2_result_valid;
  wire  addi2_result_ready;
  wire [9:0] extsi30_outs;
  wire  extsi30_outs_valid;
  wire  extsi30_outs_ready;
  wire [8:0] muli2_result;
  wire  muli2_result_valid;
  wire  muli2_result_ready;
  wire [9:0] extsi31_outs;
  wire  extsi31_outs_valid;
  wire  extsi31_outs_ready;
  wire [9:0] addi3_result;
  wire  addi3_result_valid;
  wire  addi3_result_ready;
  wire [9:0] load1_addrOut;
  wire  load1_addrOut_valid;
  wire  load1_addrOut_ready;
  wire [7:0] load1_dataOut;
  wire  load1_dataOut_valid;
  wire  load1_dataOut_ready;
  wire [15:0] extsi32_outs;
  wire  extsi32_outs_valid;
  wire  extsi32_outs_ready;
  wire [15:0] muli0_result;
  wire  muli0_result_valid;
  wire  muli0_result_ready;
  wire [7:0] trunci0_outs;
  wire  trunci0_outs_valid;
  wire  trunci0_outs_ready;
  wire [7:0] buffer14_outs;
  wire  buffer14_outs_valid;
  wire  buffer14_outs_ready;
  wire [7:0] buffer15_outs;
  wire  buffer15_outs_valid;
  wire  buffer15_outs_ready;
  wire [7:0] addi0_result;
  wire  addi0_result_valid;
  wire  addi0_result_ready;
  wire [3:0] addi4_result;
  wire  addi4_result_valid;
  wire  addi4_result_ready;
  wire [3:0] fork10_outs_0;
  wire  fork10_outs_0_valid;
  wire  fork10_outs_0_ready;
  wire [3:0] fork10_outs_1;
  wire  fork10_outs_1_valid;
  wire  fork10_outs_1_ready;
  wire [2:0] trunci2_outs;
  wire  trunci2_outs_valid;
  wire  trunci2_outs_ready;
  wire [0:0] cmpi0_result;
  wire  cmpi0_result_valid;
  wire  cmpi0_result_ready;
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
  wire [2:0] cond_br3_trueOut;
  wire  cond_br3_trueOut_valid;
  wire  cond_br3_trueOut_ready;
  wire [2:0] cond_br3_falseOut;
  wire  cond_br3_falseOut_valid;
  wire  cond_br3_falseOut_ready;
  wire [7:0] cond_br4_trueOut;
  wire  cond_br4_trueOut_valid;
  wire  cond_br4_trueOut_ready;
  wire [7:0] cond_br4_falseOut;
  wire  cond_br4_falseOut_valid;
  wire  cond_br4_falseOut_ready;
  wire [5:0] cond_br5_trueOut;
  wire  cond_br5_trueOut_valid;
  wire  cond_br5_trueOut_ready;
  wire [5:0] cond_br5_falseOut;
  wire  cond_br5_falseOut_valid;
  wire  cond_br5_falseOut_ready;
  wire [2:0] cond_br6_trueOut;
  wire  cond_br6_trueOut_valid;
  wire  cond_br6_trueOut_ready;
  wire [2:0] cond_br6_falseOut;
  wire  cond_br6_falseOut_valid;
  wire  cond_br6_falseOut_ready;
  wire  buffer20_outs_valid;
  wire  buffer20_outs_ready;
  wire  buffer21_outs_valid;
  wire  buffer21_outs_ready;
  wire  cond_br7_trueOut_valid;
  wire  cond_br7_trueOut_ready;
  wire  cond_br7_falseOut_valid;
  wire  cond_br7_falseOut_ready;
  wire [2:0] buffer24_outs;
  wire  buffer24_outs_valid;
  wire  buffer24_outs_ready;
  wire [2:0] buffer25_outs;
  wire  buffer25_outs_valid;
  wire  buffer25_outs_ready;
  wire [3:0] extsi33_outs;
  wire  extsi33_outs_valid;
  wire  extsi33_outs_ready;
  wire  source3_outs_valid;
  wire  source3_outs_ready;
  wire [2:0] constant19_outs;
  wire  constant19_outs_valid;
  wire  constant19_outs_ready;
  wire [3:0] extsi34_outs;
  wire  extsi34_outs_valid;
  wire  extsi34_outs_ready;
  wire  source4_outs_valid;
  wire  source4_outs_ready;
  wire [1:0] constant20_outs;
  wire  constant20_outs_valid;
  wire  constant20_outs_ready;
  wire [3:0] extsi35_outs;
  wire  extsi35_outs_valid;
  wire  extsi35_outs_ready;
  wire [3:0] addi5_result;
  wire  addi5_result_valid;
  wire  addi5_result_ready;
  wire [3:0] fork12_outs_0;
  wire  fork12_outs_0_valid;
  wire  fork12_outs_0_ready;
  wire [3:0] fork12_outs_1;
  wire  fork12_outs_1_valid;
  wire  fork12_outs_1_ready;
  wire [2:0] trunci3_outs;
  wire  trunci3_outs_valid;
  wire  trunci3_outs_ready;
  wire [0:0] cmpi1_result;
  wire  cmpi1_result_valid;
  wire  cmpi1_result_ready;
  wire [0:0] fork13_outs_0;
  wire  fork13_outs_0_valid;
  wire  fork13_outs_0_ready;
  wire [0:0] fork13_outs_1;
  wire  fork13_outs_1_valid;
  wire  fork13_outs_1_ready;
  wire [0:0] fork13_outs_2;
  wire  fork13_outs_2_valid;
  wire  fork13_outs_2_ready;
  wire [0:0] fork13_outs_3;
  wire  fork13_outs_3_valid;
  wire  fork13_outs_3_ready;
  wire [2:0] cond_br8_trueOut;
  wire  cond_br8_trueOut_valid;
  wire  cond_br8_trueOut_ready;
  wire [2:0] cond_br8_falseOut;
  wire  cond_br8_falseOut_valid;
  wire  cond_br8_falseOut_ready;
  wire [7:0] buffer26_outs;
  wire  buffer26_outs_valid;
  wire  buffer26_outs_ready;
  wire [7:0] buffer27_outs;
  wire  buffer27_outs_valid;
  wire  buffer27_outs_ready;
  wire [7:0] cond_br9_trueOut;
  wire  cond_br9_trueOut_valid;
  wire  cond_br9_trueOut_ready;
  wire [7:0] cond_br9_falseOut;
  wire  cond_br9_falseOut_valid;
  wire  cond_br9_falseOut_ready;
  wire [5:0] buffer22_outs;
  wire  buffer22_outs_valid;
  wire  buffer22_outs_ready;
  wire [5:0] buffer23_outs;
  wire  buffer23_outs_valid;
  wire  buffer23_outs_ready;
  wire [5:0] cond_br10_trueOut;
  wire  cond_br10_trueOut_valid;
  wire  cond_br10_trueOut_ready;
  wire [5:0] cond_br10_falseOut;
  wire  cond_br10_falseOut_valid;
  wire  cond_br10_falseOut_ready;
  wire  buffer28_outs_valid;
  wire  buffer28_outs_ready;
  wire  buffer29_outs_valid;
  wire  buffer29_outs_ready;
  wire  cond_br11_trueOut_valid;
  wire  cond_br11_trueOut_ready;
  wire  cond_br11_falseOut_valid;
  wire  cond_br11_falseOut_ready;
  wire [5:0] buffer30_outs;
  wire  buffer30_outs_valid;
  wire  buffer30_outs_ready;
  wire [5:0] buffer31_outs;
  wire  buffer31_outs_valid;
  wire  buffer31_outs_ready;
  wire [5:0] fork14_outs_0;
  wire  fork14_outs_0_valid;
  wire  fork14_outs_0_ready;
  wire [5:0] fork14_outs_1;
  wire  fork14_outs_1_valid;
  wire  fork14_outs_1_ready;
  wire [9:0] extsi16_outs;
  wire  extsi16_outs_valid;
  wire  extsi16_outs_ready;
  wire [6:0] extsi36_outs;
  wire  extsi36_outs_valid;
  wire  extsi36_outs_ready;
  wire [7:0] buffer32_outs;
  wire  buffer32_outs_valid;
  wire  buffer32_outs_ready;
  wire [7:0] buffer33_outs;
  wire  buffer33_outs_valid;
  wire  buffer33_outs_ready;
  wire [7:0] fork15_outs_0;
  wire  fork15_outs_0_valid;
  wire  fork15_outs_0_ready;
  wire [7:0] fork15_outs_1;
  wire  fork15_outs_1_valid;
  wire  fork15_outs_1_ready;
  wire  buffer34_outs_valid;
  wire  buffer34_outs_ready;
  wire  buffer35_outs_valid;
  wire  buffer35_outs_ready;
  wire  fork16_outs_0_valid;
  wire  fork16_outs_0_ready;
  wire  fork16_outs_1_valid;
  wire  fork16_outs_1_ready;
  wire [1:0] constant21_outs;
  wire  constant21_outs_valid;
  wire  constant21_outs_ready;
  wire [31:0] extsi11_outs;
  wire  extsi11_outs_valid;
  wire  extsi11_outs_ready;
  wire  source5_outs_valid;
  wire  source5_outs_ready;
  wire [5:0] constant22_outs;
  wire  constant22_outs_valid;
  wire  constant22_outs_ready;
  wire [6:0] extsi37_outs;
  wire  extsi37_outs_valid;
  wire  extsi37_outs_ready;
  wire  source6_outs_valid;
  wire  source6_outs_ready;
  wire [1:0] constant23_outs;
  wire  constant23_outs_valid;
  wire  constant23_outs_ready;
  wire [6:0] extsi38_outs;
  wire  extsi38_outs_valid;
  wire  extsi38_outs_ready;
  wire [9:0] store0_addrOut;
  wire  store0_addrOut_valid;
  wire  store0_addrOut_ready;
  wire [7:0] store0_dataToMem;
  wire  store0_dataToMem_valid;
  wire  store0_dataToMem_ready;
  wire [6:0] addi6_result;
  wire  addi6_result_valid;
  wire  addi6_result_ready;
  wire [6:0] fork17_outs_0;
  wire  fork17_outs_0_valid;
  wire  fork17_outs_0_ready;
  wire [6:0] fork17_outs_1;
  wire  fork17_outs_1_valid;
  wire  fork17_outs_1_ready;
  wire [5:0] trunci4_outs;
  wire  trunci4_outs_valid;
  wire  trunci4_outs_ready;
  wire [0:0] cmpi2_result;
  wire  cmpi2_result_valid;
  wire  cmpi2_result_ready;
  wire [0:0] fork18_outs_0;
  wire  fork18_outs_0_valid;
  wire  fork18_outs_0_ready;
  wire [0:0] fork18_outs_1;
  wire  fork18_outs_1_valid;
  wire  fork18_outs_1_ready;
  wire [0:0] fork18_outs_2;
  wire  fork18_outs_2_valid;
  wire  fork18_outs_2_ready;
  wire [5:0] cond_br12_trueOut;
  wire  cond_br12_trueOut_valid;
  wire  cond_br12_trueOut_ready;
  wire [5:0] cond_br12_falseOut;
  wire  cond_br12_falseOut_valid;
  wire  cond_br12_falseOut_ready;
  wire  cond_br13_trueOut_valid;
  wire  cond_br13_trueOut_ready;
  wire  cond_br13_falseOut_valid;
  wire  cond_br13_falseOut_ready;
  wire [7:0] cond_br14_trueOut;
  wire  cond_br14_trueOut_valid;
  wire  cond_br14_trueOut_ready;
  wire [7:0] cond_br14_falseOut;
  wire  cond_br14_falseOut_valid;
  wire  cond_br14_falseOut_ready;
  wire  buffer38_outs_valid;
  wire  buffer38_outs_ready;
  wire  buffer39_outs_valid;
  wire  buffer39_outs_ready;
  wire  fork19_outs_0_valid;
  wire  fork19_outs_0_ready;
  wire  fork19_outs_1_valid;
  wire  fork19_outs_1_ready;
  wire  fork19_outs_2_valid;
  wire  fork19_outs_2_ready;
  wire [7:0] buffer36_outs;
  wire  buffer36_outs_valid;
  wire  buffer36_outs_ready;
  wire [7:0] buffer37_outs;
  wire  buffer37_outs_valid;
  wire  buffer37_outs_ready;

  assign out0 = buffer37_outs;
  assign out0_valid = buffer37_outs_valid;
  assign buffer37_outs_ready = out0_ready;
  assign orig_end_valid = mem_controller5_memEnd_valid;
  assign mem_controller5_memEnd_ready = orig_end_ready;
  assign filter_end_valid = mem_controller4_memEnd_valid;
  assign mem_controller4_memEnd_ready = filter_end_ready;
  assign sol_end_valid = mem_controller3_memEnd_valid;
  assign mem_controller3_memEnd_ready = sol_end_ready;
  assign end_valid = fork0_outs_1_valid;
  assign fork0_outs_1_ready = end_ready;
  assign orig_loadEn = mem_controller5_loadEn;
  assign orig_loadAddr = mem_controller5_loadAddr;
  assign orig_storeEn = mem_controller5_storeEn;
  assign orig_storeAddr = mem_controller5_storeAddr;
  assign orig_storeData = mem_controller5_storeData;
  assign filter_loadEn = mem_controller4_loadEn;
  assign filter_loadAddr = mem_controller4_loadAddr;
  assign filter_storeEn = mem_controller4_storeEn;
  assign filter_storeAddr = mem_controller4_storeAddr;
  assign filter_storeData = mem_controller4_storeData;
  assign sol_loadEn = mem_controller3_loadEn;
  assign sol_loadAddr = mem_controller3_loadAddr;
  assign sol_storeEn = mem_controller3_storeEn;
  assign sol_storeAddr = mem_controller3_storeAddr;
  assign sol_storeData = mem_controller3_storeData;

  fork_dataless #(.SIZE(3)) fork0(
    .ins_valid (start_valid),
    .ins_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready})
  );

  mem_controller_loadless #(.NUM_CONTROLS(1), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(10)) mem_controller3(
    .loadData (sol_loadData),
    .memStart_valid (sol_start_valid),
    .memStart_ready (sol_start_ready),
    .ctrl ({extsi11_outs}),
    .ctrl_valid ({extsi11_outs_valid}),
    .ctrl_ready ({extsi11_outs_ready}),
    .stAddr ({store0_addrOut}),
    .stAddr_valid ({store0_addrOut_valid}),
    .stAddr_ready ({store0_addrOut_ready}),
    .stData ({store0_dataToMem}),
    .stData_valid ({store0_dataToMem_valid}),
    .stData_ready ({store0_dataToMem_ready}),
    .ctrlEnd_valid (fork19_outs_2_valid),
    .ctrlEnd_ready (fork19_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .memEnd_valid (mem_controller3_memEnd_valid),
    .memEnd_ready (mem_controller3_memEnd_ready),
    .loadEn (mem_controller3_loadEn),
    .loadAddr (mem_controller3_loadAddr),
    .storeEn (mem_controller3_storeEn),
    .storeAddr (mem_controller3_storeAddr),
    .storeData (mem_controller3_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller4(
    .loadData (filter_loadData),
    .memStart_valid (filter_start_valid),
    .memStart_ready (filter_start_ready),
    .ldAddr ({load0_addrOut}),
    .ldAddr_valid ({load0_addrOut_valid}),
    .ldAddr_ready ({load0_addrOut_ready}),
    .ctrlEnd_valid (fork19_outs_1_valid),
    .ctrlEnd_ready (fork19_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller4_ldData_0}),
    .ldData_valid ({mem_controller4_ldData_0_valid}),
    .ldData_ready ({mem_controller4_ldData_0_ready}),
    .memEnd_valid (mem_controller4_memEnd_valid),
    .memEnd_ready (mem_controller4_memEnd_ready),
    .loadEn (mem_controller4_loadEn),
    .loadAddr (mem_controller4_loadAddr),
    .storeEn (mem_controller4_storeEn),
    .storeAddr (mem_controller4_storeAddr),
    .storeData (mem_controller4_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(10)) mem_controller5(
    .loadData (orig_loadData),
    .memStart_valid (orig_start_valid),
    .memStart_ready (orig_start_ready),
    .ldAddr ({load1_addrOut}),
    .ldAddr_valid ({load1_addrOut_valid}),
    .ldAddr_ready ({load1_addrOut_ready}),
    .ctrlEnd_valid (fork19_outs_0_valid),
    .ctrlEnd_ready (fork19_outs_0_ready),
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

  handshake_constant_0 #(.DATA_WIDTH(1)) constant3(
    .ctrl_valid (fork0_outs_0_valid),
    .ctrl_ready (fork0_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant3_outs),
    .outs_valid (constant3_outs_valid),
    .outs_ready (constant3_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(6)) extsi17(
    .ins (constant3_outs),
    .ins_valid (constant3_outs_valid),
    .ins_ready (constant3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi17_outs),
    .outs_valid (extsi17_outs_valid),
    .outs_ready (extsi17_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(6), .SELECT_TYPE(1)) mux0(
    .index (control_merge0_index),
    .index_valid (control_merge0_index_valid),
    .index_ready (control_merge0_index_ready),
    .ins ({cond_br12_trueOut, extsi17_outs}),
    .ins_valid ({cond_br12_trueOut_valid, extsi17_outs_valid}),
    .ins_ready ({cond_br12_trueOut_ready, extsi17_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux0_outs),
    .outs_valid (mux0_outs_valid),
    .outs_ready (mux0_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .ins_valid ({cond_br13_trueOut_valid, fork0_outs_2_valid}),
    .ins_ready ({cond_br13_trueOut_ready, fork0_outs_2_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge0_outs_valid),
    .outs_ready (control_merge0_outs_ready),
    .index (control_merge0_index),
    .index_valid (control_merge0_index_valid),
    .index_ready (control_merge0_index_ready)
  );

  oehb_dataless buffer2(
    .ins_valid (control_merge0_outs_valid),
    .ins_ready (control_merge0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer2_outs_valid),
    .outs_ready (buffer2_outs_ready)
  );

  tehb_dataless buffer3(
    .ins_valid (buffer2_outs_valid),
    .ins_ready (buffer2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer3_outs_valid),
    .outs_ready (buffer3_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork1(
    .ins_valid (buffer3_outs_valid),
    .ins_ready (buffer3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork1_outs_1_valid, fork1_outs_0_valid}),
    .outs_ready ({fork1_outs_1_ready, fork1_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant4(
    .ctrl_valid (fork1_outs_0_valid),
    .ctrl_ready (fork1_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant4_outs),
    .outs_valid (constant4_outs_valid),
    .outs_ready (constant4_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork2(
    .ins (constant4_outs),
    .ins_valid (constant4_outs_valid),
    .ins_ready (constant4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork2_outs_1, fork2_outs_0}),
    .outs_valid ({fork2_outs_1_valid, fork2_outs_0_valid}),
    .outs_ready ({fork2_outs_1_ready, fork2_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(3)) extsi15(
    .ins (fork2_outs_0),
    .ins_valid (fork2_outs_0_valid),
    .ins_ready (fork2_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi15_outs),
    .outs_valid (extsi15_outs_valid),
    .outs_ready (extsi15_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(8)) extsi18(
    .ins (fork2_outs_1),
    .ins_valid (fork2_outs_1_valid),
    .ins_ready (fork2_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi18_outs),
    .outs_valid (extsi18_outs_valid),
    .outs_ready (extsi18_outs_ready)
  );

  oehb #(.DATA_TYPE(6)) buffer0(
    .ins (mux0_outs),
    .ins_valid (mux0_outs_valid),
    .ins_ready (mux0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer0_outs),
    .outs_valid (buffer0_outs_valid),
    .outs_ready (buffer0_outs_ready)
  );

  tehb #(.DATA_TYPE(6)) buffer1(
    .ins (buffer0_outs),
    .ins_valid (buffer0_outs_valid),
    .ins_ready (buffer0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer1_outs),
    .outs_valid (buffer1_outs_valid),
    .outs_ready (buffer1_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(3), .SELECT_TYPE(1)) mux1(
    .index (fork3_outs_1),
    .index_valid (fork3_outs_1_valid),
    .index_ready (fork3_outs_1_ready),
    .ins ({cond_br8_trueOut, extsi15_outs}),
    .ins_valid ({cond_br8_trueOut_valid, extsi15_outs_valid}),
    .ins_ready ({cond_br8_trueOut_ready, extsi15_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux1_outs),
    .outs_valid (mux1_outs_valid),
    .outs_ready (mux1_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux2(
    .index (fork3_outs_2),
    .index_valid (fork3_outs_2_valid),
    .index_ready (fork3_outs_2_ready),
    .ins ({cond_br9_trueOut, extsi18_outs}),
    .ins_valid ({cond_br9_trueOut_valid, extsi18_outs_valid}),
    .ins_ready ({cond_br9_trueOut_ready, extsi18_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux2_outs),
    .outs_valid (mux2_outs_valid),
    .outs_ready (mux2_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(6), .SELECT_TYPE(1)) mux3(
    .index (fork3_outs_0),
    .index_valid (fork3_outs_0_valid),
    .index_ready (fork3_outs_0_ready),
    .ins ({cond_br10_trueOut, buffer1_outs}),
    .ins_valid ({cond_br10_trueOut_valid, buffer1_outs_valid}),
    .ins_ready ({cond_br10_trueOut_ready, buffer1_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux3_outs),
    .outs_valid (mux3_outs_valid),
    .outs_ready (mux3_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge1(
    .ins_valid ({cond_br11_trueOut_valid, fork1_outs_1_valid}),
    .ins_ready ({cond_br11_trueOut_ready, fork1_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge1_outs_valid),
    .outs_ready (control_merge1_outs_ready),
    .index (control_merge1_index),
    .index_valid (control_merge1_index_valid),
    .index_ready (control_merge1_index_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork3(
    .ins (control_merge1_index),
    .ins_valid (control_merge1_index_valid),
    .ins_ready (control_merge1_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork3_outs_2, fork3_outs_1, fork3_outs_0}),
    .outs_valid ({fork3_outs_2_valid, fork3_outs_1_valid, fork3_outs_0_valid}),
    .outs_ready ({fork3_outs_2_ready, fork3_outs_1_ready, fork3_outs_0_ready})
  );

  oehb_dataless buffer10(
    .ins_valid (control_merge1_outs_valid),
    .ins_ready (control_merge1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer10_outs_valid),
    .outs_ready (buffer10_outs_ready)
  );

  tehb_dataless buffer11(
    .ins_valid (buffer10_outs_valid),
    .ins_ready (buffer10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer11_outs_valid),
    .outs_ready (buffer11_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork4(
    .ins_valid (buffer11_outs_valid),
    .ins_ready (buffer11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork4_outs_1_valid, fork4_outs_0_valid}),
    .outs_ready ({fork4_outs_1_ready, fork4_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant5(
    .ctrl_valid (fork4_outs_0_valid),
    .ctrl_ready (fork4_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant5_outs),
    .outs_valid (constant5_outs_valid),
    .outs_ready (constant5_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(3)) extsi14(
    .ins (constant5_outs),
    .ins_valid (constant5_outs_valid),
    .ins_ready (constant5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi14_outs),
    .outs_valid (extsi14_outs_valid),
    .outs_ready (extsi14_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer6(
    .ins (mux2_outs),
    .ins_valid (mux2_outs_valid),
    .ins_ready (mux2_outs_ready),
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

  oehb #(.DATA_TYPE(6)) buffer8(
    .ins (mux3_outs),
    .ins_valid (mux3_outs_valid),
    .ins_ready (mux3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer8_outs),
    .outs_valid (buffer8_outs_valid),
    .outs_ready (buffer8_outs_ready)
  );

  tehb #(.DATA_TYPE(6)) buffer9(
    .ins (buffer8_outs),
    .ins_valid (buffer8_outs_valid),
    .ins_ready (buffer8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer9_outs),
    .outs_valid (buffer9_outs_valid),
    .outs_ready (buffer9_outs_ready)
  );

  oehb #(.DATA_TYPE(3)) buffer4(
    .ins (mux1_outs),
    .ins_valid (mux1_outs_valid),
    .ins_ready (mux1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer4_outs),
    .outs_valid (buffer4_outs_valid),
    .outs_ready (buffer4_outs_ready)
  );

  tehb #(.DATA_TYPE(3)) buffer5(
    .ins (buffer4_outs),
    .ins_valid (buffer4_outs_valid),
    .ins_ready (buffer4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer5_outs),
    .outs_valid (buffer5_outs_valid),
    .outs_ready (buffer5_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(3), .SELECT_TYPE(1)) mux4(
    .index (fork8_outs_2),
    .index_valid (fork8_outs_2_valid),
    .index_ready (fork8_outs_2_ready),
    .ins ({cond_br3_trueOut, extsi14_outs}),
    .ins_valid ({cond_br3_trueOut_valid, extsi14_outs_valid}),
    .ins_ready ({cond_br3_trueOut_ready, extsi14_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux4_outs),
    .outs_valid (mux4_outs_valid),
    .outs_ready (mux4_outs_ready)
  );

  oehb #(.DATA_TYPE(3)) buffer12(
    .ins (mux4_outs),
    .ins_valid (mux4_outs_valid),
    .ins_ready (mux4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer12_outs),
    .outs_valid (buffer12_outs_valid),
    .outs_ready (buffer12_outs_ready)
  );

  tehb #(.DATA_TYPE(3)) buffer13(
    .ins (buffer12_outs),
    .ins_valid (buffer12_outs_valid),
    .ins_ready (buffer12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer13_outs),
    .outs_valid (buffer13_outs_valid),
    .outs_ready (buffer13_outs_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(3)) fork5(
    .ins (buffer13_outs),
    .ins_valid (buffer13_outs_valid),
    .ins_ready (buffer13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork5_outs_2, fork5_outs_1, fork5_outs_0}),
    .outs_valid ({fork5_outs_2_valid, fork5_outs_1_valid, fork5_outs_0_valid}),
    .outs_ready ({fork5_outs_2_ready, fork5_outs_1_ready, fork5_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(4)) extsi19(
    .ins (fork5_outs_0),
    .ins_valid (fork5_outs_0_valid),
    .ins_ready (fork5_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi19_outs),
    .outs_valid (extsi19_outs_valid),
    .outs_ready (extsi19_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(7)) extsi20(
    .ins (fork5_outs_1),
    .ins_valid (fork5_outs_1_valid),
    .ins_ready (fork5_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi20_outs),
    .outs_valid (extsi20_outs_valid),
    .outs_ready (extsi20_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(4)) extsi21(
    .ins (fork5_outs_2),
    .ins_valid (fork5_outs_2_valid),
    .ins_ready (fork5_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi21_outs),
    .outs_valid (extsi21_outs_valid),
    .outs_ready (extsi21_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux5(
    .index (fork8_outs_3),
    .index_valid (fork8_outs_3_valid),
    .index_ready (fork8_outs_3_ready),
    .ins ({cond_br4_trueOut, buffer7_outs}),
    .ins_valid ({cond_br4_trueOut_valid, buffer7_outs_valid}),
    .ins_ready ({cond_br4_trueOut_ready, buffer7_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux5_outs),
    .outs_valid (mux5_outs_valid),
    .outs_ready (mux5_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(6), .SELECT_TYPE(1)) mux6(
    .index (fork8_outs_0),
    .index_valid (fork8_outs_0_valid),
    .index_ready (fork8_outs_0_ready),
    .ins ({cond_br5_trueOut, buffer9_outs}),
    .ins_valid ({cond_br5_trueOut_valid, buffer9_outs_valid}),
    .ins_ready ({cond_br5_trueOut_ready, buffer9_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux6_outs),
    .outs_valid (mux6_outs_valid),
    .outs_ready (mux6_outs_ready)
  );

  oehb #(.DATA_TYPE(6)) buffer16(
    .ins (mux6_outs),
    .ins_valid (mux6_outs_valid),
    .ins_ready (mux6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer16_outs),
    .outs_valid (buffer16_outs_valid),
    .outs_ready (buffer16_outs_ready)
  );

  tehb #(.DATA_TYPE(6)) buffer17(
    .ins (buffer16_outs),
    .ins_valid (buffer16_outs_valid),
    .ins_ready (buffer16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer17_outs),
    .outs_valid (buffer17_outs_valid),
    .outs_ready (buffer17_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork6(
    .ins (buffer17_outs),
    .ins_valid (buffer17_outs_valid),
    .ins_ready (buffer17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork6_outs_1, fork6_outs_0}),
    .outs_valid ({fork6_outs_1_valid, fork6_outs_0_valid}),
    .outs_ready ({fork6_outs_1_ready, fork6_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(6), .OUTPUT_TYPE(7)) extsi22(
    .ins (fork6_outs_1),
    .ins_valid (fork6_outs_1_valid),
    .ins_ready (fork6_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi22_outs),
    .outs_valid (extsi22_outs_valid),
    .outs_ready (extsi22_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(3), .SELECT_TYPE(1)) mux7(
    .index (fork8_outs_1),
    .index_valid (fork8_outs_1_valid),
    .index_ready (fork8_outs_1_ready),
    .ins ({cond_br6_trueOut, buffer5_outs}),
    .ins_valid ({cond_br6_trueOut_valid, buffer5_outs_valid}),
    .ins_ready ({cond_br6_trueOut_ready, buffer5_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux7_outs),
    .outs_valid (mux7_outs_valid),
    .outs_ready (mux7_outs_ready)
  );

  oehb #(.DATA_TYPE(3)) buffer18(
    .ins (mux7_outs),
    .ins_valid (mux7_outs_valid),
    .ins_ready (mux7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer18_outs),
    .outs_valid (buffer18_outs_valid),
    .outs_ready (buffer18_outs_ready)
  );

  tehb #(.DATA_TYPE(3)) buffer19(
    .ins (buffer18_outs),
    .ins_valid (buffer18_outs_valid),
    .ins_ready (buffer18_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer19_outs),
    .outs_valid (buffer19_outs_valid),
    .outs_ready (buffer19_outs_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(3)) fork7(
    .ins (buffer19_outs),
    .ins_valid (buffer19_outs_valid),
    .ins_ready (buffer19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork7_outs_3, fork7_outs_2, fork7_outs_1, fork7_outs_0}),
    .outs_valid ({fork7_outs_3_valid, fork7_outs_2_valid, fork7_outs_1_valid, fork7_outs_0_valid}),
    .outs_ready ({fork7_outs_3_ready, fork7_outs_2_ready, fork7_outs_1_ready, fork7_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(4)) extsi23(
    .ins (fork7_outs_0),
    .ins_valid (fork7_outs_0_valid),
    .ins_ready (fork7_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi23_outs),
    .outs_valid (extsi23_outs_valid),
    .outs_ready (extsi23_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(9)) extsi24(
    .ins (fork7_outs_2),
    .ins_valid (fork7_outs_2_valid),
    .ins_ready (fork7_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi24_outs),
    .outs_valid (extsi24_outs_valid),
    .outs_ready (extsi24_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi25(
    .ins (fork7_outs_3),
    .ins_valid (fork7_outs_3_valid),
    .ins_ready (fork7_outs_3_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi25_outs),
    .outs_valid (extsi25_outs_valid),
    .outs_ready (extsi25_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge2(
    .ins_valid ({cond_br7_trueOut_valid, fork4_outs_1_valid}),
    .ins_ready ({cond_br7_trueOut_ready, fork4_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge2_outs_valid),
    .outs_ready (control_merge2_outs_ready),
    .index (control_merge2_index),
    .index_valid (control_merge2_index_valid),
    .index_ready (control_merge2_index_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork8(
    .ins (control_merge2_index),
    .ins_valid (control_merge2_index_valid),
    .ins_ready (control_merge2_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork8_outs_3, fork8_outs_2, fork8_outs_1, fork8_outs_0}),
    .outs_valid ({fork8_outs_3_valid, fork8_outs_2_valid, fork8_outs_1_valid, fork8_outs_0_valid}),
    .outs_ready ({fork8_outs_3_ready, fork8_outs_2_ready, fork8_outs_1_ready, fork8_outs_0_ready})
  );

  source source0(
    .clk (clk),
    .rst (rst),
    .outs_valid (source0_outs_valid),
    .outs_ready (source0_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(6)) constant16(
    .ctrl_valid (source0_outs_valid),
    .ctrl_ready (source0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant16_outs),
    .outs_valid (constant16_outs_valid),
    .outs_ready (constant16_outs_ready)
  );

  extsi #(.INPUT_TYPE(6), .OUTPUT_TYPE(9)) extsi26(
    .ins (constant16_outs),
    .ins_valid (constant16_outs_valid),
    .ins_ready (constant16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi26_outs),
    .outs_valid (extsi26_outs_valid),
    .outs_ready (extsi26_outs_ready)
  );

  source source1(
    .clk (clk),
    .rst (rst),
    .outs_valid (source1_outs_valid),
    .outs_ready (source1_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(3)) constant17(
    .ctrl_valid (source1_outs_valid),
    .ctrl_ready (source1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant17_outs),
    .outs_valid (constant17_outs_valid),
    .outs_ready (constant17_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(4)) extsi27(
    .ins (constant17_outs),
    .ins_valid (constant17_outs_valid),
    .ins_ready (constant17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi27_outs),
    .outs_valid (extsi27_outs_valid),
    .outs_ready (extsi27_outs_ready)
  );

  source source2(
    .clk (clk),
    .rst (rst),
    .outs_valid (source2_outs_valid),
    .outs_ready (source2_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(2)) constant18(
    .ctrl_valid (source2_outs_valid),
    .ctrl_ready (source2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant18_outs),
    .outs_valid (constant18_outs_valid),
    .outs_ready (constant18_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork9(
    .ins (constant18_outs),
    .ins_valid (constant18_outs_valid),
    .ins_ready (constant18_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork9_outs_1, fork9_outs_0}),
    .outs_valid ({fork9_outs_1_valid, fork9_outs_0_valid}),
    .outs_ready ({fork9_outs_1_ready, fork9_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(4)) extsi28(
    .ins (fork9_outs_0),
    .ins_valid (fork9_outs_0_valid),
    .ins_ready (fork9_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi28_outs),
    .outs_valid (extsi28_outs_valid),
    .outs_ready (extsi28_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi8(
    .ins (fork9_outs_1),
    .ins_valid (fork9_outs_1_valid),
    .ins_ready (fork9_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi8_outs),
    .outs_valid (extsi8_outs_valid),
    .outs_ready (extsi8_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli0(
    .lhs (extsi25_outs),
    .lhs_valid (extsi25_outs_valid),
    .lhs_ready (extsi25_outs_ready),
    .rhs (extsi8_outs),
    .rhs_valid (extsi8_outs_valid),
    .rhs_ready (extsi8_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli0_result),
    .result_valid (shli0_result_valid),
    .result_ready (shli0_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(4)) trunci1(
    .ins (shli0_result),
    .ins_valid (shli0_result_valid),
    .ins_ready (shli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci1_outs),
    .outs_valid (trunci1_outs_valid),
    .outs_ready (trunci1_outs_ready)
  );

  addi #(.DATA_TYPE(4)) addi7(
    .lhs (extsi23_outs),
    .lhs_valid (extsi23_outs_valid),
    .lhs_ready (extsi23_outs_ready),
    .rhs (trunci1_outs),
    .rhs_valid (trunci1_outs_valid),
    .rhs_ready (trunci1_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi7_result),
    .result_valid (addi7_result_valid),
    .result_ready (addi7_result_ready)
  );

  addi #(.DATA_TYPE(4)) addi1(
    .lhs (extsi19_outs),
    .lhs_valid (extsi19_outs_valid),
    .lhs_ready (extsi19_outs_ready),
    .rhs (addi7_result),
    .rhs_valid (addi7_result_valid),
    .rhs_ready (addi7_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi1_result),
    .result_valid (addi1_result_valid),
    .result_ready (addi1_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load0(
    .addrIn (addi1_result),
    .addrIn_valid (addi1_result_valid),
    .addrIn_ready (addi1_result_ready),
    .dataFromMem (mem_controller4_ldData_0),
    .dataFromMem_valid (mem_controller4_ldData_0_valid),
    .dataFromMem_ready (mem_controller4_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load0_addrOut),
    .addrOut_valid (load0_addrOut_valid),
    .addrOut_ready (load0_addrOut_ready),
    .dataOut (load0_dataOut),
    .dataOut_valid (load0_dataOut_valid),
    .dataOut_ready (load0_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi29(
    .ins (load0_dataOut),
    .ins_valid (load0_dataOut_valid),
    .ins_ready (load0_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi29_outs),
    .outs_valid (extsi29_outs_valid),
    .outs_ready (extsi29_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi2(
    .lhs (extsi20_outs),
    .lhs_valid (extsi20_outs_valid),
    .lhs_ready (extsi20_outs_ready),
    .rhs (extsi22_outs),
    .rhs_valid (extsi22_outs_valid),
    .rhs_ready (extsi22_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi2_result),
    .result_valid (addi2_result_valid),
    .result_ready (addi2_result_ready)
  );

  extsi #(.INPUT_TYPE(7), .OUTPUT_TYPE(10)) extsi30(
    .ins (addi2_result),
    .ins_valid (addi2_result_valid),
    .ins_ready (addi2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi30_outs),
    .outs_valid (extsi30_outs_valid),
    .outs_ready (extsi30_outs_ready)
  );

  muli #(.DATA_TYPE(9)) muli2(
    .lhs (extsi24_outs),
    .lhs_valid (extsi24_outs_valid),
    .lhs_ready (extsi24_outs_ready),
    .rhs (extsi26_outs),
    .rhs_valid (extsi26_outs_valid),
    .rhs_ready (extsi26_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli2_result),
    .result_valid (muli2_result_valid),
    .result_ready (muli2_result_ready)
  );

  extsi #(.INPUT_TYPE(9), .OUTPUT_TYPE(10)) extsi31(
    .ins (muli2_result),
    .ins_valid (muli2_result_valid),
    .ins_ready (muli2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi31_outs),
    .outs_valid (extsi31_outs_valid),
    .outs_ready (extsi31_outs_ready)
  );

  addi #(.DATA_TYPE(10)) addi3(
    .lhs (extsi30_outs),
    .lhs_valid (extsi30_outs_valid),
    .lhs_ready (extsi30_outs_ready),
    .rhs (extsi31_outs),
    .rhs_valid (extsi31_outs_valid),
    .rhs_ready (extsi31_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi3_result),
    .result_valid (addi3_result_valid),
    .result_ready (addi3_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(10)) load1(
    .addrIn (addi3_result),
    .addrIn_valid (addi3_result_valid),
    .addrIn_ready (addi3_result_ready),
    .dataFromMem (mem_controller5_ldData_0),
    .dataFromMem_valid (mem_controller5_ldData_0_valid),
    .dataFromMem_ready (mem_controller5_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load1_addrOut),
    .addrOut_valid (load1_addrOut_valid),
    .addrOut_ready (load1_addrOut_ready),
    .dataOut (load1_dataOut),
    .dataOut_valid (load1_dataOut_valid),
    .dataOut_ready (load1_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi32(
    .ins (load1_dataOut),
    .ins_valid (load1_dataOut_valid),
    .ins_ready (load1_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi32_outs),
    .outs_valid (extsi32_outs_valid),
    .outs_ready (extsi32_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli0(
    .lhs (extsi29_outs),
    .lhs_valid (extsi29_outs_valid),
    .lhs_ready (extsi29_outs_ready),
    .rhs (extsi32_outs),
    .rhs_valid (extsi32_outs_valid),
    .rhs_ready (extsi32_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli0_result),
    .result_valid (muli0_result_valid),
    .result_ready (muli0_result_ready)
  );

  trunci #(.INPUT_TYPE(16), .OUTPUT_TYPE(8)) trunci0(
    .ins (muli0_result),
    .ins_valid (muli0_result_valid),
    .ins_ready (muli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci0_outs),
    .outs_valid (trunci0_outs_valid),
    .outs_ready (trunci0_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer14(
    .ins (mux5_outs),
    .ins_valid (mux5_outs_valid),
    .ins_ready (mux5_outs_ready),
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

  addi #(.DATA_TYPE(8)) addi0(
    .lhs (buffer15_outs),
    .lhs_valid (buffer15_outs_valid),
    .lhs_ready (buffer15_outs_ready),
    .rhs (trunci0_outs),
    .rhs_valid (trunci0_outs_valid),
    .rhs_ready (trunci0_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi0_result),
    .result_valid (addi0_result_valid),
    .result_ready (addi0_result_ready)
  );

  addi #(.DATA_TYPE(4)) addi4(
    .lhs (extsi21_outs),
    .lhs_valid (extsi21_outs_valid),
    .lhs_ready (extsi21_outs_ready),
    .rhs (extsi28_outs),
    .rhs_valid (extsi28_outs_valid),
    .rhs_ready (extsi28_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi4_result),
    .result_valid (addi4_result_valid),
    .result_ready (addi4_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(4)) fork10(
    .ins (addi4_result),
    .ins_valid (addi4_result_valid),
    .ins_ready (addi4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork10_outs_1, fork10_outs_0}),
    .outs_valid ({fork10_outs_1_valid, fork10_outs_0_valid}),
    .outs_ready ({fork10_outs_1_ready, fork10_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(4), .OUTPUT_TYPE(3)) trunci2(
    .ins (fork10_outs_0),
    .ins_valid (fork10_outs_0_valid),
    .ins_ready (fork10_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci2_outs),
    .outs_valid (trunci2_outs_valid),
    .outs_ready (trunci2_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(4)) cmpi0(
    .lhs (fork10_outs_1),
    .lhs_valid (fork10_outs_1_valid),
    .lhs_ready (fork10_outs_1_ready),
    .rhs (extsi27_outs),
    .rhs_valid (extsi27_outs_valid),
    .rhs_ready (extsi27_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi0_result),
    .result_valid (cmpi0_result_valid),
    .result_ready (cmpi0_result_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork11(
    .ins (cmpi0_result),
    .ins_valid (cmpi0_result_valid),
    .ins_ready (cmpi0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork11_outs_4, fork11_outs_3, fork11_outs_2, fork11_outs_1, fork11_outs_0}),
    .outs_valid ({fork11_outs_4_valid, fork11_outs_3_valid, fork11_outs_2_valid, fork11_outs_1_valid, fork11_outs_0_valid}),
    .outs_ready ({fork11_outs_4_ready, fork11_outs_3_ready, fork11_outs_2_ready, fork11_outs_1_ready, fork11_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(3)) cond_br3(
    .condition (fork11_outs_0),
    .condition_valid (fork11_outs_0_valid),
    .condition_ready (fork11_outs_0_ready),
    .data (trunci2_outs),
    .data_valid (trunci2_outs_valid),
    .data_ready (trunci2_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br3_trueOut),
    .trueOut_valid (cond_br3_trueOut_valid),
    .trueOut_ready (cond_br3_trueOut_ready),
    .falseOut (cond_br3_falseOut),
    .falseOut_valid (cond_br3_falseOut_valid),
    .falseOut_ready (cond_br3_falseOut_ready)
  );

  sink #(.DATA_TYPE(3)) sink0(
    .ins (cond_br3_falseOut),
    .ins_valid (cond_br3_falseOut_valid),
    .ins_ready (cond_br3_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(8)) cond_br4(
    .condition (fork11_outs_3),
    .condition_valid (fork11_outs_3_valid),
    .condition_ready (fork11_outs_3_ready),
    .data (addi0_result),
    .data_valid (addi0_result_valid),
    .data_ready (addi0_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br4_trueOut),
    .trueOut_valid (cond_br4_trueOut_valid),
    .trueOut_ready (cond_br4_trueOut_ready),
    .falseOut (cond_br4_falseOut),
    .falseOut_valid (cond_br4_falseOut_valid),
    .falseOut_ready (cond_br4_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(6)) cond_br5(
    .condition (fork11_outs_1),
    .condition_valid (fork11_outs_1_valid),
    .condition_ready (fork11_outs_1_ready),
    .data (fork6_outs_0),
    .data_valid (fork6_outs_0_valid),
    .data_ready (fork6_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br5_trueOut),
    .trueOut_valid (cond_br5_trueOut_valid),
    .trueOut_ready (cond_br5_trueOut_ready),
    .falseOut (cond_br5_falseOut),
    .falseOut_valid (cond_br5_falseOut_valid),
    .falseOut_ready (cond_br5_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(3)) cond_br6(
    .condition (fork11_outs_2),
    .condition_valid (fork11_outs_2_valid),
    .condition_ready (fork11_outs_2_ready),
    .data (fork7_outs_1),
    .data_valid (fork7_outs_1_valid),
    .data_ready (fork7_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br6_trueOut),
    .trueOut_valid (cond_br6_trueOut_valid),
    .trueOut_ready (cond_br6_trueOut_ready),
    .falseOut (cond_br6_falseOut),
    .falseOut_valid (cond_br6_falseOut_valid),
    .falseOut_ready (cond_br6_falseOut_ready)
  );

  oehb_dataless buffer20(
    .ins_valid (control_merge2_outs_valid),
    .ins_ready (control_merge2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer20_outs_valid),
    .outs_ready (buffer20_outs_ready)
  );

  tehb_dataless buffer21(
    .ins_valid (buffer20_outs_valid),
    .ins_ready (buffer20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer21_outs_valid),
    .outs_ready (buffer21_outs_ready)
  );

  cond_br_dataless cond_br7(
    .condition (fork11_outs_4),
    .condition_valid (fork11_outs_4_valid),
    .condition_ready (fork11_outs_4_ready),
    .data_valid (buffer21_outs_valid),
    .data_ready (buffer21_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br7_trueOut_valid),
    .trueOut_ready (cond_br7_trueOut_ready),
    .falseOut_valid (cond_br7_falseOut_valid),
    .falseOut_ready (cond_br7_falseOut_ready)
  );

  oehb #(.DATA_TYPE(3)) buffer24(
    .ins (cond_br6_falseOut),
    .ins_valid (cond_br6_falseOut_valid),
    .ins_ready (cond_br6_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer24_outs),
    .outs_valid (buffer24_outs_valid),
    .outs_ready (buffer24_outs_ready)
  );

  tehb #(.DATA_TYPE(3)) buffer25(
    .ins (buffer24_outs),
    .ins_valid (buffer24_outs_valid),
    .ins_ready (buffer24_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer25_outs),
    .outs_valid (buffer25_outs_valid),
    .outs_ready (buffer25_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(4)) extsi33(
    .ins (buffer25_outs),
    .ins_valid (buffer25_outs_valid),
    .ins_ready (buffer25_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi33_outs),
    .outs_valid (extsi33_outs_valid),
    .outs_ready (extsi33_outs_ready)
  );

  source source3(
    .clk (clk),
    .rst (rst),
    .outs_valid (source3_outs_valid),
    .outs_ready (source3_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(3)) constant19(
    .ctrl_valid (source3_outs_valid),
    .ctrl_ready (source3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant19_outs),
    .outs_valid (constant19_outs_valid),
    .outs_ready (constant19_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(4)) extsi34(
    .ins (constant19_outs),
    .ins_valid (constant19_outs_valid),
    .ins_ready (constant19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi34_outs),
    .outs_valid (extsi34_outs_valid),
    .outs_ready (extsi34_outs_ready)
  );

  source source4(
    .clk (clk),
    .rst (rst),
    .outs_valid (source4_outs_valid),
    .outs_ready (source4_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(2)) constant20(
    .ctrl_valid (source4_outs_valid),
    .ctrl_ready (source4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant20_outs),
    .outs_valid (constant20_outs_valid),
    .outs_ready (constant20_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(4)) extsi35(
    .ins (constant20_outs),
    .ins_valid (constant20_outs_valid),
    .ins_ready (constant20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi35_outs),
    .outs_valid (extsi35_outs_valid),
    .outs_ready (extsi35_outs_ready)
  );

  addi #(.DATA_TYPE(4)) addi5(
    .lhs (extsi33_outs),
    .lhs_valid (extsi33_outs_valid),
    .lhs_ready (extsi33_outs_ready),
    .rhs (extsi35_outs),
    .rhs_valid (extsi35_outs_valid),
    .rhs_ready (extsi35_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi5_result),
    .result_valid (addi5_result_valid),
    .result_ready (addi5_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(4)) fork12(
    .ins (addi5_result),
    .ins_valid (addi5_result_valid),
    .ins_ready (addi5_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork12_outs_1, fork12_outs_0}),
    .outs_valid ({fork12_outs_1_valid, fork12_outs_0_valid}),
    .outs_ready ({fork12_outs_1_ready, fork12_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(4), .OUTPUT_TYPE(3)) trunci3(
    .ins (fork12_outs_0),
    .ins_valid (fork12_outs_0_valid),
    .ins_ready (fork12_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci3_outs),
    .outs_valid (trunci3_outs_valid),
    .outs_ready (trunci3_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(4)) cmpi1(
    .lhs (fork12_outs_1),
    .lhs_valid (fork12_outs_1_valid),
    .lhs_ready (fork12_outs_1_ready),
    .rhs (extsi34_outs),
    .rhs_valid (extsi34_outs_valid),
    .rhs_ready (extsi34_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi1_result),
    .result_valid (cmpi1_result_valid),
    .result_ready (cmpi1_result_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork13(
    .ins (cmpi1_result),
    .ins_valid (cmpi1_result_valid),
    .ins_ready (cmpi1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork13_outs_3, fork13_outs_2, fork13_outs_1, fork13_outs_0}),
    .outs_valid ({fork13_outs_3_valid, fork13_outs_2_valid, fork13_outs_1_valid, fork13_outs_0_valid}),
    .outs_ready ({fork13_outs_3_ready, fork13_outs_2_ready, fork13_outs_1_ready, fork13_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(3)) cond_br8(
    .condition (fork13_outs_0),
    .condition_valid (fork13_outs_0_valid),
    .condition_ready (fork13_outs_0_ready),
    .data (trunci3_outs),
    .data_valid (trunci3_outs_valid),
    .data_ready (trunci3_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br8_trueOut),
    .trueOut_valid (cond_br8_trueOut_valid),
    .trueOut_ready (cond_br8_trueOut_ready),
    .falseOut (cond_br8_falseOut),
    .falseOut_valid (cond_br8_falseOut_valid),
    .falseOut_ready (cond_br8_falseOut_ready)
  );

  sink #(.DATA_TYPE(3)) sink2(
    .ins (cond_br8_falseOut),
    .ins_valid (cond_br8_falseOut_valid),
    .ins_ready (cond_br8_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer26(
    .ins (cond_br4_falseOut),
    .ins_valid (cond_br4_falseOut_valid),
    .ins_ready (cond_br4_falseOut_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br9(
    .condition (fork13_outs_2),
    .condition_valid (fork13_outs_2_valid),
    .condition_ready (fork13_outs_2_ready),
    .data (buffer27_outs),
    .data_valid (buffer27_outs_valid),
    .data_ready (buffer27_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br9_trueOut),
    .trueOut_valid (cond_br9_trueOut_valid),
    .trueOut_ready (cond_br9_trueOut_ready),
    .falseOut (cond_br9_falseOut),
    .falseOut_valid (cond_br9_falseOut_valid),
    .falseOut_ready (cond_br9_falseOut_ready)
  );

  oehb #(.DATA_TYPE(6)) buffer22(
    .ins (cond_br5_falseOut),
    .ins_valid (cond_br5_falseOut_valid),
    .ins_ready (cond_br5_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer22_outs),
    .outs_valid (buffer22_outs_valid),
    .outs_ready (buffer22_outs_ready)
  );

  tehb #(.DATA_TYPE(6)) buffer23(
    .ins (buffer22_outs),
    .ins_valid (buffer22_outs_valid),
    .ins_ready (buffer22_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer23_outs),
    .outs_valid (buffer23_outs_valid),
    .outs_ready (buffer23_outs_ready)
  );

  cond_br #(.DATA_TYPE(6)) cond_br10(
    .condition (fork13_outs_1),
    .condition_valid (fork13_outs_1_valid),
    .condition_ready (fork13_outs_1_ready),
    .data (buffer23_outs),
    .data_valid (buffer23_outs_valid),
    .data_ready (buffer23_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br10_trueOut),
    .trueOut_valid (cond_br10_trueOut_valid),
    .trueOut_ready (cond_br10_trueOut_ready),
    .falseOut (cond_br10_falseOut),
    .falseOut_valid (cond_br10_falseOut_valid),
    .falseOut_ready (cond_br10_falseOut_ready)
  );

  oehb_dataless buffer28(
    .ins_valid (cond_br7_falseOut_valid),
    .ins_ready (cond_br7_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer28_outs_valid),
    .outs_ready (buffer28_outs_ready)
  );

  tehb_dataless buffer29(
    .ins_valid (buffer28_outs_valid),
    .ins_ready (buffer28_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer29_outs_valid),
    .outs_ready (buffer29_outs_ready)
  );

  cond_br_dataless cond_br11(
    .condition (fork13_outs_3),
    .condition_valid (fork13_outs_3_valid),
    .condition_ready (fork13_outs_3_ready),
    .data_valid (buffer29_outs_valid),
    .data_ready (buffer29_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br11_trueOut_valid),
    .trueOut_ready (cond_br11_trueOut_ready),
    .falseOut_valid (cond_br11_falseOut_valid),
    .falseOut_ready (cond_br11_falseOut_ready)
  );

  oehb #(.DATA_TYPE(6)) buffer30(
    .ins (cond_br10_falseOut),
    .ins_valid (cond_br10_falseOut_valid),
    .ins_ready (cond_br10_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer30_outs),
    .outs_valid (buffer30_outs_valid),
    .outs_ready (buffer30_outs_ready)
  );

  tehb #(.DATA_TYPE(6)) buffer31(
    .ins (buffer30_outs),
    .ins_valid (buffer30_outs_valid),
    .ins_ready (buffer30_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer31_outs),
    .outs_valid (buffer31_outs_valid),
    .outs_ready (buffer31_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork14(
    .ins (buffer31_outs),
    .ins_valid (buffer31_outs_valid),
    .ins_ready (buffer31_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork14_outs_1, fork14_outs_0}),
    .outs_valid ({fork14_outs_1_valid, fork14_outs_0_valid}),
    .outs_ready ({fork14_outs_1_ready, fork14_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(6), .OUTPUT_TYPE(10)) extsi16(
    .ins (fork14_outs_0),
    .ins_valid (fork14_outs_0_valid),
    .ins_ready (fork14_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi16_outs),
    .outs_valid (extsi16_outs_valid),
    .outs_ready (extsi16_outs_ready)
  );

  extsi #(.INPUT_TYPE(6), .OUTPUT_TYPE(7)) extsi36(
    .ins (fork14_outs_1),
    .ins_valid (fork14_outs_1_valid),
    .ins_ready (fork14_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi36_outs),
    .outs_valid (extsi36_outs_valid),
    .outs_ready (extsi36_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer32(
    .ins (cond_br9_falseOut),
    .ins_valid (cond_br9_falseOut_valid),
    .ins_ready (cond_br9_falseOut_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork15(
    .ins (buffer33_outs),
    .ins_valid (buffer33_outs_valid),
    .ins_ready (buffer33_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork15_outs_1, fork15_outs_0}),
    .outs_valid ({fork15_outs_1_valid, fork15_outs_0_valid}),
    .outs_ready ({fork15_outs_1_ready, fork15_outs_0_ready})
  );

  oehb_dataless buffer34(
    .ins_valid (cond_br11_falseOut_valid),
    .ins_ready (cond_br11_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer34_outs_valid),
    .outs_ready (buffer34_outs_ready)
  );

  tehb_dataless buffer35(
    .ins_valid (buffer34_outs_valid),
    .ins_ready (buffer34_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer35_outs_valid),
    .outs_ready (buffer35_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork16(
    .ins_valid (buffer35_outs_valid),
    .ins_ready (buffer35_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork16_outs_1_valid, fork16_outs_0_valid}),
    .outs_ready ({fork16_outs_1_ready, fork16_outs_0_ready})
  );

  handshake_constant_3 #(.DATA_WIDTH(2)) constant21(
    .ctrl_valid (fork16_outs_0_valid),
    .ctrl_ready (fork16_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant21_outs),
    .outs_valid (constant21_outs_valid),
    .outs_ready (constant21_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi11(
    .ins (constant21_outs),
    .ins_valid (constant21_outs_valid),
    .ins_ready (constant21_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi11_outs),
    .outs_valid (extsi11_outs_valid),
    .outs_ready (extsi11_outs_ready)
  );

  source source5(
    .clk (clk),
    .rst (rst),
    .outs_valid (source5_outs_valid),
    .outs_ready (source5_outs_ready)
  );

  handshake_constant_4 #(.DATA_WIDTH(6)) constant22(
    .ctrl_valid (source5_outs_valid),
    .ctrl_ready (source5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant22_outs),
    .outs_valid (constant22_outs_valid),
    .outs_ready (constant22_outs_ready)
  );

  extsi #(.INPUT_TYPE(6), .OUTPUT_TYPE(7)) extsi37(
    .ins (constant22_outs),
    .ins_valid (constant22_outs_valid),
    .ins_ready (constant22_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi37_outs),
    .outs_valid (extsi37_outs_valid),
    .outs_ready (extsi37_outs_ready)
  );

  source source6(
    .clk (clk),
    .rst (rst),
    .outs_valid (source6_outs_valid),
    .outs_ready (source6_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(2)) constant23(
    .ctrl_valid (source6_outs_valid),
    .ctrl_ready (source6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant23_outs),
    .outs_valid (constant23_outs_valid),
    .outs_ready (constant23_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(7)) extsi38(
    .ins (constant23_outs),
    .ins_valid (constant23_outs_valid),
    .ins_ready (constant23_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi38_outs),
    .outs_valid (extsi38_outs_valid),
    .outs_ready (extsi38_outs_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(10)) store0(
    .addrIn (extsi16_outs),
    .addrIn_valid (extsi16_outs_valid),
    .addrIn_ready (extsi16_outs_ready),
    .dataIn (fork15_outs_0),
    .dataIn_valid (fork15_outs_0_valid),
    .dataIn_ready (fork15_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store0_addrOut),
    .addrOut_valid (store0_addrOut_valid),
    .addrOut_ready (store0_addrOut_ready),
    .dataToMem (store0_dataToMem),
    .dataToMem_valid (store0_dataToMem_valid),
    .dataToMem_ready (store0_dataToMem_ready)
  );

  addi #(.DATA_TYPE(7)) addi6(
    .lhs (extsi36_outs),
    .lhs_valid (extsi36_outs_valid),
    .lhs_ready (extsi36_outs_ready),
    .rhs (extsi38_outs),
    .rhs_valid (extsi38_outs_valid),
    .rhs_ready (extsi38_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi6_result),
    .result_valid (addi6_result_valid),
    .result_ready (addi6_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(7)) fork17(
    .ins (addi6_result),
    .ins_valid (addi6_result_valid),
    .ins_ready (addi6_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork17_outs_1, fork17_outs_0}),
    .outs_valid ({fork17_outs_1_valid, fork17_outs_0_valid}),
    .outs_ready ({fork17_outs_1_ready, fork17_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(7), .OUTPUT_TYPE(6)) trunci4(
    .ins (fork17_outs_0),
    .ins_valid (fork17_outs_0_valid),
    .ins_ready (fork17_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci4_outs),
    .outs_valid (trunci4_outs_valid),
    .outs_ready (trunci4_outs_ready)
  );

  handshake_cmpi_1 #(.DATA_TYPE(7)) cmpi2(
    .lhs (fork17_outs_1),
    .lhs_valid (fork17_outs_1_valid),
    .lhs_ready (fork17_outs_1_ready),
    .rhs (extsi37_outs),
    .rhs_valid (extsi37_outs_valid),
    .rhs_ready (extsi37_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi2_result),
    .result_valid (cmpi2_result_valid),
    .result_ready (cmpi2_result_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork18(
    .ins (cmpi2_result),
    .ins_valid (cmpi2_result_valid),
    .ins_ready (cmpi2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork18_outs_2, fork18_outs_1, fork18_outs_0}),
    .outs_valid ({fork18_outs_2_valid, fork18_outs_1_valid, fork18_outs_0_valid}),
    .outs_ready ({fork18_outs_2_ready, fork18_outs_1_ready, fork18_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(6)) cond_br12(
    .condition (fork18_outs_0),
    .condition_valid (fork18_outs_0_valid),
    .condition_ready (fork18_outs_0_ready),
    .data (trunci4_outs),
    .data_valid (trunci4_outs_valid),
    .data_ready (trunci4_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br12_trueOut),
    .trueOut_valid (cond_br12_trueOut_valid),
    .trueOut_ready (cond_br12_trueOut_ready),
    .falseOut (cond_br12_falseOut),
    .falseOut_valid (cond_br12_falseOut_valid),
    .falseOut_ready (cond_br12_falseOut_ready)
  );

  sink #(.DATA_TYPE(6)) sink4(
    .ins (cond_br12_falseOut),
    .ins_valid (cond_br12_falseOut_valid),
    .ins_ready (cond_br12_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br_dataless cond_br13(
    .condition (fork18_outs_1),
    .condition_valid (fork18_outs_1_valid),
    .condition_ready (fork18_outs_1_ready),
    .data_valid (fork16_outs_1_valid),
    .data_ready (fork16_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br13_trueOut_valid),
    .trueOut_ready (cond_br13_trueOut_ready),
    .falseOut_valid (cond_br13_falseOut_valid),
    .falseOut_ready (cond_br13_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br14(
    .condition (fork18_outs_2),
    .condition_valid (fork18_outs_2_valid),
    .condition_ready (fork18_outs_2_ready),
    .data (fork15_outs_1),
    .data_valid (fork15_outs_1_valid),
    .data_ready (fork15_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br14_trueOut),
    .trueOut_valid (cond_br14_trueOut_valid),
    .trueOut_ready (cond_br14_trueOut_ready),
    .falseOut (cond_br14_falseOut),
    .falseOut_valid (cond_br14_falseOut_valid),
    .falseOut_ready (cond_br14_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink5(
    .ins (cond_br14_trueOut),
    .ins_valid (cond_br14_trueOut_valid),
    .ins_ready (cond_br14_trueOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb_dataless buffer38(
    .ins_valid (cond_br13_falseOut_valid),
    .ins_ready (cond_br13_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer38_outs_valid),
    .outs_ready (buffer38_outs_ready)
  );

  tehb_dataless buffer39(
    .ins_valid (buffer38_outs_valid),
    .ins_ready (buffer38_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer39_outs_valid),
    .outs_ready (buffer39_outs_ready)
  );

  fork_dataless #(.SIZE(3)) fork19(
    .ins_valid (buffer39_outs_valid),
    .ins_ready (buffer39_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork19_outs_2_valid, fork19_outs_1_valid, fork19_outs_0_valid}),
    .outs_ready ({fork19_outs_2_ready, fork19_outs_1_ready, fork19_outs_0_ready})
  );

  oehb #(.DATA_TYPE(8)) buffer36(
    .ins (cond_br14_falseOut),
    .ins_valid (cond_br14_falseOut_valid),
    .ins_ready (cond_br14_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer36_outs),
    .outs_valid (buffer36_outs_valid),
    .outs_ready (buffer36_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer37(
    .ins (buffer36_outs),
    .ins_valid (buffer36_outs_valid),
    .ins_ready (buffer36_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer37_outs),
    .outs_valid (buffer37_outs_valid),
    .outs_ready (buffer37_outs_ready)
  );

endmodule
