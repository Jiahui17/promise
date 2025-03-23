module bicg(
  input [7:0] a_loadData,
  input [7:0] s_loadData,
  input [7:0] q_loadData,
  input [7:0] p_loadData,
  input [7:0] r_loadData,
  input  a_start_valid,
  input  s_start_valid,
  input  q_start_valid,
  input  p_start_valid,
  input  r_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  a_end_ready,
  input  s_end_ready,
  input  q_end_ready,
  input  p_end_ready,
  input  r_end_ready,
  input  end_ready,
  output  a_start_ready,
  output  s_start_ready,
  output  q_start_ready,
  output  p_start_ready,
  output  r_start_ready,
  output  start_ready,
  output [7:0] out0,
  output  out0_valid,
  output  a_end_valid,
  output  s_end_valid,
  output  q_end_valid,
  output  p_end_valid,
  output  r_end_valid,
  output  end_valid,
  output  a_loadEn,
  output [6:0] a_loadAddr,
  output  a_storeEn,
  output [6:0] a_storeAddr,
  output [7:0] a_storeData,
  output  s_loadEn,
  output [3:0] s_loadAddr,
  output  s_storeEn,
  output [3:0] s_storeAddr,
  output [7:0] s_storeData,
  output  q_loadEn,
  output [3:0] q_loadAddr,
  output  q_storeEn,
  output [3:0] q_storeAddr,
  output [7:0] q_storeData,
  output  p_loadEn,
  output [3:0] p_loadAddr,
  output  p_storeEn,
  output [3:0] p_storeAddr,
  output [7:0] p_storeData,
  output  r_loadEn,
  output [3:0] r_loadAddr,
  output  r_storeEn,
  output [3:0] r_storeAddr,
  output [7:0] r_storeData
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
  wire [3:0] mem_controller5_loadAddr;
  wire  mem_controller5_storeEn;
  wire [3:0] mem_controller5_storeAddr;
  wire [7:0] mem_controller5_storeData;
  wire [7:0] mem_controller6_ldData_0;
  wire  mem_controller6_ldData_0_valid;
  wire  mem_controller6_ldData_0_ready;
  wire  mem_controller6_memEnd_valid;
  wire  mem_controller6_memEnd_ready;
  wire  mem_controller6_loadEn;
  wire [3:0] mem_controller6_loadAddr;
  wire  mem_controller6_storeEn;
  wire [3:0] mem_controller6_storeAddr;
  wire [7:0] mem_controller6_storeData;
  wire [7:0] mem_controller7_ldData_0;
  wire  mem_controller7_ldData_0_valid;
  wire  mem_controller7_ldData_0_ready;
  wire  mem_controller7_memEnd_valid;
  wire  mem_controller7_memEnd_ready;
  wire  mem_controller7_loadEn;
  wire [3:0] mem_controller7_loadAddr;
  wire  mem_controller7_storeEn;
  wire [3:0] mem_controller7_storeAddr;
  wire [7:0] mem_controller7_storeData;
  wire [7:0] mem_controller8_ldData_0;
  wire  mem_controller8_ldData_0_valid;
  wire  mem_controller8_ldData_0_ready;
  wire  mem_controller8_memEnd_valid;
  wire  mem_controller8_memEnd_ready;
  wire  mem_controller8_loadEn;
  wire [3:0] mem_controller8_loadAddr;
  wire  mem_controller8_storeEn;
  wire [3:0] mem_controller8_storeAddr;
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
  wire [0:0] constant11_outs;
  wire  constant11_outs_valid;
  wire  constant11_outs_ready;
  wire [4:0] extsi14_outs;
  wire  extsi14_outs_valid;
  wire  extsi14_outs_ready;
  wire [4:0] mux0_outs;
  wire  mux0_outs_valid;
  wire  mux0_outs_ready;
  wire [4:0] buffer0_outs;
  wire  buffer0_outs_valid;
  wire  buffer0_outs_ready;
  wire [4:0] buffer1_outs;
  wire  buffer1_outs_valid;
  wire  buffer1_outs_ready;
  wire [4:0] fork1_outs_0;
  wire  fork1_outs_0_valid;
  wire  fork1_outs_0_ready;
  wire [4:0] fork1_outs_1;
  wire  fork1_outs_1_valid;
  wire  fork1_outs_1_ready;
  wire [3:0] trunci2_outs;
  wire  trunci2_outs_valid;
  wire  trunci2_outs_ready;
  wire  control_merge0_outs_valid;
  wire  control_merge0_outs_ready;
  wire [0:0] control_merge0_index;
  wire  control_merge0_index_valid;
  wire  control_merge0_index_ready;
  wire  buffer2_outs_valid;
  wire  buffer2_outs_ready;
  wire  buffer3_outs_valid;
  wire  buffer3_outs_ready;
  wire  fork2_outs_0_valid;
  wire  fork2_outs_0_ready;
  wire  fork2_outs_1_valid;
  wire  fork2_outs_1_ready;
  wire [0:0] constant12_outs;
  wire  constant12_outs_valid;
  wire  constant12_outs_ready;
  wire [3:0] load0_addrOut;
  wire  load0_addrOut_valid;
  wire  load0_addrOut_ready;
  wire [7:0] load0_dataOut;
  wire  load0_dataOut_valid;
  wire  load0_dataOut_ready;
  wire [4:0] extsi13_outs;
  wire  extsi13_outs_valid;
  wire  extsi13_outs_ready;
  wire [4:0] mux1_outs;
  wire  mux1_outs_valid;
  wire  mux1_outs_ready;
  wire [4:0] buffer4_outs;
  wire  buffer4_outs_valid;
  wire  buffer4_outs_ready;
  wire [4:0] buffer5_outs;
  wire  buffer5_outs_valid;
  wire  buffer5_outs_ready;
  wire [4:0] fork3_outs_0;
  wire  fork3_outs_0_valid;
  wire  fork3_outs_0_ready;
  wire [4:0] fork3_outs_1;
  wire  fork3_outs_1_valid;
  wire  fork3_outs_1_ready;
  wire [4:0] fork3_outs_2;
  wire  fork3_outs_2_valid;
  wire  fork3_outs_2_ready;
  wire [4:0] fork3_outs_3;
  wire  fork3_outs_3_valid;
  wire  fork3_outs_3_ready;
  wire [4:0] fork3_outs_4;
  wire  fork3_outs_4_valid;
  wire  fork3_outs_4_ready;
  wire [6:0] extsi15_outs;
  wire  extsi15_outs_valid;
  wire  extsi15_outs_ready;
  wire [5:0] extsi16_outs;
  wire  extsi16_outs_valid;
  wire  extsi16_outs_ready;
  wire [3:0] trunci3_outs;
  wire  trunci3_outs_valid;
  wire  trunci3_outs_ready;
  wire [3:0] trunci4_outs;
  wire  trunci4_outs_valid;
  wire  trunci4_outs_ready;
  wire [3:0] trunci5_outs;
  wire  trunci5_outs_valid;
  wire  trunci5_outs_ready;
  wire [7:0] mux2_outs;
  wire  mux2_outs_valid;
  wire  mux2_outs_ready;
  wire [4:0] mux3_outs;
  wire  mux3_outs_valid;
  wire  mux3_outs_ready;
  wire [4:0] buffer8_outs;
  wire  buffer8_outs_valid;
  wire  buffer8_outs_ready;
  wire [4:0] buffer9_outs;
  wire  buffer9_outs_valid;
  wire  buffer9_outs_ready;
  wire [4:0] fork4_outs_0;
  wire  fork4_outs_0_valid;
  wire  fork4_outs_0_ready;
  wire [4:0] fork4_outs_1;
  wire  fork4_outs_1_valid;
  wire  fork4_outs_1_ready;
  wire [4:0] fork4_outs_2;
  wire  fork4_outs_2_valid;
  wire  fork4_outs_2_ready;
  wire [31:0] extsi17_outs;
  wire  extsi17_outs_valid;
  wire  extsi17_outs_ready;
  wire [31:0] fork5_outs_0;
  wire  fork5_outs_0_valid;
  wire  fork5_outs_0_ready;
  wire [31:0] fork5_outs_1;
  wire  fork5_outs_1_valid;
  wire  fork5_outs_1_ready;
  wire [3:0] trunci6_outs;
  wire  trunci6_outs_valid;
  wire  trunci6_outs_ready;
  wire  control_merge1_outs_valid;
  wire  control_merge1_outs_ready;
  wire [0:0] control_merge1_index;
  wire  control_merge1_index_valid;
  wire  control_merge1_index_ready;
  wire [0:0] fork6_outs_0;
  wire  fork6_outs_0_valid;
  wire  fork6_outs_0_ready;
  wire [0:0] fork6_outs_1;
  wire  fork6_outs_1_valid;
  wire  fork6_outs_1_ready;
  wire [0:0] fork6_outs_2;
  wire  fork6_outs_2_valid;
  wire  fork6_outs_2_ready;
  wire  buffer10_outs_valid;
  wire  buffer10_outs_ready;
  wire  buffer11_outs_valid;
  wire  buffer11_outs_ready;
  wire  fork7_outs_0_valid;
  wire  fork7_outs_0_ready;
  wire  fork7_outs_1_valid;
  wire  fork7_outs_1_ready;
  wire [1:0] constant13_outs;
  wire  constant13_outs_valid;
  wire  constant13_outs_ready;
  wire [31:0] extsi6_outs;
  wire  extsi6_outs_valid;
  wire  extsi6_outs_ready;
  wire  source0_outs_valid;
  wire  source0_outs_ready;
  wire [4:0] constant14_outs;
  wire  constant14_outs_valid;
  wire  constant14_outs_ready;
  wire [5:0] extsi18_outs;
  wire  extsi18_outs_valid;
  wire  extsi18_outs_ready;
  wire  source1_outs_valid;
  wire  source1_outs_ready;
  wire [1:0] constant15_outs;
  wire  constant15_outs_valid;
  wire  constant15_outs_ready;
  wire [1:0] fork8_outs_0;
  wire  fork8_outs_0_valid;
  wire  fork8_outs_0_ready;
  wire [1:0] fork8_outs_1;
  wire  fork8_outs_1_valid;
  wire  fork8_outs_1_ready;
  wire [5:0] extsi19_outs;
  wire  extsi19_outs_valid;
  wire  extsi19_outs_ready;
  wire [31:0] extsi8_outs;
  wire  extsi8_outs_valid;
  wire  extsi8_outs_ready;
  wire  source2_outs_valid;
  wire  source2_outs_ready;
  wire [2:0] constant16_outs;
  wire  constant16_outs_valid;
  wire  constant16_outs_ready;
  wire [31:0] extsi9_outs;
  wire  extsi9_outs_valid;
  wire  extsi9_outs_ready;
  wire [31:0] shli0_result;
  wire  shli0_result_valid;
  wire  shli0_result_ready;
  wire [6:0] trunci7_outs;
  wire  trunci7_outs_valid;
  wire  trunci7_outs_ready;
  wire [31:0] shli1_result;
  wire  shli1_result_valid;
  wire  shli1_result_ready;
  wire [6:0] trunci8_outs;
  wire  trunci8_outs_valid;
  wire  trunci8_outs_ready;
  wire [6:0] addi5_result;
  wire  addi5_result_valid;
  wire  addi5_result_ready;
  wire [6:0] addi2_result;
  wire  addi2_result_valid;
  wire  addi2_result_ready;
  wire [6:0] load1_addrOut;
  wire  load1_addrOut_valid;
  wire  load1_addrOut_ready;
  wire [7:0] load1_dataOut;
  wire  load1_dataOut_valid;
  wire  load1_dataOut_ready;
  wire [7:0] fork9_outs_0;
  wire  fork9_outs_0_valid;
  wire  fork9_outs_0_ready;
  wire [7:0] fork9_outs_1;
  wire  fork9_outs_1_valid;
  wire  fork9_outs_1_ready;
  wire [15:0] extsi20_outs;
  wire  extsi20_outs_valid;
  wire  extsi20_outs_ready;
  wire [15:0] extsi21_outs;
  wire  extsi21_outs_valid;
  wire  extsi21_outs_ready;
  wire [3:0] load2_addrOut;
  wire  load2_addrOut_valid;
  wire  load2_addrOut_ready;
  wire [7:0] load2_dataOut;
  wire  load2_dataOut_valid;
  wire  load2_dataOut_ready;
  wire [3:0] load3_addrOut;
  wire  load3_addrOut_valid;
  wire  load3_addrOut_ready;
  wire [7:0] load3_dataOut;
  wire  load3_dataOut_valid;
  wire  load3_dataOut_ready;
  wire [15:0] extsi22_outs;
  wire  extsi22_outs_valid;
  wire  extsi22_outs_ready;
  wire [15:0] muli0_result;
  wire  muli0_result_valid;
  wire  muli0_result_ready;
  wire [7:0] trunci9_outs;
  wire  trunci9_outs_valid;
  wire  trunci9_outs_ready;
  wire [7:0] addi0_result;
  wire  addi0_result_valid;
  wire  addi0_result_ready;
  wire [3:0] store0_addrOut;
  wire  store0_addrOut_valid;
  wire  store0_addrOut_ready;
  wire [7:0] store0_dataToMem;
  wire  store0_dataToMem_valid;
  wire  store0_dataToMem_ready;
  wire [3:0] load4_addrOut;
  wire  load4_addrOut_valid;
  wire  load4_addrOut_ready;
  wire [7:0] load4_dataOut;
  wire  load4_dataOut_valid;
  wire  load4_dataOut_ready;
  wire [15:0] extsi23_outs;
  wire  extsi23_outs_valid;
  wire  extsi23_outs_ready;
  wire [15:0] muli1_result;
  wire  muli1_result_valid;
  wire  muli1_result_ready;
  wire [7:0] trunci1_outs;
  wire  trunci1_outs_valid;
  wire  trunci1_outs_ready;
  wire [7:0] buffer6_outs;
  wire  buffer6_outs_valid;
  wire  buffer6_outs_ready;
  wire [7:0] buffer7_outs;
  wire  buffer7_outs_valid;
  wire  buffer7_outs_ready;
  wire [7:0] addi1_result;
  wire  addi1_result_valid;
  wire  addi1_result_ready;
  wire [5:0] addi3_result;
  wire  addi3_result_valid;
  wire  addi3_result_ready;
  wire [5:0] fork10_outs_0;
  wire  fork10_outs_0_valid;
  wire  fork10_outs_0_ready;
  wire [5:0] fork10_outs_1;
  wire  fork10_outs_1_valid;
  wire  fork10_outs_1_ready;
  wire [4:0] trunci10_outs;
  wire  trunci10_outs_valid;
  wire  trunci10_outs_ready;
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
  wire [4:0] cond_br2_trueOut;
  wire  cond_br2_trueOut_valid;
  wire  cond_br2_trueOut_ready;
  wire [4:0] cond_br2_falseOut;
  wire  cond_br2_falseOut_valid;
  wire  cond_br2_falseOut_ready;
  wire [7:0] cond_br3_trueOut;
  wire  cond_br3_trueOut_valid;
  wire  cond_br3_trueOut_ready;
  wire [7:0] cond_br3_falseOut;
  wire  cond_br3_falseOut_valid;
  wire  cond_br3_falseOut_ready;
  wire [4:0] cond_br4_trueOut;
  wire  cond_br4_trueOut_valid;
  wire  cond_br4_trueOut_ready;
  wire [4:0] cond_br4_falseOut;
  wire  cond_br4_falseOut_valid;
  wire  cond_br4_falseOut_ready;
  wire  cond_br5_trueOut_valid;
  wire  cond_br5_trueOut_ready;
  wire  cond_br5_falseOut_valid;
  wire  cond_br5_falseOut_ready;
  wire [4:0] buffer12_outs;
  wire  buffer12_outs_valid;
  wire  buffer12_outs_ready;
  wire [4:0] buffer13_outs;
  wire  buffer13_outs_valid;
  wire  buffer13_outs_ready;
  wire [4:0] fork12_outs_0;
  wire  fork12_outs_0_valid;
  wire  fork12_outs_0_ready;
  wire [4:0] fork12_outs_1;
  wire  fork12_outs_1_valid;
  wire  fork12_outs_1_ready;
  wire [5:0] extsi24_outs;
  wire  extsi24_outs_valid;
  wire  extsi24_outs_ready;
  wire [3:0] trunci11_outs;
  wire  trunci11_outs_valid;
  wire  trunci11_outs_ready;
  wire [7:0] buffer14_outs;
  wire  buffer14_outs_valid;
  wire  buffer14_outs_ready;
  wire [7:0] buffer15_outs;
  wire  buffer15_outs_valid;
  wire  buffer15_outs_ready;
  wire [7:0] fork13_outs_0;
  wire  fork13_outs_0_valid;
  wire  fork13_outs_0_ready;
  wire [7:0] fork13_outs_1;
  wire  fork13_outs_1_valid;
  wire  fork13_outs_1_ready;
  wire  buffer16_outs_valid;
  wire  buffer16_outs_ready;
  wire  buffer17_outs_valid;
  wire  buffer17_outs_ready;
  wire  fork14_outs_0_valid;
  wire  fork14_outs_0_ready;
  wire  fork14_outs_1_valid;
  wire  fork14_outs_1_ready;
  wire [1:0] constant17_outs;
  wire  constant17_outs_valid;
  wire  constant17_outs_ready;
  wire [31:0] extsi10_outs;
  wire  extsi10_outs_valid;
  wire  extsi10_outs_ready;
  wire  source3_outs_valid;
  wire  source3_outs_ready;
  wire [4:0] constant18_outs;
  wire  constant18_outs_valid;
  wire  constant18_outs_ready;
  wire [5:0] extsi25_outs;
  wire  extsi25_outs_valid;
  wire  extsi25_outs_ready;
  wire  source4_outs_valid;
  wire  source4_outs_ready;
  wire [1:0] constant19_outs;
  wire  constant19_outs_valid;
  wire  constant19_outs_ready;
  wire [5:0] extsi26_outs;
  wire  extsi26_outs_valid;
  wire  extsi26_outs_ready;
  wire [3:0] store1_addrOut;
  wire  store1_addrOut_valid;
  wire  store1_addrOut_ready;
  wire [7:0] store1_dataToMem;
  wire  store1_dataToMem_valid;
  wire  store1_dataToMem_ready;
  wire [5:0] addi4_result;
  wire  addi4_result_valid;
  wire  addi4_result_ready;
  wire [5:0] fork15_outs_0;
  wire  fork15_outs_0_valid;
  wire  fork15_outs_0_ready;
  wire [5:0] fork15_outs_1;
  wire  fork15_outs_1_valid;
  wire  fork15_outs_1_ready;
  wire [4:0] trunci12_outs;
  wire  trunci12_outs_valid;
  wire  trunci12_outs_ready;
  wire [0:0] cmpi1_result;
  wire  cmpi1_result_valid;
  wire  cmpi1_result_ready;
  wire [0:0] fork16_outs_0;
  wire  fork16_outs_0_valid;
  wire  fork16_outs_0_ready;
  wire [0:0] fork16_outs_1;
  wire  fork16_outs_1_valid;
  wire  fork16_outs_1_ready;
  wire [0:0] fork16_outs_2;
  wire  fork16_outs_2_valid;
  wire  fork16_outs_2_ready;
  wire [4:0] cond_br6_trueOut;
  wire  cond_br6_trueOut_valid;
  wire  cond_br6_trueOut_ready;
  wire [4:0] cond_br6_falseOut;
  wire  cond_br6_falseOut_valid;
  wire  cond_br6_falseOut_ready;
  wire  cond_br7_trueOut_valid;
  wire  cond_br7_trueOut_ready;
  wire  cond_br7_falseOut_valid;
  wire  cond_br7_falseOut_ready;
  wire [7:0] cond_br8_trueOut;
  wire  cond_br8_trueOut_valid;
  wire  cond_br8_trueOut_ready;
  wire [7:0] cond_br8_falseOut;
  wire  cond_br8_falseOut_valid;
  wire  cond_br8_falseOut_ready;
  wire  buffer20_outs_valid;
  wire  buffer20_outs_ready;
  wire  buffer21_outs_valid;
  wire  buffer21_outs_ready;
  wire  fork17_outs_0_valid;
  wire  fork17_outs_0_ready;
  wire  fork17_outs_1_valid;
  wire  fork17_outs_1_ready;
  wire  fork17_outs_2_valid;
  wire  fork17_outs_2_ready;
  wire  fork17_outs_3_valid;
  wire  fork17_outs_3_ready;
  wire  fork17_outs_4_valid;
  wire  fork17_outs_4_ready;
  wire [7:0] buffer18_outs;
  wire  buffer18_outs_valid;
  wire  buffer18_outs_ready;
  wire [7:0] buffer19_outs;
  wire  buffer19_outs_valid;
  wire  buffer19_outs_ready;

  assign out0 = buffer19_outs;
  assign out0_valid = buffer19_outs_valid;
  assign buffer19_outs_ready = out0_ready;
  assign a_end_valid = mem_controller9_memEnd_valid;
  assign mem_controller9_memEnd_ready = a_end_ready;
  assign s_end_valid = mem_controller8_memEnd_valid;
  assign mem_controller8_memEnd_ready = s_end_ready;
  assign q_end_valid = mem_controller7_memEnd_valid;
  assign mem_controller7_memEnd_ready = q_end_ready;
  assign p_end_valid = mem_controller6_memEnd_valid;
  assign mem_controller6_memEnd_ready = p_end_ready;
  assign r_end_valid = mem_controller5_memEnd_valid;
  assign mem_controller5_memEnd_ready = r_end_ready;
  assign end_valid = fork0_outs_1_valid;
  assign fork0_outs_1_ready = end_ready;
  assign a_loadEn = mem_controller9_loadEn;
  assign a_loadAddr = mem_controller9_loadAddr;
  assign a_storeEn = mem_controller9_storeEn;
  assign a_storeAddr = mem_controller9_storeAddr;
  assign a_storeData = mem_controller9_storeData;
  assign s_loadEn = mem_controller8_loadEn;
  assign s_loadAddr = mem_controller8_loadAddr;
  assign s_storeEn = mem_controller8_storeEn;
  assign s_storeAddr = mem_controller8_storeAddr;
  assign s_storeData = mem_controller8_storeData;
  assign q_loadEn = mem_controller7_loadEn;
  assign q_loadAddr = mem_controller7_loadAddr;
  assign q_storeEn = mem_controller7_storeEn;
  assign q_storeAddr = mem_controller7_storeAddr;
  assign q_storeData = mem_controller7_storeData;
  assign p_loadEn = mem_controller6_loadEn;
  assign p_loadAddr = mem_controller6_loadAddr;
  assign p_storeEn = mem_controller6_storeEn;
  assign p_storeAddr = mem_controller6_storeAddr;
  assign p_storeData = mem_controller6_storeData;
  assign r_loadEn = mem_controller5_loadEn;
  assign r_loadAddr = mem_controller5_loadAddr;
  assign r_storeEn = mem_controller5_storeEn;
  assign r_storeAddr = mem_controller5_storeAddr;
  assign r_storeData = mem_controller5_storeData;

  fork_dataless #(.SIZE(3)) fork0(
    .ins_valid (start_valid),
    .ins_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready})
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller5(
    .loadData (r_loadData),
    .memStart_valid (r_start_valid),
    .memStart_ready (r_start_ready),
    .ldAddr ({load3_addrOut}),
    .ldAddr_valid ({load3_addrOut_valid}),
    .ldAddr_ready ({load3_addrOut_ready}),
    .ctrlEnd_valid (fork17_outs_4_valid),
    .ctrlEnd_ready (fork17_outs_4_ready),
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

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller6(
    .loadData (p_loadData),
    .memStart_valid (p_start_valid),
    .memStart_ready (p_start_ready),
    .ldAddr ({load4_addrOut}),
    .ldAddr_valid ({load4_addrOut_valid}),
    .ldAddr_ready ({load4_addrOut_ready}),
    .ctrlEnd_valid (fork17_outs_3_valid),
    .ctrlEnd_ready (fork17_outs_3_ready),
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

  mem_controller #(.NUM_CONTROLS(1), .NUM_LOADS(1), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller7(
    .loadData (q_loadData),
    .memStart_valid (q_start_valid),
    .memStart_ready (q_start_ready),
    .ldAddr ({load0_addrOut}),
    .ldAddr_valid ({load0_addrOut_valid}),
    .ldAddr_ready ({load0_addrOut_ready}),
    .ctrl ({extsi10_outs}),
    .ctrl_valid ({extsi10_outs_valid}),
    .ctrl_ready ({extsi10_outs_ready}),
    .stAddr ({store1_addrOut}),
    .stAddr_valid ({store1_addrOut_valid}),
    .stAddr_ready ({store1_addrOut_ready}),
    .stData ({store1_dataToMem}),
    .stData_valid ({store1_dataToMem_valid}),
    .stData_ready ({store1_dataToMem_ready}),
    .ctrlEnd_valid (fork17_outs_2_valid),
    .ctrlEnd_ready (fork17_outs_2_ready),
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

  mem_controller #(.NUM_CONTROLS(1), .NUM_LOADS(1), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller8(
    .loadData (s_loadData),
    .memStart_valid (s_start_valid),
    .memStart_ready (s_start_ready),
    .ctrl ({extsi6_outs}),
    .ctrl_valid ({extsi6_outs_valid}),
    .ctrl_ready ({extsi6_outs_ready}),
    .ldAddr ({load2_addrOut}),
    .ldAddr_valid ({load2_addrOut_valid}),
    .ldAddr_ready ({load2_addrOut_ready}),
    .stAddr ({store0_addrOut}),
    .stAddr_valid ({store0_addrOut_valid}),
    .stAddr_ready ({store0_addrOut_ready}),
    .stData ({store0_dataToMem}),
    .stData_valid ({store0_dataToMem_valid}),
    .stData_ready ({store0_dataToMem_ready}),
    .ctrlEnd_valid (fork17_outs_1_valid),
    .ctrlEnd_ready (fork17_outs_1_ready),
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

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller9(
    .loadData (a_loadData),
    .memStart_valid (a_start_valid),
    .memStart_ready (a_start_ready),
    .ldAddr ({load1_addrOut}),
    .ldAddr_valid ({load1_addrOut_valid}),
    .ldAddr_ready ({load1_addrOut_ready}),
    .ctrlEnd_valid (fork17_outs_0_valid),
    .ctrlEnd_ready (fork17_outs_0_ready),
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

  handshake_constant_0 #(.DATA_WIDTH(1)) constant11(
    .ctrl_valid (fork0_outs_0_valid),
    .ctrl_ready (fork0_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant11_outs),
    .outs_valid (constant11_outs_valid),
    .outs_ready (constant11_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi14(
    .ins (constant11_outs),
    .ins_valid (constant11_outs_valid),
    .ins_ready (constant11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi14_outs),
    .outs_valid (extsi14_outs_valid),
    .outs_ready (extsi14_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux0(
    .index (control_merge0_index),
    .index_valid (control_merge0_index_valid),
    .index_ready (control_merge0_index_ready),
    .ins ({cond_br6_trueOut, extsi14_outs}),
    .ins_valid ({cond_br6_trueOut_valid, extsi14_outs_valid}),
    .ins_ready ({cond_br6_trueOut_ready, extsi14_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux0_outs),
    .outs_valid (mux0_outs_valid),
    .outs_ready (mux0_outs_ready)
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

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork1(
    .ins (buffer1_outs),
    .ins_valid (buffer1_outs_valid),
    .ins_ready (buffer1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork1_outs_1, fork1_outs_0}),
    .outs_valid ({fork1_outs_1_valid, fork1_outs_0_valid}),
    .outs_ready ({fork1_outs_1_ready, fork1_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci2(
    .ins (fork1_outs_0),
    .ins_valid (fork1_outs_0_valid),
    .ins_ready (fork1_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci2_outs),
    .outs_valid (trunci2_outs_valid),
    .outs_ready (trunci2_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .ins_valid ({cond_br7_trueOut_valid, fork0_outs_2_valid}),
    .ins_ready ({cond_br7_trueOut_ready, fork0_outs_2_ready}),
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

  fork_dataless #(.SIZE(2)) fork2(
    .ins_valid (buffer3_outs_valid),
    .ins_ready (buffer3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork2_outs_1_valid, fork2_outs_0_valid}),
    .outs_ready ({fork2_outs_1_ready, fork2_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant12(
    .ctrl_valid (fork2_outs_0_valid),
    .ctrl_ready (fork2_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant12_outs),
    .outs_valid (constant12_outs_valid),
    .outs_ready (constant12_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load0(
    .addrIn (trunci2_outs),
    .addrIn_valid (trunci2_outs_valid),
    .addrIn_ready (trunci2_outs_ready),
    .dataFromMem (mem_controller7_ldData_0),
    .dataFromMem_valid (mem_controller7_ldData_0_valid),
    .dataFromMem_ready (mem_controller7_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load0_addrOut),
    .addrOut_valid (load0_addrOut_valid),
    .addrOut_ready (load0_addrOut_ready),
    .dataOut (load0_dataOut),
    .dataOut_valid (load0_dataOut_valid),
    .dataOut_ready (load0_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi13(
    .ins (constant12_outs),
    .ins_valid (constant12_outs_valid),
    .ins_ready (constant12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi13_outs),
    .outs_valid (extsi13_outs_valid),
    .outs_ready (extsi13_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux1(
    .index (fork6_outs_1),
    .index_valid (fork6_outs_1_valid),
    .index_ready (fork6_outs_1_ready),
    .ins ({cond_br2_trueOut, extsi13_outs}),
    .ins_valid ({cond_br2_trueOut_valid, extsi13_outs_valid}),
    .ins_ready ({cond_br2_trueOut_ready, extsi13_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux1_outs),
    .outs_valid (mux1_outs_valid),
    .outs_ready (mux1_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer4(
    .ins (mux1_outs),
    .ins_valid (mux1_outs_valid),
    .ins_ready (mux1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer4_outs),
    .outs_valid (buffer4_outs_valid),
    .outs_ready (buffer4_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer5(
    .ins (buffer4_outs),
    .ins_valid (buffer4_outs_valid),
    .ins_ready (buffer4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer5_outs),
    .outs_valid (buffer5_outs_valid),
    .outs_ready (buffer5_outs_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(5)) fork3(
    .ins (buffer5_outs),
    .ins_valid (buffer5_outs_valid),
    .ins_ready (buffer5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork3_outs_4, fork3_outs_3, fork3_outs_2, fork3_outs_1, fork3_outs_0}),
    .outs_valid ({fork3_outs_4_valid, fork3_outs_3_valid, fork3_outs_2_valid, fork3_outs_1_valid, fork3_outs_0_valid}),
    .outs_ready ({fork3_outs_4_ready, fork3_outs_3_ready, fork3_outs_2_ready, fork3_outs_1_ready, fork3_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi15(
    .ins (fork3_outs_0),
    .ins_valid (fork3_outs_0_valid),
    .ins_ready (fork3_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi15_outs),
    .outs_valid (extsi15_outs_valid),
    .outs_ready (extsi15_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi16(
    .ins (fork3_outs_4),
    .ins_valid (fork3_outs_4_valid),
    .ins_ready (fork3_outs_4_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi16_outs),
    .outs_valid (extsi16_outs_valid),
    .outs_ready (extsi16_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci3(
    .ins (fork3_outs_1),
    .ins_valid (fork3_outs_1_valid),
    .ins_ready (fork3_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci3_outs),
    .outs_valid (trunci3_outs_valid),
    .outs_ready (trunci3_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci4(
    .ins (fork3_outs_2),
    .ins_valid (fork3_outs_2_valid),
    .ins_ready (fork3_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci4_outs),
    .outs_valid (trunci4_outs_valid),
    .outs_ready (trunci4_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci5(
    .ins (fork3_outs_3),
    .ins_valid (fork3_outs_3_valid),
    .ins_ready (fork3_outs_3_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci5_outs),
    .outs_valid (trunci5_outs_valid),
    .outs_ready (trunci5_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux2(
    .index (fork6_outs_2),
    .index_valid (fork6_outs_2_valid),
    .index_ready (fork6_outs_2_ready),
    .ins ({cond_br3_trueOut, load0_dataOut}),
    .ins_valid ({cond_br3_trueOut_valid, load0_dataOut_valid}),
    .ins_ready ({cond_br3_trueOut_ready, load0_dataOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux2_outs),
    .outs_valid (mux2_outs_valid),
    .outs_ready (mux2_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux3(
    .index (fork6_outs_0),
    .index_valid (fork6_outs_0_valid),
    .index_ready (fork6_outs_0_ready),
    .ins ({cond_br4_trueOut, fork1_outs_1}),
    .ins_valid ({cond_br4_trueOut_valid, fork1_outs_1_valid}),
    .ins_ready ({cond_br4_trueOut_ready, fork1_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux3_outs),
    .outs_valid (mux3_outs_valid),
    .outs_ready (mux3_outs_ready)
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

  fork_type #(.SIZE(3), .DATA_TYPE(5)) fork4(
    .ins (buffer9_outs),
    .ins_valid (buffer9_outs_valid),
    .ins_ready (buffer9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork4_outs_2, fork4_outs_1, fork4_outs_0}),
    .outs_valid ({fork4_outs_2_valid, fork4_outs_1_valid, fork4_outs_0_valid}),
    .outs_ready ({fork4_outs_2_ready, fork4_outs_1_ready, fork4_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi17(
    .ins (fork4_outs_2),
    .ins_valid (fork4_outs_2_valid),
    .ins_ready (fork4_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi17_outs),
    .outs_valid (extsi17_outs_valid),
    .outs_ready (extsi17_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork5(
    .ins (extsi17_outs),
    .ins_valid (extsi17_outs_valid),
    .ins_ready (extsi17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork5_outs_1, fork5_outs_0}),
    .outs_valid ({fork5_outs_1_valid, fork5_outs_0_valid}),
    .outs_ready ({fork5_outs_1_ready, fork5_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci6(
    .ins (fork4_outs_0),
    .ins_valid (fork4_outs_0_valid),
    .ins_ready (fork4_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci6_outs),
    .outs_valid (trunci6_outs_valid),
    .outs_ready (trunci6_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge1(
    .ins_valid ({cond_br5_trueOut_valid, fork2_outs_1_valid}),
    .ins_ready ({cond_br5_trueOut_ready, fork2_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge1_outs_valid),
    .outs_ready (control_merge1_outs_ready),
    .index (control_merge1_index),
    .index_valid (control_merge1_index_valid),
    .index_ready (control_merge1_index_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork6(
    .ins (control_merge1_index),
    .ins_valid (control_merge1_index_valid),
    .ins_ready (control_merge1_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork6_outs_2, fork6_outs_1, fork6_outs_0}),
    .outs_valid ({fork6_outs_2_valid, fork6_outs_1_valid, fork6_outs_0_valid}),
    .outs_ready ({fork6_outs_2_ready, fork6_outs_1_ready, fork6_outs_0_ready})
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

  fork_dataless #(.SIZE(2)) fork7(
    .ins_valid (buffer11_outs_valid),
    .ins_ready (buffer11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork7_outs_1_valid, fork7_outs_0_valid}),
    .outs_ready ({fork7_outs_1_ready, fork7_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant13(
    .ctrl_valid (fork7_outs_0_valid),
    .ctrl_ready (fork7_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant13_outs),
    .outs_valid (constant13_outs_valid),
    .outs_ready (constant13_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi6(
    .ins (constant13_outs),
    .ins_valid (constant13_outs_valid),
    .ins_ready (constant13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi6_outs),
    .outs_valid (extsi6_outs_valid),
    .outs_ready (extsi6_outs_ready)
  );

  source source0(
    .clk (clk),
    .rst (rst),
    .outs_valid (source0_outs_valid),
    .outs_ready (source0_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant14(
    .ctrl_valid (source0_outs_valid),
    .ctrl_ready (source0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant14_outs),
    .outs_valid (constant14_outs_valid),
    .outs_ready (constant14_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi18(
    .ins (constant14_outs),
    .ins_valid (constant14_outs_valid),
    .ins_ready (constant14_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi18_outs),
    .outs_valid (extsi18_outs_valid),
    .outs_ready (extsi18_outs_ready)
  );

  source source1(
    .clk (clk),
    .rst (rst),
    .outs_valid (source1_outs_valid),
    .outs_ready (source1_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant15(
    .ctrl_valid (source1_outs_valid),
    .ctrl_ready (source1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant15_outs),
    .outs_valid (constant15_outs_valid),
    .outs_ready (constant15_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork8(
    .ins (constant15_outs),
    .ins_valid (constant15_outs_valid),
    .ins_ready (constant15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork8_outs_1, fork8_outs_0}),
    .outs_valid ({fork8_outs_1_valid, fork8_outs_0_valid}),
    .outs_ready ({fork8_outs_1_ready, fork8_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi19(
    .ins (fork8_outs_0),
    .ins_valid (fork8_outs_0_valid),
    .ins_ready (fork8_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi19_outs),
    .outs_valid (extsi19_outs_valid),
    .outs_ready (extsi19_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi8(
    .ins (fork8_outs_1),
    .ins_valid (fork8_outs_1_valid),
    .ins_ready (fork8_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi8_outs),
    .outs_valid (extsi8_outs_valid),
    .outs_ready (extsi8_outs_ready)
  );

  source source2(
    .clk (clk),
    .rst (rst),
    .outs_valid (source2_outs_valid),
    .outs_ready (source2_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant16(
    .ctrl_valid (source2_outs_valid),
    .ctrl_ready (source2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant16_outs),
    .outs_valid (constant16_outs_valid),
    .outs_ready (constant16_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi9(
    .ins (constant16_outs),
    .ins_valid (constant16_outs_valid),
    .ins_ready (constant16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi9_outs),
    .outs_valid (extsi9_outs_valid),
    .outs_ready (extsi9_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli0(
    .lhs (fork5_outs_0),
    .lhs_valid (fork5_outs_0_valid),
    .lhs_ready (fork5_outs_0_ready),
    .rhs (extsi8_outs),
    .rhs_valid (extsi8_outs_valid),
    .rhs_ready (extsi8_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli0_result),
    .result_valid (shli0_result_valid),
    .result_ready (shli0_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci7(
    .ins (shli0_result),
    .ins_valid (shli0_result_valid),
    .ins_ready (shli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci7_outs),
    .outs_valid (trunci7_outs_valid),
    .outs_ready (trunci7_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli1(
    .lhs (fork5_outs_1),
    .lhs_valid (fork5_outs_1_valid),
    .lhs_ready (fork5_outs_1_ready),
    .rhs (extsi9_outs),
    .rhs_valid (extsi9_outs_valid),
    .rhs_ready (extsi9_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli1_result),
    .result_valid (shli1_result_valid),
    .result_ready (shli1_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci8(
    .ins (shli1_result),
    .ins_valid (shli1_result_valid),
    .ins_ready (shli1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci8_outs),
    .outs_valid (trunci8_outs_valid),
    .outs_ready (trunci8_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi5(
    .lhs (trunci7_outs),
    .lhs_valid (trunci7_outs_valid),
    .lhs_ready (trunci7_outs_ready),
    .rhs (trunci8_outs),
    .rhs_valid (trunci8_outs_valid),
    .rhs_ready (trunci8_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi5_result),
    .result_valid (addi5_result_valid),
    .result_ready (addi5_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi2(
    .lhs (extsi15_outs),
    .lhs_valid (extsi15_outs_valid),
    .lhs_ready (extsi15_outs_ready),
    .rhs (addi5_result),
    .rhs_valid (addi5_result_valid),
    .rhs_ready (addi5_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi2_result),
    .result_valid (addi2_result_valid),
    .result_ready (addi2_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load1(
    .addrIn (addi2_result),
    .addrIn_valid (addi2_result_valid),
    .addrIn_ready (addi2_result_ready),
    .dataFromMem (mem_controller9_ldData_0),
    .dataFromMem_valid (mem_controller9_ldData_0_valid),
    .dataFromMem_ready (mem_controller9_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load1_addrOut),
    .addrOut_valid (load1_addrOut_valid),
    .addrOut_ready (load1_addrOut_ready),
    .dataOut (load1_dataOut),
    .dataOut_valid (load1_dataOut_valid),
    .dataOut_ready (load1_dataOut_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork9(
    .ins (load1_dataOut),
    .ins_valid (load1_dataOut_valid),
    .ins_ready (load1_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork9_outs_1, fork9_outs_0}),
    .outs_valid ({fork9_outs_1_valid, fork9_outs_0_valid}),
    .outs_ready ({fork9_outs_1_ready, fork9_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi20(
    .ins (fork9_outs_0),
    .ins_valid (fork9_outs_0_valid),
    .ins_ready (fork9_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi20_outs),
    .outs_valid (extsi20_outs_valid),
    .outs_ready (extsi20_outs_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi21(
    .ins (fork9_outs_1),
    .ins_valid (fork9_outs_1_valid),
    .ins_ready (fork9_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi21_outs),
    .outs_valid (extsi21_outs_valid),
    .outs_ready (extsi21_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load2(
    .addrIn (trunci5_outs),
    .addrIn_valid (trunci5_outs_valid),
    .addrIn_ready (trunci5_outs_ready),
    .dataFromMem (mem_controller8_ldData_0),
    .dataFromMem_valid (mem_controller8_ldData_0_valid),
    .dataFromMem_ready (mem_controller8_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load2_addrOut),
    .addrOut_valid (load2_addrOut_valid),
    .addrOut_ready (load2_addrOut_ready),
    .dataOut (load2_dataOut),
    .dataOut_valid (load2_dataOut_valid),
    .dataOut_ready (load2_dataOut_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load3(
    .addrIn (trunci6_outs),
    .addrIn_valid (trunci6_outs_valid),
    .addrIn_ready (trunci6_outs_ready),
    .dataFromMem (mem_controller5_ldData_0),
    .dataFromMem_valid (mem_controller5_ldData_0_valid),
    .dataFromMem_ready (mem_controller5_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load3_addrOut),
    .addrOut_valid (load3_addrOut_valid),
    .addrOut_ready (load3_addrOut_ready),
    .dataOut (load3_dataOut),
    .dataOut_valid (load3_dataOut_valid),
    .dataOut_ready (load3_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi22(
    .ins (load3_dataOut),
    .ins_valid (load3_dataOut_valid),
    .ins_ready (load3_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi22_outs),
    .outs_valid (extsi22_outs_valid),
    .outs_ready (extsi22_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli0(
    .lhs (extsi22_outs),
    .lhs_valid (extsi22_outs_valid),
    .lhs_ready (extsi22_outs_ready),
    .rhs (extsi20_outs),
    .rhs_valid (extsi20_outs_valid),
    .rhs_ready (extsi20_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli0_result),
    .result_valid (muli0_result_valid),
    .result_ready (muli0_result_ready)
  );

  trunci #(.INPUT_TYPE(16), .OUTPUT_TYPE(8)) trunci9(
    .ins (muli0_result),
    .ins_valid (muli0_result_valid),
    .ins_ready (muli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci9_outs),
    .outs_valid (trunci9_outs_valid),
    .outs_ready (trunci9_outs_ready)
  );

  addi #(.DATA_TYPE(8)) addi0(
    .lhs (load2_dataOut),
    .lhs_valid (load2_dataOut_valid),
    .lhs_ready (load2_dataOut_ready),
    .rhs (trunci9_outs),
    .rhs_valid (trunci9_outs_valid),
    .rhs_ready (trunci9_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi0_result),
    .result_valid (addi0_result_valid),
    .result_ready (addi0_result_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(4)) store0(
    .addrIn (trunci4_outs),
    .addrIn_valid (trunci4_outs_valid),
    .addrIn_ready (trunci4_outs_ready),
    .dataIn (addi0_result),
    .dataIn_valid (addi0_result_valid),
    .dataIn_ready (addi0_result_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store0_addrOut),
    .addrOut_valid (store0_addrOut_valid),
    .addrOut_ready (store0_addrOut_ready),
    .dataToMem (store0_dataToMem),
    .dataToMem_valid (store0_dataToMem_valid),
    .dataToMem_ready (store0_dataToMem_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load4(
    .addrIn (trunci3_outs),
    .addrIn_valid (trunci3_outs_valid),
    .addrIn_ready (trunci3_outs_ready),
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

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi23(
    .ins (load4_dataOut),
    .ins_valid (load4_dataOut_valid),
    .ins_ready (load4_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi23_outs),
    .outs_valid (extsi23_outs_valid),
    .outs_ready (extsi23_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli1(
    .lhs (extsi21_outs),
    .lhs_valid (extsi21_outs_valid),
    .lhs_ready (extsi21_outs_ready),
    .rhs (extsi23_outs),
    .rhs_valid (extsi23_outs_valid),
    .rhs_ready (extsi23_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli1_result),
    .result_valid (muli1_result_valid),
    .result_ready (muli1_result_ready)
  );

  trunci #(.INPUT_TYPE(16), .OUTPUT_TYPE(8)) trunci1(
    .ins (muli1_result),
    .ins_valid (muli1_result_valid),
    .ins_ready (muli1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci1_outs),
    .outs_valid (trunci1_outs_valid),
    .outs_ready (trunci1_outs_ready)
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

  addi #(.DATA_TYPE(8)) addi1(
    .lhs (buffer7_outs),
    .lhs_valid (buffer7_outs_valid),
    .lhs_ready (buffer7_outs_ready),
    .rhs (trunci1_outs),
    .rhs_valid (trunci1_outs_valid),
    .rhs_ready (trunci1_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi1_result),
    .result_valid (addi1_result_valid),
    .result_ready (addi1_result_ready)
  );

  addi #(.DATA_TYPE(6)) addi3(
    .lhs (extsi16_outs),
    .lhs_valid (extsi16_outs_valid),
    .lhs_ready (extsi16_outs_ready),
    .rhs (extsi19_outs),
    .rhs_valid (extsi19_outs_valid),
    .rhs_ready (extsi19_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi3_result),
    .result_valid (addi3_result_valid),
    .result_ready (addi3_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork10(
    .ins (addi3_result),
    .ins_valid (addi3_result_valid),
    .ins_ready (addi3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork10_outs_1, fork10_outs_0}),
    .outs_valid ({fork10_outs_1_valid, fork10_outs_0_valid}),
    .outs_ready ({fork10_outs_1_ready, fork10_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci10(
    .ins (fork10_outs_0),
    .ins_valid (fork10_outs_0_valid),
    .ins_ready (fork10_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci10_outs),
    .outs_valid (trunci10_outs_valid),
    .outs_ready (trunci10_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi0(
    .lhs (fork10_outs_1),
    .lhs_valid (fork10_outs_1_valid),
    .lhs_ready (fork10_outs_1_ready),
    .rhs (extsi18_outs),
    .rhs_valid (extsi18_outs_valid),
    .rhs_ready (extsi18_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi0_result),
    .result_valid (cmpi0_result_valid),
    .result_ready (cmpi0_result_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork11(
    .ins (cmpi0_result),
    .ins_valid (cmpi0_result_valid),
    .ins_ready (cmpi0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork11_outs_3, fork11_outs_2, fork11_outs_1, fork11_outs_0}),
    .outs_valid ({fork11_outs_3_valid, fork11_outs_2_valid, fork11_outs_1_valid, fork11_outs_0_valid}),
    .outs_ready ({fork11_outs_3_ready, fork11_outs_2_ready, fork11_outs_1_ready, fork11_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br2(
    .condition (fork11_outs_0),
    .condition_valid (fork11_outs_0_valid),
    .condition_ready (fork11_outs_0_ready),
    .data (trunci10_outs),
    .data_valid (trunci10_outs_valid),
    .data_ready (trunci10_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br2_trueOut),
    .trueOut_valid (cond_br2_trueOut_valid),
    .trueOut_ready (cond_br2_trueOut_ready),
    .falseOut (cond_br2_falseOut),
    .falseOut_valid (cond_br2_falseOut_valid),
    .falseOut_ready (cond_br2_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink0(
    .ins (cond_br2_falseOut),
    .ins_valid (cond_br2_falseOut_valid),
    .ins_ready (cond_br2_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(8)) cond_br3(
    .condition (fork11_outs_2),
    .condition_valid (fork11_outs_2_valid),
    .condition_ready (fork11_outs_2_ready),
    .data (addi1_result),
    .data_valid (addi1_result_valid),
    .data_ready (addi1_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br3_trueOut),
    .trueOut_valid (cond_br3_trueOut_valid),
    .trueOut_ready (cond_br3_trueOut_ready),
    .falseOut (cond_br3_falseOut),
    .falseOut_valid (cond_br3_falseOut_valid),
    .falseOut_ready (cond_br3_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br4(
    .condition (fork11_outs_1),
    .condition_valid (fork11_outs_1_valid),
    .condition_ready (fork11_outs_1_ready),
    .data (fork4_outs_1),
    .data_valid (fork4_outs_1_valid),
    .data_ready (fork4_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br4_trueOut),
    .trueOut_valid (cond_br4_trueOut_valid),
    .trueOut_ready (cond_br4_trueOut_ready),
    .falseOut (cond_br4_falseOut),
    .falseOut_valid (cond_br4_falseOut_valid),
    .falseOut_ready (cond_br4_falseOut_ready)
  );

  cond_br_dataless cond_br5(
    .condition (fork11_outs_3),
    .condition_valid (fork11_outs_3_valid),
    .condition_ready (fork11_outs_3_ready),
    .data_valid (fork7_outs_1_valid),
    .data_ready (fork7_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br5_trueOut_valid),
    .trueOut_ready (cond_br5_trueOut_ready),
    .falseOut_valid (cond_br5_falseOut_valid),
    .falseOut_ready (cond_br5_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer12(
    .ins (cond_br4_falseOut),
    .ins_valid (cond_br4_falseOut_valid),
    .ins_ready (cond_br4_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer12_outs),
    .outs_valid (buffer12_outs_valid),
    .outs_ready (buffer12_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer13(
    .ins (buffer12_outs),
    .ins_valid (buffer12_outs_valid),
    .ins_ready (buffer12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer13_outs),
    .outs_valid (buffer13_outs_valid),
    .outs_ready (buffer13_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork12(
    .ins (buffer13_outs),
    .ins_valid (buffer13_outs_valid),
    .ins_ready (buffer13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork12_outs_1, fork12_outs_0}),
    .outs_valid ({fork12_outs_1_valid, fork12_outs_0_valid}),
    .outs_ready ({fork12_outs_1_ready, fork12_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi24(
    .ins (fork12_outs_1),
    .ins_valid (fork12_outs_1_valid),
    .ins_ready (fork12_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi24_outs),
    .outs_valid (extsi24_outs_valid),
    .outs_ready (extsi24_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci11(
    .ins (fork12_outs_0),
    .ins_valid (fork12_outs_0_valid),
    .ins_ready (fork12_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci11_outs),
    .outs_valid (trunci11_outs_valid),
    .outs_ready (trunci11_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer14(
    .ins (cond_br3_falseOut),
    .ins_valid (cond_br3_falseOut_valid),
    .ins_ready (cond_br3_falseOut_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork13(
    .ins (buffer15_outs),
    .ins_valid (buffer15_outs_valid),
    .ins_ready (buffer15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork13_outs_1, fork13_outs_0}),
    .outs_valid ({fork13_outs_1_valid, fork13_outs_0_valid}),
    .outs_ready ({fork13_outs_1_ready, fork13_outs_0_ready})
  );

  oehb_dataless buffer16(
    .ins_valid (cond_br5_falseOut_valid),
    .ins_ready (cond_br5_falseOut_ready),
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

  fork_dataless #(.SIZE(2)) fork14(
    .ins_valid (buffer17_outs_valid),
    .ins_ready (buffer17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork14_outs_1_valid, fork14_outs_0_valid}),
    .outs_ready ({fork14_outs_1_ready, fork14_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant17(
    .ctrl_valid (fork14_outs_0_valid),
    .ctrl_ready (fork14_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant17_outs),
    .outs_valid (constant17_outs_valid),
    .outs_ready (constant17_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi10(
    .ins (constant17_outs),
    .ins_valid (constant17_outs_valid),
    .ins_ready (constant17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi10_outs),
    .outs_valid (extsi10_outs_valid),
    .outs_ready (extsi10_outs_ready)
  );

  source source3(
    .clk (clk),
    .rst (rst),
    .outs_valid (source3_outs_valid),
    .outs_ready (source3_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant18(
    .ctrl_valid (source3_outs_valid),
    .ctrl_ready (source3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant18_outs),
    .outs_valid (constant18_outs_valid),
    .outs_ready (constant18_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi25(
    .ins (constant18_outs),
    .ins_valid (constant18_outs_valid),
    .ins_ready (constant18_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi25_outs),
    .outs_valid (extsi25_outs_valid),
    .outs_ready (extsi25_outs_ready)
  );

  source source4(
    .clk (clk),
    .rst (rst),
    .outs_valid (source4_outs_valid),
    .outs_ready (source4_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant19(
    .ctrl_valid (source4_outs_valid),
    .ctrl_ready (source4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant19_outs),
    .outs_valid (constant19_outs_valid),
    .outs_ready (constant19_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi26(
    .ins (constant19_outs),
    .ins_valid (constant19_outs_valid),
    .ins_ready (constant19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi26_outs),
    .outs_valid (extsi26_outs_valid),
    .outs_ready (extsi26_outs_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(4)) store1(
    .addrIn (trunci11_outs),
    .addrIn_valid (trunci11_outs_valid),
    .addrIn_ready (trunci11_outs_ready),
    .dataIn (fork13_outs_0),
    .dataIn_valid (fork13_outs_0_valid),
    .dataIn_ready (fork13_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store1_addrOut),
    .addrOut_valid (store1_addrOut_valid),
    .addrOut_ready (store1_addrOut_ready),
    .dataToMem (store1_dataToMem),
    .dataToMem_valid (store1_dataToMem_valid),
    .dataToMem_ready (store1_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi4(
    .lhs (extsi24_outs),
    .lhs_valid (extsi24_outs_valid),
    .lhs_ready (extsi24_outs_ready),
    .rhs (extsi26_outs),
    .rhs_valid (extsi26_outs_valid),
    .rhs_ready (extsi26_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi4_result),
    .result_valid (addi4_result_valid),
    .result_ready (addi4_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork15(
    .ins (addi4_result),
    .ins_valid (addi4_result_valid),
    .ins_ready (addi4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork15_outs_1, fork15_outs_0}),
    .outs_valid ({fork15_outs_1_valid, fork15_outs_0_valid}),
    .outs_ready ({fork15_outs_1_ready, fork15_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci12(
    .ins (fork15_outs_0),
    .ins_valid (fork15_outs_0_valid),
    .ins_ready (fork15_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci12_outs),
    .outs_valid (trunci12_outs_valid),
    .outs_ready (trunci12_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi1(
    .lhs (fork15_outs_1),
    .lhs_valid (fork15_outs_1_valid),
    .lhs_ready (fork15_outs_1_ready),
    .rhs (extsi25_outs),
    .rhs_valid (extsi25_outs_valid),
    .rhs_ready (extsi25_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi1_result),
    .result_valid (cmpi1_result_valid),
    .result_ready (cmpi1_result_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork16(
    .ins (cmpi1_result),
    .ins_valid (cmpi1_result_valid),
    .ins_ready (cmpi1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork16_outs_2, fork16_outs_1, fork16_outs_0}),
    .outs_valid ({fork16_outs_2_valid, fork16_outs_1_valid, fork16_outs_0_valid}),
    .outs_ready ({fork16_outs_2_ready, fork16_outs_1_ready, fork16_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br6(
    .condition (fork16_outs_0),
    .condition_valid (fork16_outs_0_valid),
    .condition_ready (fork16_outs_0_ready),
    .data (trunci12_outs),
    .data_valid (trunci12_outs_valid),
    .data_ready (trunci12_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br6_trueOut),
    .trueOut_valid (cond_br6_trueOut_valid),
    .trueOut_ready (cond_br6_trueOut_ready),
    .falseOut (cond_br6_falseOut),
    .falseOut_valid (cond_br6_falseOut_valid),
    .falseOut_ready (cond_br6_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink2(
    .ins (cond_br6_falseOut),
    .ins_valid (cond_br6_falseOut_valid),
    .ins_ready (cond_br6_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br_dataless cond_br7(
    .condition (fork16_outs_1),
    .condition_valid (fork16_outs_1_valid),
    .condition_ready (fork16_outs_1_ready),
    .data_valid (fork14_outs_1_valid),
    .data_ready (fork14_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br7_trueOut_valid),
    .trueOut_ready (cond_br7_trueOut_ready),
    .falseOut_valid (cond_br7_falseOut_valid),
    .falseOut_ready (cond_br7_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br8(
    .condition (fork16_outs_2),
    .condition_valid (fork16_outs_2_valid),
    .condition_ready (fork16_outs_2_ready),
    .data (fork13_outs_1),
    .data_valid (fork13_outs_1_valid),
    .data_ready (fork13_outs_1_ready),
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
    .ins (cond_br8_trueOut),
    .ins_valid (cond_br8_trueOut_valid),
    .ins_ready (cond_br8_trueOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb_dataless buffer20(
    .ins_valid (cond_br7_falseOut_valid),
    .ins_ready (cond_br7_falseOut_ready),
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

  fork_dataless #(.SIZE(5)) fork17(
    .ins_valid (buffer21_outs_valid),
    .ins_ready (buffer21_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork17_outs_4_valid, fork17_outs_3_valid, fork17_outs_2_valid, fork17_outs_1_valid, fork17_outs_0_valid}),
    .outs_ready ({fork17_outs_4_ready, fork17_outs_3_ready, fork17_outs_2_ready, fork17_outs_1_ready, fork17_outs_0_ready})
  );

  oehb #(.DATA_TYPE(8)) buffer18(
    .ins (cond_br8_falseOut),
    .ins_valid (cond_br8_falseOut_valid),
    .ins_ready (cond_br8_falseOut_ready),
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

endmodule
