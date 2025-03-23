module gemver(
  input [7:0] alpha,
  input  alpha_valid,
  input [7:0] beta,
  input  beta_valid,
  input [7:0] u1_loadData,
  input [7:0] v1_loadData,
  input [7:0] u2_loadData,
  input [7:0] v2_loadData,
  input [7:0] y_loadData,
  input [7:0] z_loadData,
  input [7:0] a_loadData,
  input [7:0] w_loadData,
  input [7:0] x_loadData,
  input  u1_start_valid,
  input  v1_start_valid,
  input  u2_start_valid,
  input  v2_start_valid,
  input  y_start_valid,
  input  z_start_valid,
  input  a_start_valid,
  input  w_start_valid,
  input  x_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  u1_end_ready,
  input  v1_end_ready,
  input  u2_end_ready,
  input  v2_end_ready,
  input  y_end_ready,
  input  z_end_ready,
  input  a_end_ready,
  input  w_end_ready,
  input  x_end_ready,
  input  end_ready,
  output  alpha_ready,
  output  beta_ready,
  output  u1_start_ready,
  output  v1_start_ready,
  output  u2_start_ready,
  output  v2_start_ready,
  output  y_start_ready,
  output  z_start_ready,
  output  a_start_ready,
  output  w_start_ready,
  output  x_start_ready,
  output  start_ready,
  output  u1_end_valid,
  output  v1_end_valid,
  output  u2_end_valid,
  output  v2_end_valid,
  output  y_end_valid,
  output  z_end_valid,
  output  a_end_valid,
  output  w_end_valid,
  output  x_end_valid,
  output  end_valid,
  output  u1_loadEn,
  output [3:0] u1_loadAddr,
  output  u1_storeEn,
  output [3:0] u1_storeAddr,
  output [7:0] u1_storeData,
  output  v1_loadEn,
  output [3:0] v1_loadAddr,
  output  v1_storeEn,
  output [3:0] v1_storeAddr,
  output [7:0] v1_storeData,
  output  u2_loadEn,
  output [3:0] u2_loadAddr,
  output  u2_storeEn,
  output [3:0] u2_storeAddr,
  output [7:0] u2_storeData,
  output  v2_loadEn,
  output [3:0] v2_loadAddr,
  output  v2_storeEn,
  output [3:0] v2_storeAddr,
  output [7:0] v2_storeData,
  output  y_loadEn,
  output [3:0] y_loadAddr,
  output  y_storeEn,
  output [3:0] y_storeAddr,
  output [7:0] y_storeData,
  output  z_loadEn,
  output [3:0] z_loadAddr,
  output  z_storeEn,
  output [3:0] z_storeAddr,
  output [7:0] z_storeData,
  output  a_loadEn,
  output [6:0] a_loadAddr,
  output  a_storeEn,
  output [6:0] a_storeAddr,
  output [7:0] a_storeData,
  output  w_loadEn,
  output [3:0] w_loadAddr,
  output  w_storeEn,
  output [3:0] w_storeAddr,
  output [7:0] w_storeData,
  output  x_loadEn,
  output [3:0] x_loadAddr,
  output  x_storeEn,
  output [3:0] x_storeAddr,
  output [7:0] x_storeData
);
  wire  fork0_outs_0_valid;
  wire  fork0_outs_0_ready;
  wire  fork0_outs_1_valid;
  wire  fork0_outs_1_ready;
  wire  fork0_outs_2_valid;
  wire  fork0_outs_2_ready;
  wire [7:0] mem_controller9_ldData_0;
  wire  mem_controller9_ldData_0_valid;
  wire  mem_controller9_ldData_0_ready;
  wire [7:0] mem_controller9_ldData_1;
  wire  mem_controller9_ldData_1_valid;
  wire  mem_controller9_ldData_1_ready;
  wire [7:0] mem_controller9_ldData_2;
  wire  mem_controller9_ldData_2_valid;
  wire  mem_controller9_ldData_2_ready;
  wire  mem_controller9_memEnd_valid;
  wire  mem_controller9_memEnd_ready;
  wire  mem_controller9_loadEn;
  wire [3:0] mem_controller9_loadAddr;
  wire  mem_controller9_storeEn;
  wire [3:0] mem_controller9_storeAddr;
  wire [7:0] mem_controller9_storeData;
  wire [7:0] mem_controller10_ldData_0;
  wire  mem_controller10_ldData_0_valid;
  wire  mem_controller10_ldData_0_ready;
  wire  mem_controller10_memEnd_valid;
  wire  mem_controller10_memEnd_ready;
  wire  mem_controller10_loadEn;
  wire [3:0] mem_controller10_loadAddr;
  wire  mem_controller10_storeEn;
  wire [3:0] mem_controller10_storeAddr;
  wire [7:0] mem_controller10_storeData;
  wire [7:0] mem_controller11_ldData_0;
  wire  mem_controller11_ldData_0_valid;
  wire  mem_controller11_ldData_0_ready;
  wire [7:0] mem_controller11_ldData_1;
  wire  mem_controller11_ldData_1_valid;
  wire  mem_controller11_ldData_1_ready;
  wire [7:0] mem_controller11_ldData_2;
  wire  mem_controller11_ldData_2_valid;
  wire  mem_controller11_ldData_2_ready;
  wire  mem_controller11_memEnd_valid;
  wire  mem_controller11_memEnd_ready;
  wire  mem_controller11_loadEn;
  wire [6:0] mem_controller11_loadAddr;
  wire  mem_controller11_storeEn;
  wire [6:0] mem_controller11_storeAddr;
  wire [7:0] mem_controller11_storeData;
  wire [7:0] mem_controller12_ldData_0;
  wire  mem_controller12_ldData_0_valid;
  wire  mem_controller12_ldData_0_ready;
  wire  mem_controller12_memEnd_valid;
  wire  mem_controller12_memEnd_ready;
  wire  mem_controller12_loadEn;
  wire [3:0] mem_controller12_loadAddr;
  wire  mem_controller12_storeEn;
  wire [3:0] mem_controller12_storeAddr;
  wire [7:0] mem_controller12_storeData;
  wire [7:0] mem_controller13_ldData_0;
  wire  mem_controller13_ldData_0_valid;
  wire  mem_controller13_ldData_0_ready;
  wire  mem_controller13_memEnd_valid;
  wire  mem_controller13_memEnd_ready;
  wire  mem_controller13_loadEn;
  wire [3:0] mem_controller13_loadAddr;
  wire  mem_controller13_storeEn;
  wire [3:0] mem_controller13_storeAddr;
  wire [7:0] mem_controller13_storeData;
  wire [7:0] mem_controller14_ldData_0;
  wire  mem_controller14_ldData_0_valid;
  wire  mem_controller14_ldData_0_ready;
  wire  mem_controller14_memEnd_valid;
  wire  mem_controller14_memEnd_ready;
  wire  mem_controller14_loadEn;
  wire [3:0] mem_controller14_loadAddr;
  wire  mem_controller14_storeEn;
  wire [3:0] mem_controller14_storeAddr;
  wire [7:0] mem_controller14_storeData;
  wire [7:0] mem_controller15_ldData_0;
  wire  mem_controller15_ldData_0_valid;
  wire  mem_controller15_ldData_0_ready;
  wire  mem_controller15_memEnd_valid;
  wire  mem_controller15_memEnd_ready;
  wire  mem_controller15_loadEn;
  wire [3:0] mem_controller15_loadAddr;
  wire  mem_controller15_storeEn;
  wire [3:0] mem_controller15_storeAddr;
  wire [7:0] mem_controller15_storeData;
  wire [7:0] mem_controller16_ldData_0;
  wire  mem_controller16_ldData_0_valid;
  wire  mem_controller16_ldData_0_ready;
  wire  mem_controller16_memEnd_valid;
  wire  mem_controller16_memEnd_ready;
  wire  mem_controller16_loadEn;
  wire [3:0] mem_controller16_loadAddr;
  wire  mem_controller16_storeEn;
  wire [3:0] mem_controller16_storeAddr;
  wire [7:0] mem_controller16_storeData;
  wire [7:0] mem_controller17_ldData_0;
  wire  mem_controller17_ldData_0_valid;
  wire  mem_controller17_ldData_0_ready;
  wire  mem_controller17_memEnd_valid;
  wire  mem_controller17_memEnd_ready;
  wire  mem_controller17_loadEn;
  wire [3:0] mem_controller17_loadAddr;
  wire  mem_controller17_storeEn;
  wire [3:0] mem_controller17_storeAddr;
  wire [7:0] mem_controller17_storeData;
  wire [0:0] constant32_outs;
  wire  constant32_outs_valid;
  wire  constant32_outs_ready;
  wire [4:0] extsi49_outs;
  wire  extsi49_outs_valid;
  wire  extsi49_outs_ready;
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
  wire [0:0] constant33_outs;
  wire  constant33_outs_valid;
  wire  constant33_outs_ready;
  wire [4:0] extsi48_outs;
  wire  extsi48_outs_valid;
  wire  extsi48_outs_ready;
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
  wire [4:0] buffer8_outs;
  wire  buffer8_outs_valid;
  wire  buffer8_outs_ready;
  wire [4:0] buffer9_outs;
  wire  buffer9_outs_valid;
  wire  buffer9_outs_ready;
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
  wire [6:0] extsi50_outs;
  wire  extsi50_outs_valid;
  wire  extsi50_outs_ready;
  wire [6:0] extsi51_outs;
  wire  extsi51_outs_valid;
  wire  extsi51_outs_ready;
  wire [5:0] extsi52_outs;
  wire  extsi52_outs_valid;
  wire  extsi52_outs_ready;
  wire [3:0] trunci4_outs;
  wire  trunci4_outs_valid;
  wire  trunci4_outs_ready;
  wire [3:0] trunci5_outs;
  wire  trunci5_outs_valid;
  wire  trunci5_outs_ready;
  wire [7:0] mux4_outs;
  wire  mux4_outs_valid;
  wire  mux4_outs_ready;
  wire [7:0] mux5_outs;
  wire  mux5_outs_valid;
  wire  mux5_outs_ready;
  wire [4:0] mux6_outs;
  wire  mux6_outs_valid;
  wire  mux6_outs_ready;
  wire [4:0] buffer14_outs;
  wire  buffer14_outs_valid;
  wire  buffer14_outs_ready;
  wire [4:0] buffer15_outs;
  wire  buffer15_outs_valid;
  wire  buffer15_outs_ready;
  wire [4:0] fork4_outs_0;
  wire  fork4_outs_0_valid;
  wire  fork4_outs_0_ready;
  wire [4:0] fork4_outs_1;
  wire  fork4_outs_1_valid;
  wire  fork4_outs_1_ready;
  wire [4:0] fork4_outs_2;
  wire  fork4_outs_2_valid;
  wire  fork4_outs_2_ready;
  wire [4:0] fork4_outs_3;
  wire  fork4_outs_3_valid;
  wire  fork4_outs_3_ready;
  wire [31:0] extsi53_outs;
  wire  extsi53_outs_valid;
  wire  extsi53_outs_ready;
  wire [31:0] fork5_outs_0;
  wire  fork5_outs_0_valid;
  wire  fork5_outs_0_ready;
  wire [31:0] fork5_outs_1;
  wire  fork5_outs_1_valid;
  wire  fork5_outs_1_ready;
  wire [31:0] fork5_outs_2;
  wire  fork5_outs_2_valid;
  wire  fork5_outs_2_ready;
  wire [31:0] fork5_outs_3;
  wire  fork5_outs_3_valid;
  wire  fork5_outs_3_ready;
  wire [3:0] trunci6_outs;
  wire  trunci6_outs_valid;
  wire  trunci6_outs_ready;
  wire [3:0] trunci7_outs;
  wire  trunci7_outs_valid;
  wire  trunci7_outs_ready;
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
  wire [0:0] fork6_outs_3;
  wire  fork6_outs_3_valid;
  wire  fork6_outs_3_ready;
  wire  buffer16_outs_valid;
  wire  buffer16_outs_ready;
  wire  buffer17_outs_valid;
  wire  buffer17_outs_ready;
  wire  fork7_outs_0_valid;
  wire  fork7_outs_0_ready;
  wire  fork7_outs_1_valid;
  wire  fork7_outs_1_ready;
  wire [1:0] constant34_outs;
  wire  constant34_outs_valid;
  wire  constant34_outs_ready;
  wire [31:0] extsi17_outs;
  wire  extsi17_outs_valid;
  wire  extsi17_outs_ready;
  wire  source0_outs_valid;
  wire  source0_outs_ready;
  wire [4:0] constant35_outs;
  wire  constant35_outs_valid;
  wire  constant35_outs_ready;
  wire [5:0] extsi54_outs;
  wire  extsi54_outs_valid;
  wire  extsi54_outs_ready;
  wire  source1_outs_valid;
  wire  source1_outs_ready;
  wire [1:0] constant36_outs;
  wire  constant36_outs_valid;
  wire  constant36_outs_ready;
  wire [1:0] fork8_outs_0;
  wire  fork8_outs_0_valid;
  wire  fork8_outs_0_ready;
  wire [1:0] fork8_outs_1;
  wire  fork8_outs_1_valid;
  wire  fork8_outs_1_ready;
  wire [5:0] extsi55_outs;
  wire  extsi55_outs_valid;
  wire  extsi55_outs_ready;
  wire [31:0] extsi19_outs;
  wire  extsi19_outs_valid;
  wire  extsi19_outs_ready;
  wire [31:0] fork9_outs_0;
  wire  fork9_outs_0_valid;
  wire  fork9_outs_0_ready;
  wire [31:0] fork9_outs_1;
  wire  fork9_outs_1_valid;
  wire  fork9_outs_1_ready;
  wire  source2_outs_valid;
  wire  source2_outs_ready;
  wire [2:0] constant37_outs;
  wire  constant37_outs_valid;
  wire  constant37_outs_ready;
  wire [31:0] extsi20_outs;
  wire  extsi20_outs_valid;
  wire  extsi20_outs_ready;
  wire [31:0] fork10_outs_0;
  wire  fork10_outs_0_valid;
  wire  fork10_outs_0_ready;
  wire [31:0] fork10_outs_1;
  wire  fork10_outs_1_valid;
  wire  fork10_outs_1_ready;
  wire [31:0] shli0_result;
  wire  shli0_result_valid;
  wire  shli0_result_ready;
  wire [6:0] trunci8_outs;
  wire  trunci8_outs_valid;
  wire  trunci8_outs_ready;
  wire [31:0] shli1_result;
  wire  shli1_result_valid;
  wire  shli1_result_ready;
  wire [6:0] trunci9_outs;
  wire  trunci9_outs_valid;
  wire  trunci9_outs_ready;
  wire [6:0] addi16_result;
  wire  addi16_result_valid;
  wire  addi16_result_ready;
  wire [6:0] addi5_result;
  wire  addi5_result_valid;
  wire  addi5_result_ready;
  wire [6:0] load0_addrOut;
  wire  load0_addrOut_valid;
  wire  load0_addrOut_ready;
  wire [7:0] load0_dataOut;
  wire  load0_dataOut_valid;
  wire  load0_dataOut_ready;
  wire [3:0] load1_addrOut;
  wire  load1_addrOut_valid;
  wire  load1_addrOut_ready;
  wire [7:0] load1_dataOut;
  wire  load1_dataOut_valid;
  wire  load1_dataOut_ready;
  wire [15:0] extsi56_outs;
  wire  extsi56_outs_valid;
  wire  extsi56_outs_ready;
  wire [3:0] load2_addrOut;
  wire  load2_addrOut_valid;
  wire  load2_addrOut_ready;
  wire [7:0] load2_dataOut;
  wire  load2_dataOut_valid;
  wire  load2_dataOut_ready;
  wire [15:0] extsi57_outs;
  wire  extsi57_outs_valid;
  wire  extsi57_outs_ready;
  wire [15:0] muli0_result;
  wire  muli0_result_valid;
  wire  muli0_result_ready;
  wire [7:0] trunci10_outs;
  wire  trunci10_outs_valid;
  wire  trunci10_outs_ready;
  wire [7:0] addi0_result;
  wire  addi0_result_valid;
  wire  addi0_result_ready;
  wire [3:0] load3_addrOut;
  wire  load3_addrOut_valid;
  wire  load3_addrOut_ready;
  wire [7:0] load3_dataOut;
  wire  load3_dataOut_valid;
  wire  load3_dataOut_ready;
  wire [15:0] extsi58_outs;
  wire  extsi58_outs_valid;
  wire  extsi58_outs_ready;
  wire [3:0] load4_addrOut;
  wire  load4_addrOut_valid;
  wire  load4_addrOut_ready;
  wire [7:0] load4_dataOut;
  wire  load4_dataOut_valid;
  wire  load4_dataOut_ready;
  wire [15:0] extsi59_outs;
  wire  extsi59_outs_valid;
  wire  extsi59_outs_ready;
  wire [15:0] muli1_result;
  wire  muli1_result_valid;
  wire  muli1_result_ready;
  wire [7:0] trunci11_outs;
  wire  trunci11_outs_valid;
  wire  trunci11_outs_ready;
  wire [7:0] addi1_result;
  wire  addi1_result_valid;
  wire  addi1_result_ready;
  wire [31:0] shli2_result;
  wire  shli2_result_valid;
  wire  shli2_result_ready;
  wire [6:0] trunci12_outs;
  wire  trunci12_outs_valid;
  wire  trunci12_outs_ready;
  wire [31:0] shli3_result;
  wire  shli3_result_valid;
  wire  shli3_result_ready;
  wire [6:0] trunci13_outs;
  wire  trunci13_outs_valid;
  wire  trunci13_outs_ready;
  wire [6:0] addi17_result;
  wire  addi17_result_valid;
  wire  addi17_result_ready;
  wire [6:0] addi6_result;
  wire  addi6_result_valid;
  wire  addi6_result_ready;
  wire [6:0] store0_addrOut;
  wire  store0_addrOut_valid;
  wire  store0_addrOut_ready;
  wire [7:0] store0_dataToMem;
  wire  store0_dataToMem_valid;
  wire  store0_dataToMem_ready;
  wire [5:0] addi9_result;
  wire  addi9_result_valid;
  wire  addi9_result_ready;
  wire [5:0] fork11_outs_0;
  wire  fork11_outs_0_valid;
  wire  fork11_outs_0_ready;
  wire [5:0] fork11_outs_1;
  wire  fork11_outs_1_valid;
  wire  fork11_outs_1_ready;
  wire [4:0] trunci14_outs;
  wire  trunci14_outs_valid;
  wire  trunci14_outs_ready;
  wire [0:0] cmpi0_result;
  wire  cmpi0_result_valid;
  wire  cmpi0_result_ready;
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
  wire [4:0] cond_br7_trueOut;
  wire  cond_br7_trueOut_valid;
  wire  cond_br7_trueOut_ready;
  wire [4:0] cond_br7_falseOut;
  wire  cond_br7_falseOut_valid;
  wire  cond_br7_falseOut_ready;
  wire [7:0] buffer10_outs;
  wire  buffer10_outs_valid;
  wire  buffer10_outs_ready;
  wire [7:0] buffer11_outs;
  wire  buffer11_outs_valid;
  wire  buffer11_outs_ready;
  wire [7:0] cond_br8_trueOut;
  wire  cond_br8_trueOut_valid;
  wire  cond_br8_trueOut_ready;
  wire [7:0] cond_br8_falseOut;
  wire  cond_br8_falseOut_valid;
  wire  cond_br8_falseOut_ready;
  wire [7:0] buffer12_outs;
  wire  buffer12_outs_valid;
  wire  buffer12_outs_ready;
  wire [7:0] buffer13_outs;
  wire  buffer13_outs_valid;
  wire  buffer13_outs_ready;
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
  wire  cond_br11_trueOut_valid;
  wire  cond_br11_trueOut_ready;
  wire  cond_br11_falseOut_valid;
  wire  cond_br11_falseOut_ready;
  wire [4:0] buffer22_outs;
  wire  buffer22_outs_valid;
  wire  buffer22_outs_ready;
  wire [4:0] buffer23_outs;
  wire  buffer23_outs_valid;
  wire  buffer23_outs_ready;
  wire [5:0] extsi60_outs;
  wire  extsi60_outs_valid;
  wire  extsi60_outs_ready;
  wire  source3_outs_valid;
  wire  source3_outs_ready;
  wire [4:0] constant38_outs;
  wire  constant38_outs_valid;
  wire  constant38_outs_ready;
  wire [5:0] extsi61_outs;
  wire  extsi61_outs_valid;
  wire  extsi61_outs_ready;
  wire  source4_outs_valid;
  wire  source4_outs_ready;
  wire [1:0] constant39_outs;
  wire  constant39_outs_valid;
  wire  constant39_outs_ready;
  wire [5:0] extsi62_outs;
  wire  extsi62_outs_valid;
  wire  extsi62_outs_ready;
  wire [5:0] addi10_result;
  wire  addi10_result_valid;
  wire  addi10_result_ready;
  wire [5:0] fork13_outs_0;
  wire  fork13_outs_0_valid;
  wire  fork13_outs_0_ready;
  wire [5:0] fork13_outs_1;
  wire  fork13_outs_1_valid;
  wire  fork13_outs_1_ready;
  wire [4:0] trunci15_outs;
  wire  trunci15_outs_valid;
  wire  trunci15_outs_ready;
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
  wire [0:0] fork14_outs_3;
  wire  fork14_outs_3_valid;
  wire  fork14_outs_3_ready;
  wire [4:0] cond_br12_trueOut;
  wire  cond_br12_trueOut_valid;
  wire  cond_br12_trueOut_ready;
  wire [4:0] cond_br12_falseOut;
  wire  cond_br12_falseOut_valid;
  wire  cond_br12_falseOut_ready;
  wire [7:0] buffer18_outs;
  wire  buffer18_outs_valid;
  wire  buffer18_outs_ready;
  wire [7:0] buffer19_outs;
  wire  buffer19_outs_valid;
  wire  buffer19_outs_ready;
  wire [7:0] cond_br13_trueOut;
  wire  cond_br13_trueOut_valid;
  wire  cond_br13_trueOut_ready;
  wire [7:0] cond_br13_falseOut;
  wire  cond_br13_falseOut_valid;
  wire  cond_br13_falseOut_ready;
  wire [7:0] buffer20_outs;
  wire  buffer20_outs_valid;
  wire  buffer20_outs_ready;
  wire [7:0] buffer21_outs;
  wire  buffer21_outs_valid;
  wire  buffer21_outs_ready;
  wire [7:0] cond_br14_trueOut;
  wire  cond_br14_trueOut_valid;
  wire  cond_br14_trueOut_ready;
  wire [7:0] cond_br14_falseOut;
  wire  cond_br14_falseOut_valid;
  wire  cond_br14_falseOut_ready;
  wire  buffer24_outs_valid;
  wire  buffer24_outs_ready;
  wire  buffer25_outs_valid;
  wire  buffer25_outs_ready;
  wire  cond_br15_trueOut_valid;
  wire  cond_br15_trueOut_ready;
  wire  cond_br15_falseOut_valid;
  wire  cond_br15_falseOut_ready;
  wire  buffer30_outs_valid;
  wire  buffer30_outs_ready;
  wire  buffer31_outs_valid;
  wire  buffer31_outs_ready;
  wire  fork15_outs_0_valid;
  wire  fork15_outs_0_ready;
  wire  fork15_outs_1_valid;
  wire  fork15_outs_1_ready;
  wire [0:0] constant40_outs;
  wire  constant40_outs_valid;
  wire  constant40_outs_ready;
  wire [4:0] extsi47_outs;
  wire  extsi47_outs_valid;
  wire  extsi47_outs_ready;
  wire [7:0] buffer26_outs;
  wire  buffer26_outs_valid;
  wire  buffer26_outs_ready;
  wire [7:0] buffer27_outs;
  wire  buffer27_outs_valid;
  wire  buffer27_outs_ready;
  wire [7:0] buffer28_outs;
  wire  buffer28_outs_valid;
  wire  buffer28_outs_ready;
  wire [7:0] buffer29_outs;
  wire  buffer29_outs_valid;
  wire  buffer29_outs_ready;
  wire [4:0] mux7_outs;
  wire  mux7_outs_valid;
  wire  mux7_outs_ready;
  wire [4:0] buffer32_outs;
  wire  buffer32_outs_valid;
  wire  buffer32_outs_ready;
  wire [4:0] buffer33_outs;
  wire  buffer33_outs_valid;
  wire  buffer33_outs_ready;
  wire [4:0] fork16_outs_0;
  wire  fork16_outs_0_valid;
  wire  fork16_outs_0_ready;
  wire [4:0] fork16_outs_1;
  wire  fork16_outs_1_valid;
  wire  fork16_outs_1_ready;
  wire [3:0] trunci16_outs;
  wire  trunci16_outs_valid;
  wire  trunci16_outs_ready;
  wire [7:0] mux8_outs;
  wire  mux8_outs_valid;
  wire  mux8_outs_ready;
  wire [7:0] mux9_outs;
  wire  mux9_outs_valid;
  wire  mux9_outs_ready;
  wire  control_merge4_outs_valid;
  wire  control_merge4_outs_ready;
  wire [0:0] control_merge4_index;
  wire  control_merge4_index_valid;
  wire  control_merge4_index_ready;
  wire [0:0] fork17_outs_0;
  wire  fork17_outs_0_valid;
  wire  fork17_outs_0_ready;
  wire [0:0] fork17_outs_1;
  wire  fork17_outs_1_valid;
  wire  fork17_outs_1_ready;
  wire [0:0] fork17_outs_2;
  wire  fork17_outs_2_valid;
  wire  fork17_outs_2_ready;
  wire  buffer38_outs_valid;
  wire  buffer38_outs_ready;
  wire  buffer39_outs_valid;
  wire  buffer39_outs_ready;
  wire  fork18_outs_0_valid;
  wire  fork18_outs_0_ready;
  wire  fork18_outs_1_valid;
  wire  fork18_outs_1_ready;
  wire [0:0] constant41_outs;
  wire  constant41_outs_valid;
  wire  constant41_outs_ready;
  wire [3:0] load5_addrOut;
  wire  load5_addrOut_valid;
  wire  load5_addrOut_ready;
  wire [7:0] load5_dataOut;
  wire  load5_dataOut_valid;
  wire  load5_dataOut_ready;
  wire [4:0] extsi46_outs;
  wire  extsi46_outs_valid;
  wire  extsi46_outs_ready;
  wire [31:0] extsi63_outs;
  wire  extsi63_outs_valid;
  wire  extsi63_outs_ready;
  wire [7:0] buffer34_outs;
  wire  buffer34_outs_valid;
  wire  buffer34_outs_ready;
  wire [7:0] buffer35_outs;
  wire  buffer35_outs_valid;
  wire  buffer35_outs_ready;
  wire [7:0] buffer36_outs;
  wire  buffer36_outs_valid;
  wire  buffer36_outs_ready;
  wire [7:0] buffer37_outs;
  wire  buffer37_outs_valid;
  wire  buffer37_outs_ready;
  wire [4:0] mux10_outs;
  wire  mux10_outs_valid;
  wire  mux10_outs_ready;
  wire [4:0] buffer40_outs;
  wire  buffer40_outs_valid;
  wire  buffer40_outs_ready;
  wire [4:0] buffer41_outs;
  wire  buffer41_outs_valid;
  wire  buffer41_outs_ready;
  wire [4:0] fork19_outs_0;
  wire  fork19_outs_0_valid;
  wire  fork19_outs_0_ready;
  wire [4:0] fork19_outs_1;
  wire  fork19_outs_1_valid;
  wire  fork19_outs_1_ready;
  wire [4:0] fork19_outs_2;
  wire  fork19_outs_2_valid;
  wire  fork19_outs_2_ready;
  wire [5:0] extsi64_outs;
  wire  extsi64_outs_valid;
  wire  extsi64_outs_ready;
  wire [31:0] extsi65_outs;
  wire  extsi65_outs_valid;
  wire  extsi65_outs_ready;
  wire [31:0] fork20_outs_0;
  wire  fork20_outs_0_valid;
  wire  fork20_outs_0_ready;
  wire [31:0] fork20_outs_1;
  wire  fork20_outs_1_valid;
  wire  fork20_outs_1_ready;
  wire [3:0] trunci17_outs;
  wire  trunci17_outs_valid;
  wire  trunci17_outs_ready;
  wire [31:0] mux11_outs;
  wire  mux11_outs_valid;
  wire  mux11_outs_ready;
  wire [7:0] mux12_outs;
  wire  mux12_outs_valid;
  wire  mux12_outs_ready;
  wire [7:0] mux13_outs;
  wire  mux13_outs_valid;
  wire  mux13_outs_ready;
  wire [7:0] buffer46_outs;
  wire  buffer46_outs_valid;
  wire  buffer46_outs_ready;
  wire [7:0] buffer47_outs;
  wire  buffer47_outs_valid;
  wire  buffer47_outs_ready;
  wire [7:0] fork21_outs_0;
  wire  fork21_outs_0_valid;
  wire  fork21_outs_0_ready;
  wire [7:0] fork21_outs_1;
  wire  fork21_outs_1_valid;
  wire  fork21_outs_1_ready;
  wire [15:0] extsi66_outs;
  wire  extsi66_outs_valid;
  wire  extsi66_outs_ready;
  wire [4:0] mux14_outs;
  wire  mux14_outs_valid;
  wire  mux14_outs_ready;
  wire [4:0] buffer48_outs;
  wire  buffer48_outs_valid;
  wire  buffer48_outs_ready;
  wire [4:0] buffer49_outs;
  wire  buffer49_outs_valid;
  wire  buffer49_outs_ready;
  wire [4:0] fork22_outs_0;
  wire  fork22_outs_0_valid;
  wire  fork22_outs_0_ready;
  wire [4:0] fork22_outs_1;
  wire  fork22_outs_1_valid;
  wire  fork22_outs_1_ready;
  wire [6:0] extsi67_outs;
  wire  extsi67_outs_valid;
  wire  extsi67_outs_ready;
  wire  control_merge5_outs_valid;
  wire  control_merge5_outs_ready;
  wire [0:0] control_merge5_index;
  wire  control_merge5_index_valid;
  wire  control_merge5_index_ready;
  wire [0:0] fork23_outs_0;
  wire  fork23_outs_0_valid;
  wire  fork23_outs_0_ready;
  wire [0:0] fork23_outs_1;
  wire  fork23_outs_1_valid;
  wire  fork23_outs_1_ready;
  wire [0:0] fork23_outs_2;
  wire  fork23_outs_2_valid;
  wire  fork23_outs_2_ready;
  wire [0:0] fork23_outs_3;
  wire  fork23_outs_3_valid;
  wire  fork23_outs_3_ready;
  wire [0:0] fork23_outs_4;
  wire  fork23_outs_4_valid;
  wire  fork23_outs_4_ready;
  wire  source5_outs_valid;
  wire  source5_outs_ready;
  wire [4:0] constant42_outs;
  wire  constant42_outs_valid;
  wire  constant42_outs_ready;
  wire [5:0] extsi68_outs;
  wire  extsi68_outs_valid;
  wire  extsi68_outs_ready;
  wire  source6_outs_valid;
  wire  source6_outs_ready;
  wire [1:0] constant43_outs;
  wire  constant43_outs_valid;
  wire  constant43_outs_ready;
  wire [1:0] fork24_outs_0;
  wire  fork24_outs_0_valid;
  wire  fork24_outs_0_ready;
  wire [1:0] fork24_outs_1;
  wire  fork24_outs_1_valid;
  wire  fork24_outs_1_ready;
  wire [5:0] extsi69_outs;
  wire  extsi69_outs_valid;
  wire  extsi69_outs_ready;
  wire [31:0] extsi26_outs;
  wire  extsi26_outs_valid;
  wire  extsi26_outs_ready;
  wire  source7_outs_valid;
  wire  source7_outs_ready;
  wire [2:0] constant44_outs;
  wire  constant44_outs_valid;
  wire  constant44_outs_ready;
  wire [31:0] extsi27_outs;
  wire  extsi27_outs_valid;
  wire  extsi27_outs_ready;
  wire [31:0] shli4_result;
  wire  shli4_result_valid;
  wire  shli4_result_ready;
  wire [6:0] trunci18_outs;
  wire  trunci18_outs_valid;
  wire  trunci18_outs_ready;
  wire [31:0] shli5_result;
  wire  shli5_result_valid;
  wire  shli5_result_ready;
  wire [6:0] trunci19_outs;
  wire  trunci19_outs_valid;
  wire  trunci19_outs_ready;
  wire [6:0] addi18_result;
  wire  addi18_result_valid;
  wire  addi18_result_ready;
  wire [6:0] addi7_result;
  wire  addi7_result_valid;
  wire  addi7_result_ready;
  wire [6:0] load6_addrOut;
  wire  load6_addrOut_valid;
  wire  load6_addrOut_ready;
  wire [7:0] load6_dataOut;
  wire  load6_dataOut_valid;
  wire  load6_dataOut_ready;
  wire [15:0] extsi70_outs;
  wire  extsi70_outs_valid;
  wire  extsi70_outs_ready;
  wire [15:0] muli2_result;
  wire  muli2_result_valid;
  wire  muli2_result_ready;
  wire [23:0] extsi71_outs;
  wire  extsi71_outs_valid;
  wire  extsi71_outs_ready;
  wire [3:0] load7_addrOut;
  wire  load7_addrOut_valid;
  wire  load7_addrOut_ready;
  wire [7:0] load7_dataOut;
  wire  load7_dataOut_valid;
  wire  load7_dataOut_ready;
  wire [23:0] extsi72_outs;
  wire  extsi72_outs_valid;
  wire  extsi72_outs_ready;
  wire [23:0] muli3_result;
  wire  muli3_result_valid;
  wire  muli3_result_ready;
  wire [31:0] extsi73_outs;
  wire  extsi73_outs_valid;
  wire  extsi73_outs_ready;
  wire [31:0] buffer42_outs;
  wire  buffer42_outs_valid;
  wire  buffer42_outs_ready;
  wire [31:0] buffer43_outs;
  wire  buffer43_outs_valid;
  wire  buffer43_outs_ready;
  wire [31:0] addi2_result;
  wire  addi2_result_valid;
  wire  addi2_result_ready;
  wire [5:0] addi11_result;
  wire  addi11_result_valid;
  wire  addi11_result_ready;
  wire [5:0] fork25_outs_0;
  wire  fork25_outs_0_valid;
  wire  fork25_outs_0_ready;
  wire [5:0] fork25_outs_1;
  wire  fork25_outs_1_valid;
  wire  fork25_outs_1_ready;
  wire [4:0] trunci20_outs;
  wire  trunci20_outs_valid;
  wire  trunci20_outs_ready;
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
  wire [0:0] fork26_outs_4;
  wire  fork26_outs_4_valid;
  wire  fork26_outs_4_ready;
  wire [0:0] fork26_outs_5;
  wire  fork26_outs_5_valid;
  wire  fork26_outs_5_ready;
  wire [4:0] cond_br16_trueOut;
  wire  cond_br16_trueOut_valid;
  wire  cond_br16_trueOut_ready;
  wire [4:0] cond_br16_falseOut;
  wire  cond_br16_falseOut_valid;
  wire  cond_br16_falseOut_ready;
  wire [31:0] cond_br17_trueOut;
  wire  cond_br17_trueOut_valid;
  wire  cond_br17_trueOut_ready;
  wire [31:0] cond_br17_falseOut;
  wire  cond_br17_falseOut_valid;
  wire  cond_br17_falseOut_ready;
  wire [7:0] trunci21_outs;
  wire  trunci21_outs_valid;
  wire  trunci21_outs_ready;
  wire [7:0] buffer44_outs;
  wire  buffer44_outs_valid;
  wire  buffer44_outs_ready;
  wire [7:0] buffer45_outs;
  wire  buffer45_outs_valid;
  wire  buffer45_outs_ready;
  wire [7:0] cond_br18_trueOut;
  wire  cond_br18_trueOut_valid;
  wire  cond_br18_trueOut_ready;
  wire [7:0] cond_br18_falseOut;
  wire  cond_br18_falseOut_valid;
  wire  cond_br18_falseOut_ready;
  wire [7:0] cond_br19_trueOut;
  wire  cond_br19_trueOut_valid;
  wire  cond_br19_trueOut_ready;
  wire [7:0] cond_br19_falseOut;
  wire  cond_br19_falseOut_valid;
  wire  cond_br19_falseOut_ready;
  wire [4:0] cond_br20_trueOut;
  wire  cond_br20_trueOut_valid;
  wire  cond_br20_trueOut_ready;
  wire [4:0] cond_br20_falseOut;
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
  wire [4:0] buffer56_outs;
  wire  buffer56_outs_valid;
  wire  buffer56_outs_ready;
  wire [4:0] buffer57_outs;
  wire  buffer57_outs_valid;
  wire  buffer57_outs_ready;
  wire [4:0] fork27_outs_0;
  wire  fork27_outs_0_valid;
  wire  fork27_outs_0_ready;
  wire [4:0] fork27_outs_1;
  wire  fork27_outs_1_valid;
  wire  fork27_outs_1_ready;
  wire [5:0] extsi74_outs;
  wire  extsi74_outs_valid;
  wire  extsi74_outs_ready;
  wire [3:0] trunci22_outs;
  wire  trunci22_outs_valid;
  wire  trunci22_outs_ready;
  wire  buffer60_outs_valid;
  wire  buffer60_outs_ready;
  wire  buffer61_outs_valid;
  wire  buffer61_outs_ready;
  wire  fork28_outs_0_valid;
  wire  fork28_outs_0_ready;
  wire  fork28_outs_1_valid;
  wire  fork28_outs_1_ready;
  wire  fork28_outs_2_valid;
  wire  fork28_outs_2_ready;
  wire [1:0] constant45_outs;
  wire  constant45_outs_valid;
  wire  constant45_outs_ready;
  wire [31:0] extsi28_outs;
  wire  extsi28_outs_valid;
  wire  extsi28_outs_ready;
  wire [0:0] constant46_outs;
  wire  constant46_outs_valid;
  wire  constant46_outs_ready;
  wire  source8_outs_valid;
  wire  source8_outs_ready;
  wire [4:0] constant47_outs;
  wire  constant47_outs_valid;
  wire  constant47_outs_ready;
  wire [5:0] extsi75_outs;
  wire  extsi75_outs_valid;
  wire  extsi75_outs_ready;
  wire  source9_outs_valid;
  wire  source9_outs_ready;
  wire [1:0] constant48_outs;
  wire  constant48_outs_valid;
  wire  constant48_outs_ready;
  wire [5:0] extsi76_outs;
  wire  extsi76_outs_valid;
  wire  extsi76_outs_ready;
  wire [7:0] buffer58_outs;
  wire  buffer58_outs_valid;
  wire  buffer58_outs_ready;
  wire [7:0] buffer59_outs;
  wire  buffer59_outs_valid;
  wire  buffer59_outs_ready;
  wire [3:0] store1_addrOut;
  wire  store1_addrOut_valid;
  wire  store1_addrOut_ready;
  wire [7:0] store1_dataToMem;
  wire  store1_dataToMem_valid;
  wire  store1_dataToMem_ready;
  wire [5:0] addi12_result;
  wire  addi12_result_valid;
  wire  addi12_result_ready;
  wire [5:0] fork29_outs_0;
  wire  fork29_outs_0_valid;
  wire  fork29_outs_0_ready;
  wire [5:0] fork29_outs_1;
  wire  fork29_outs_1_valid;
  wire  fork29_outs_1_ready;
  wire [4:0] trunci23_outs;
  wire  trunci23_outs_valid;
  wire  trunci23_outs_ready;
  wire [0:0] cmpi3_result;
  wire  cmpi3_result_valid;
  wire  cmpi3_result_ready;
  wire [0:0] fork30_outs_0;
  wire  fork30_outs_0_valid;
  wire  fork30_outs_0_ready;
  wire [0:0] fork30_outs_1;
  wire  fork30_outs_1_valid;
  wire  fork30_outs_1_ready;
  wire [0:0] fork30_outs_2;
  wire  fork30_outs_2_valid;
  wire  fork30_outs_2_ready;
  wire [0:0] fork30_outs_3;
  wire  fork30_outs_3_valid;
  wire  fork30_outs_3_ready;
  wire [0:0] fork30_outs_4;
  wire  fork30_outs_4_valid;
  wire  fork30_outs_4_ready;
  wire [4:0] cond_br22_trueOut;
  wire  cond_br22_trueOut_valid;
  wire  cond_br22_trueOut_ready;
  wire [4:0] cond_br22_falseOut;
  wire  cond_br22_falseOut_valid;
  wire  cond_br22_falseOut_ready;
  wire [7:0] buffer52_outs;
  wire  buffer52_outs_valid;
  wire  buffer52_outs_ready;
  wire [7:0] buffer53_outs;
  wire  buffer53_outs_valid;
  wire  buffer53_outs_ready;
  wire [7:0] cond_br23_trueOut;
  wire  cond_br23_trueOut_valid;
  wire  cond_br23_trueOut_ready;
  wire [7:0] cond_br23_falseOut;
  wire  cond_br23_falseOut_valid;
  wire  cond_br23_falseOut_ready;
  wire [7:0] buffer54_outs;
  wire  buffer54_outs_valid;
  wire  buffer54_outs_ready;
  wire [7:0] buffer55_outs;
  wire  buffer55_outs_valid;
  wire  buffer55_outs_ready;
  wire [7:0] cond_br24_trueOut;
  wire  cond_br24_trueOut_valid;
  wire  cond_br24_trueOut_ready;
  wire [7:0] cond_br24_falseOut;
  wire  cond_br24_falseOut_valid;
  wire  cond_br24_falseOut_ready;
  wire  cond_br25_trueOut_valid;
  wire  cond_br25_trueOut_ready;
  wire  cond_br25_falseOut_valid;
  wire  cond_br25_falseOut_ready;
  wire [0:0] cond_br26_trueOut;
  wire  cond_br26_trueOut_valid;
  wire  cond_br26_trueOut_ready;
  wire [0:0] cond_br26_falseOut;
  wire  cond_br26_falseOut_valid;
  wire  cond_br26_falseOut_ready;
  wire [4:0] extsi45_outs;
  wire  extsi45_outs_valid;
  wire  extsi45_outs_ready;
  wire [4:0] mux15_outs;
  wire  mux15_outs_valid;
  wire  mux15_outs_ready;
  wire [4:0] buffer62_outs;
  wire  buffer62_outs_valid;
  wire  buffer62_outs_ready;
  wire [4:0] buffer63_outs;
  wire  buffer63_outs_valid;
  wire  buffer63_outs_ready;
  wire [4:0] fork31_outs_0;
  wire  fork31_outs_0_valid;
  wire  fork31_outs_0_ready;
  wire [4:0] fork31_outs_1;
  wire  fork31_outs_1_valid;
  wire  fork31_outs_1_ready;
  wire [4:0] fork31_outs_2;
  wire  fork31_outs_2_valid;
  wire  fork31_outs_2_ready;
  wire [4:0] fork31_outs_3;
  wire  fork31_outs_3_valid;
  wire  fork31_outs_3_ready;
  wire [5:0] extsi77_outs;
  wire  extsi77_outs_valid;
  wire  extsi77_outs_ready;
  wire [3:0] trunci24_outs;
  wire  trunci24_outs_valid;
  wire  trunci24_outs_ready;
  wire [3:0] trunci25_outs;
  wire  trunci25_outs_valid;
  wire  trunci25_outs_ready;
  wire [3:0] trunci26_outs;
  wire  trunci26_outs_valid;
  wire  trunci26_outs_ready;
  wire [7:0] mux16_outs;
  wire  mux16_outs_valid;
  wire  mux16_outs_ready;
  wire  control_merge7_outs_valid;
  wire  control_merge7_outs_ready;
  wire [0:0] control_merge7_index;
  wire  control_merge7_index_valid;
  wire  control_merge7_index_ready;
  wire [0:0] fork32_outs_0;
  wire  fork32_outs_0_valid;
  wire  fork32_outs_0_ready;
  wire [0:0] fork32_outs_1;
  wire  fork32_outs_1_valid;
  wire  fork32_outs_1_ready;
  wire  buffer66_outs_valid;
  wire  buffer66_outs_ready;
  wire  buffer67_outs_valid;
  wire  buffer67_outs_ready;
  wire  fork33_outs_0_valid;
  wire  fork33_outs_0_ready;
  wire  fork33_outs_1_valid;
  wire  fork33_outs_1_ready;
  wire [1:0] constant49_outs;
  wire  constant49_outs_valid;
  wire  constant49_outs_ready;
  wire [31:0] extsi32_outs;
  wire  extsi32_outs_valid;
  wire  extsi32_outs_ready;
  wire  source10_outs_valid;
  wire  source10_outs_ready;
  wire [4:0] constant50_outs;
  wire  constant50_outs_valid;
  wire  constant50_outs_ready;
  wire [5:0] extsi78_outs;
  wire  extsi78_outs_valid;
  wire  extsi78_outs_ready;
  wire  source11_outs_valid;
  wire  source11_outs_ready;
  wire [1:0] constant51_outs;
  wire  constant51_outs_valid;
  wire  constant51_outs_ready;
  wire [5:0] extsi79_outs;
  wire  extsi79_outs_valid;
  wire  extsi79_outs_ready;
  wire [3:0] load8_addrOut;
  wire  load8_addrOut_valid;
  wire  load8_addrOut_ready;
  wire [7:0] load8_dataOut;
  wire  load8_dataOut_valid;
  wire  load8_dataOut_ready;
  wire [3:0] load9_addrOut;
  wire  load9_addrOut_valid;
  wire  load9_addrOut_ready;
  wire [7:0] load9_dataOut;
  wire  load9_dataOut_valid;
  wire  load9_dataOut_ready;
  wire [7:0] addi3_result;
  wire  addi3_result_valid;
  wire  addi3_result_ready;
  wire [3:0] store2_addrOut;
  wire  store2_addrOut_valid;
  wire  store2_addrOut_ready;
  wire [7:0] store2_dataToMem;
  wire  store2_dataToMem_valid;
  wire  store2_dataToMem_ready;
  wire [5:0] addi13_result;
  wire  addi13_result_valid;
  wire  addi13_result_ready;
  wire [5:0] fork34_outs_0;
  wire  fork34_outs_0_valid;
  wire  fork34_outs_0_ready;
  wire [5:0] fork34_outs_1;
  wire  fork34_outs_1_valid;
  wire  fork34_outs_1_ready;
  wire [4:0] trunci27_outs;
  wire  trunci27_outs_valid;
  wire  trunci27_outs_ready;
  wire [0:0] cmpi4_result;
  wire  cmpi4_result_valid;
  wire  cmpi4_result_ready;
  wire [0:0] fork35_outs_0;
  wire  fork35_outs_0_valid;
  wire  fork35_outs_0_ready;
  wire [0:0] fork35_outs_1;
  wire  fork35_outs_1_valid;
  wire  fork35_outs_1_ready;
  wire [0:0] fork35_outs_2;
  wire  fork35_outs_2_valid;
  wire  fork35_outs_2_ready;
  wire [4:0] cond_br27_trueOut;
  wire  cond_br27_trueOut_valid;
  wire  cond_br27_trueOut_ready;
  wire [4:0] cond_br27_falseOut;
  wire  cond_br27_falseOut_valid;
  wire  cond_br27_falseOut_ready;
  wire [7:0] buffer64_outs;
  wire  buffer64_outs_valid;
  wire  buffer64_outs_ready;
  wire [7:0] buffer65_outs;
  wire  buffer65_outs_valid;
  wire  buffer65_outs_ready;
  wire [7:0] cond_br28_trueOut;
  wire  cond_br28_trueOut_valid;
  wire  cond_br28_trueOut_ready;
  wire [7:0] cond_br28_falseOut;
  wire  cond_br28_falseOut_valid;
  wire  cond_br28_falseOut_ready;
  wire  cond_br29_trueOut_valid;
  wire  cond_br29_trueOut_ready;
  wire  cond_br29_falseOut_valid;
  wire  cond_br29_falseOut_ready;
  wire  buffer70_outs_valid;
  wire  buffer70_outs_ready;
  wire  buffer71_outs_valid;
  wire  buffer71_outs_ready;
  wire  fork36_outs_0_valid;
  wire  fork36_outs_0_ready;
  wire  fork36_outs_1_valid;
  wire  fork36_outs_1_ready;
  wire [0:0] constant52_outs;
  wire  constant52_outs_valid;
  wire  constant52_outs_ready;
  wire [4:0] extsi44_outs;
  wire  extsi44_outs_valid;
  wire  extsi44_outs_ready;
  wire [7:0] buffer68_outs;
  wire  buffer68_outs_valid;
  wire  buffer68_outs_ready;
  wire [7:0] buffer69_outs;
  wire  buffer69_outs_valid;
  wire  buffer69_outs_ready;
  wire [4:0] mux17_outs;
  wire  mux17_outs_valid;
  wire  mux17_outs_ready;
  wire [4:0] buffer72_outs;
  wire  buffer72_outs_valid;
  wire  buffer72_outs_ready;
  wire [4:0] buffer73_outs;
  wire  buffer73_outs_valid;
  wire  buffer73_outs_ready;
  wire [4:0] fork37_outs_0;
  wire  fork37_outs_0_valid;
  wire  fork37_outs_0_ready;
  wire [4:0] fork37_outs_1;
  wire  fork37_outs_1_valid;
  wire  fork37_outs_1_ready;
  wire [3:0] trunci28_outs;
  wire  trunci28_outs_valid;
  wire  trunci28_outs_ready;
  wire [7:0] mux18_outs;
  wire  mux18_outs_valid;
  wire  mux18_outs_ready;
  wire  control_merge9_outs_valid;
  wire  control_merge9_outs_ready;
  wire [0:0] control_merge9_index;
  wire  control_merge9_index_valid;
  wire  control_merge9_index_ready;
  wire [0:0] fork38_outs_0;
  wire  fork38_outs_0_valid;
  wire  fork38_outs_0_ready;
  wire [0:0] fork38_outs_1;
  wire  fork38_outs_1_valid;
  wire  fork38_outs_1_ready;
  wire  buffer76_outs_valid;
  wire  buffer76_outs_ready;
  wire  buffer77_outs_valid;
  wire  buffer77_outs_ready;
  wire  fork39_outs_0_valid;
  wire  fork39_outs_0_ready;
  wire  fork39_outs_1_valid;
  wire  fork39_outs_1_ready;
  wire [0:0] constant53_outs;
  wire  constant53_outs_valid;
  wire  constant53_outs_ready;
  wire [3:0] load10_addrOut;
  wire  load10_addrOut_valid;
  wire  load10_addrOut_ready;
  wire [7:0] load10_dataOut;
  wire  load10_dataOut_valid;
  wire  load10_dataOut_ready;
  wire [4:0] extsi43_outs;
  wire  extsi43_outs_valid;
  wire  extsi43_outs_ready;
  wire [31:0] extsi80_outs;
  wire  extsi80_outs_valid;
  wire  extsi80_outs_ready;
  wire [7:0] buffer74_outs;
  wire  buffer74_outs_valid;
  wire  buffer74_outs_ready;
  wire [7:0] buffer75_outs;
  wire  buffer75_outs_valid;
  wire  buffer75_outs_ready;
  wire [4:0] mux19_outs;
  wire  mux19_outs_valid;
  wire  mux19_outs_ready;
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
  wire [4:0] fork40_outs_2;
  wire  fork40_outs_2_valid;
  wire  fork40_outs_2_ready;
  wire [6:0] extsi81_outs;
  wire  extsi81_outs_valid;
  wire  extsi81_outs_ready;
  wire [5:0] extsi82_outs;
  wire  extsi82_outs_valid;
  wire  extsi82_outs_ready;
  wire [3:0] trunci29_outs;
  wire  trunci29_outs_valid;
  wire  trunci29_outs_ready;
  wire [31:0] mux20_outs;
  wire  mux20_outs_valid;
  wire  mux20_outs_ready;
  wire [7:0] mux21_outs;
  wire  mux21_outs_valid;
  wire  mux21_outs_ready;
  wire [7:0] buffer82_outs;
  wire  buffer82_outs_valid;
  wire  buffer82_outs_ready;
  wire [7:0] buffer83_outs;
  wire  buffer83_outs_valid;
  wire  buffer83_outs_ready;
  wire [7:0] fork41_outs_0;
  wire  fork41_outs_0_valid;
  wire  fork41_outs_0_ready;
  wire [7:0] fork41_outs_1;
  wire  fork41_outs_1_valid;
  wire  fork41_outs_1_ready;
  wire [15:0] extsi83_outs;
  wire  extsi83_outs_valid;
  wire  extsi83_outs_ready;
  wire [4:0] mux22_outs;
  wire  mux22_outs_valid;
  wire  mux22_outs_ready;
  wire [4:0] buffer84_outs;
  wire  buffer84_outs_valid;
  wire  buffer84_outs_ready;
  wire [4:0] buffer85_outs;
  wire  buffer85_outs_valid;
  wire  buffer85_outs_ready;
  wire [4:0] fork42_outs_0;
  wire  fork42_outs_0_valid;
  wire  fork42_outs_0_ready;
  wire [4:0] fork42_outs_1;
  wire  fork42_outs_1_valid;
  wire  fork42_outs_1_ready;
  wire [31:0] extsi84_outs;
  wire  extsi84_outs_valid;
  wire  extsi84_outs_ready;
  wire [31:0] fork43_outs_0;
  wire  fork43_outs_0_valid;
  wire  fork43_outs_0_ready;
  wire [31:0] fork43_outs_1;
  wire  fork43_outs_1_valid;
  wire  fork43_outs_1_ready;
  wire  control_merge10_outs_valid;
  wire  control_merge10_outs_ready;
  wire [0:0] control_merge10_index;
  wire  control_merge10_index_valid;
  wire  control_merge10_index_ready;
  wire [0:0] fork44_outs_0;
  wire  fork44_outs_0_valid;
  wire  fork44_outs_0_ready;
  wire [0:0] fork44_outs_1;
  wire  fork44_outs_1_valid;
  wire  fork44_outs_1_ready;
  wire [0:0] fork44_outs_2;
  wire  fork44_outs_2_valid;
  wire  fork44_outs_2_ready;
  wire [0:0] fork44_outs_3;
  wire  fork44_outs_3_valid;
  wire  fork44_outs_3_ready;
  wire  source12_outs_valid;
  wire  source12_outs_ready;
  wire [4:0] constant54_outs;
  wire  constant54_outs_valid;
  wire  constant54_outs_ready;
  wire [5:0] extsi85_outs;
  wire  extsi85_outs_valid;
  wire  extsi85_outs_ready;
  wire  source13_outs_valid;
  wire  source13_outs_ready;
  wire [1:0] constant55_outs;
  wire  constant55_outs_valid;
  wire  constant55_outs_ready;
  wire [1:0] fork45_outs_0;
  wire  fork45_outs_0_valid;
  wire  fork45_outs_0_ready;
  wire [1:0] fork45_outs_1;
  wire  fork45_outs_1_valid;
  wire  fork45_outs_1_ready;
  wire [5:0] extsi86_outs;
  wire  extsi86_outs_valid;
  wire  extsi86_outs_ready;
  wire [31:0] extsi38_outs;
  wire  extsi38_outs_valid;
  wire  extsi38_outs_ready;
  wire  source14_outs_valid;
  wire  source14_outs_ready;
  wire [2:0] constant56_outs;
  wire  constant56_outs_valid;
  wire  constant56_outs_ready;
  wire [31:0] extsi39_outs;
  wire  extsi39_outs_valid;
  wire  extsi39_outs_ready;
  wire [31:0] shli6_result;
  wire  shli6_result_valid;
  wire  shli6_result_ready;
  wire [6:0] trunci30_outs;
  wire  trunci30_outs_valid;
  wire  trunci30_outs_ready;
  wire [31:0] shli7_result;
  wire  shli7_result_valid;
  wire  shli7_result_ready;
  wire [6:0] trunci31_outs;
  wire  trunci31_outs_valid;
  wire  trunci31_outs_ready;
  wire [6:0] addi19_result;
  wire  addi19_result_valid;
  wire  addi19_result_ready;
  wire [6:0] addi8_result;
  wire  addi8_result_valid;
  wire  addi8_result_ready;
  wire [6:0] load11_addrOut;
  wire  load11_addrOut_valid;
  wire  load11_addrOut_ready;
  wire [7:0] load11_dataOut;
  wire  load11_dataOut_valid;
  wire  load11_dataOut_ready;
  wire [15:0] extsi87_outs;
  wire  extsi87_outs_valid;
  wire  extsi87_outs_ready;
  wire [15:0] muli4_result;
  wire  muli4_result_valid;
  wire  muli4_result_ready;
  wire [23:0] extsi88_outs;
  wire  extsi88_outs_valid;
  wire  extsi88_outs_ready;
  wire [3:0] load12_addrOut;
  wire  load12_addrOut_valid;
  wire  load12_addrOut_ready;
  wire [7:0] load12_dataOut;
  wire  load12_dataOut_valid;
  wire  load12_dataOut_ready;
  wire [23:0] extsi89_outs;
  wire  extsi89_outs_valid;
  wire  extsi89_outs_ready;
  wire [23:0] muli5_result;
  wire  muli5_result_valid;
  wire  muli5_result_ready;
  wire [31:0] extsi90_outs;
  wire  extsi90_outs_valid;
  wire  extsi90_outs_ready;
  wire [31:0] buffer80_outs;
  wire  buffer80_outs_valid;
  wire  buffer80_outs_ready;
  wire [31:0] buffer81_outs;
  wire  buffer81_outs_valid;
  wire  buffer81_outs_ready;
  wire [31:0] addi4_result;
  wire  addi4_result_valid;
  wire  addi4_result_ready;
  wire [5:0] addi14_result;
  wire  addi14_result_valid;
  wire  addi14_result_ready;
  wire [5:0] fork46_outs_0;
  wire  fork46_outs_0_valid;
  wire  fork46_outs_0_ready;
  wire [5:0] fork46_outs_1;
  wire  fork46_outs_1_valid;
  wire  fork46_outs_1_ready;
  wire [4:0] trunci32_outs;
  wire  trunci32_outs_valid;
  wire  trunci32_outs_ready;
  wire [0:0] cmpi5_result;
  wire  cmpi5_result_valid;
  wire  cmpi5_result_ready;
  wire [0:0] fork47_outs_0;
  wire  fork47_outs_0_valid;
  wire  fork47_outs_0_ready;
  wire [0:0] fork47_outs_1;
  wire  fork47_outs_1_valid;
  wire  fork47_outs_1_ready;
  wire [0:0] fork47_outs_2;
  wire  fork47_outs_2_valid;
  wire  fork47_outs_2_ready;
  wire [0:0] fork47_outs_3;
  wire  fork47_outs_3_valid;
  wire  fork47_outs_3_ready;
  wire [0:0] fork47_outs_4;
  wire  fork47_outs_4_valid;
  wire  fork47_outs_4_ready;
  wire [4:0] cond_br30_trueOut;
  wire  cond_br30_trueOut_valid;
  wire  cond_br30_trueOut_ready;
  wire [4:0] cond_br30_falseOut;
  wire  cond_br30_falseOut_valid;
  wire  cond_br30_falseOut_ready;
  wire [31:0] cond_br31_trueOut;
  wire  cond_br31_trueOut_valid;
  wire  cond_br31_trueOut_ready;
  wire [31:0] cond_br31_falseOut;
  wire  cond_br31_falseOut_valid;
  wire  cond_br31_falseOut_ready;
  wire [7:0] trunci33_outs;
  wire  trunci33_outs_valid;
  wire  trunci33_outs_ready;
  wire [7:0] cond_br32_trueOut;
  wire  cond_br32_trueOut_valid;
  wire  cond_br32_trueOut_ready;
  wire [7:0] cond_br32_falseOut;
  wire  cond_br32_falseOut_valid;
  wire  cond_br32_falseOut_ready;
  wire [4:0] cond_br33_trueOut;
  wire  cond_br33_trueOut_valid;
  wire  cond_br33_trueOut_ready;
  wire [4:0] cond_br33_falseOut;
  wire  cond_br33_falseOut_valid;
  wire  cond_br33_falseOut_ready;
  wire  buffer86_outs_valid;
  wire  buffer86_outs_ready;
  wire  buffer87_outs_valid;
  wire  buffer87_outs_ready;
  wire  cond_br34_trueOut_valid;
  wire  cond_br34_trueOut_ready;
  wire  cond_br34_falseOut_valid;
  wire  cond_br34_falseOut_ready;
  wire [4:0] buffer90_outs;
  wire  buffer90_outs_valid;
  wire  buffer90_outs_ready;
  wire [4:0] buffer91_outs;
  wire  buffer91_outs_valid;
  wire  buffer91_outs_ready;
  wire [4:0] fork48_outs_0;
  wire  fork48_outs_0_valid;
  wire  fork48_outs_0_ready;
  wire [4:0] fork48_outs_1;
  wire  fork48_outs_1_valid;
  wire  fork48_outs_1_ready;
  wire [5:0] extsi91_outs;
  wire  extsi91_outs_valid;
  wire  extsi91_outs_ready;
  wire [3:0] trunci34_outs;
  wire  trunci34_outs_valid;
  wire  trunci34_outs_ready;
  wire  buffer94_outs_valid;
  wire  buffer94_outs_ready;
  wire  buffer95_outs_valid;
  wire  buffer95_outs_ready;
  wire  fork49_outs_0_valid;
  wire  fork49_outs_0_ready;
  wire  fork49_outs_1_valid;
  wire  fork49_outs_1_ready;
  wire [1:0] constant57_outs;
  wire  constant57_outs_valid;
  wire  constant57_outs_ready;
  wire [31:0] extsi40_outs;
  wire  extsi40_outs_valid;
  wire  extsi40_outs_ready;
  wire  source15_outs_valid;
  wire  source15_outs_ready;
  wire [4:0] constant58_outs;
  wire  constant58_outs_valid;
  wire  constant58_outs_ready;
  wire [5:0] extsi92_outs;
  wire  extsi92_outs_valid;
  wire  extsi92_outs_ready;
  wire  source16_outs_valid;
  wire  source16_outs_ready;
  wire [1:0] constant59_outs;
  wire  constant59_outs_valid;
  wire  constant59_outs_ready;
  wire [5:0] extsi93_outs;
  wire  extsi93_outs_valid;
  wire  extsi93_outs_ready;
  wire [7:0] buffer92_outs;
  wire  buffer92_outs_valid;
  wire  buffer92_outs_ready;
  wire [7:0] buffer93_outs;
  wire  buffer93_outs_valid;
  wire  buffer93_outs_ready;
  wire [3:0] store3_addrOut;
  wire  store3_addrOut_valid;
  wire  store3_addrOut_ready;
  wire [7:0] store3_dataToMem;
  wire  store3_dataToMem_valid;
  wire  store3_dataToMem_ready;
  wire [5:0] addi15_result;
  wire  addi15_result_valid;
  wire  addi15_result_ready;
  wire [5:0] fork50_outs_0;
  wire  fork50_outs_0_valid;
  wire  fork50_outs_0_ready;
  wire [5:0] fork50_outs_1;
  wire  fork50_outs_1_valid;
  wire  fork50_outs_1_ready;
  wire [4:0] trunci35_outs;
  wire  trunci35_outs_valid;
  wire  trunci35_outs_ready;
  wire [0:0] cmpi6_result;
  wire  cmpi6_result_valid;
  wire  cmpi6_result_ready;
  wire [0:0] fork51_outs_0;
  wire  fork51_outs_0_valid;
  wire  fork51_outs_0_ready;
  wire [0:0] fork51_outs_1;
  wire  fork51_outs_1_valid;
  wire  fork51_outs_1_ready;
  wire [0:0] fork51_outs_2;
  wire  fork51_outs_2_valid;
  wire  fork51_outs_2_ready;
  wire [4:0] cond_br35_trueOut;
  wire  cond_br35_trueOut_valid;
  wire  cond_br35_trueOut_ready;
  wire [4:0] cond_br35_falseOut;
  wire  cond_br35_falseOut_valid;
  wire  cond_br35_falseOut_ready;
  wire [7:0] buffer88_outs;
  wire  buffer88_outs_valid;
  wire  buffer88_outs_ready;
  wire [7:0] buffer89_outs;
  wire  buffer89_outs_valid;
  wire  buffer89_outs_ready;
  wire [7:0] cond_br36_trueOut;
  wire  cond_br36_trueOut_valid;
  wire  cond_br36_trueOut_ready;
  wire [7:0] cond_br36_falseOut;
  wire  cond_br36_falseOut_valid;
  wire  cond_br36_falseOut_ready;
  wire  cond_br37_trueOut_valid;
  wire  cond_br37_trueOut_ready;
  wire  cond_br37_falseOut_valid;
  wire  cond_br37_falseOut_ready;
  wire  buffer96_outs_valid;
  wire  buffer96_outs_ready;
  wire  buffer97_outs_valid;
  wire  buffer97_outs_ready;
  wire  fork52_outs_0_valid;
  wire  fork52_outs_0_ready;
  wire  fork52_outs_1_valid;
  wire  fork52_outs_1_ready;
  wire  fork52_outs_2_valid;
  wire  fork52_outs_2_ready;
  wire  fork52_outs_3_valid;
  wire  fork52_outs_3_ready;
  wire  fork52_outs_4_valid;
  wire  fork52_outs_4_ready;
  wire  fork52_outs_5_valid;
  wire  fork52_outs_5_ready;
  wire  fork52_outs_6_valid;
  wire  fork52_outs_6_ready;
  wire  fork52_outs_7_valid;
  wire  fork52_outs_7_ready;
  wire  fork52_outs_8_valid;
  wire  fork52_outs_8_ready;

  assign u1_end_valid = mem_controller17_memEnd_valid;
  assign mem_controller17_memEnd_ready = u1_end_ready;
  assign v1_end_valid = mem_controller16_memEnd_valid;
  assign mem_controller16_memEnd_ready = v1_end_ready;
  assign u2_end_valid = mem_controller15_memEnd_valid;
  assign mem_controller15_memEnd_ready = u2_end_ready;
  assign v2_end_valid = mem_controller14_memEnd_valid;
  assign mem_controller14_memEnd_ready = v2_end_ready;
  assign y_end_valid = mem_controller13_memEnd_valid;
  assign mem_controller13_memEnd_ready = y_end_ready;
  assign z_end_valid = mem_controller12_memEnd_valid;
  assign mem_controller12_memEnd_ready = z_end_ready;
  assign a_end_valid = mem_controller11_memEnd_valid;
  assign mem_controller11_memEnd_ready = a_end_ready;
  assign w_end_valid = mem_controller10_memEnd_valid;
  assign mem_controller10_memEnd_ready = w_end_ready;
  assign x_end_valid = mem_controller9_memEnd_valid;
  assign mem_controller9_memEnd_ready = x_end_ready;
  assign end_valid = fork0_outs_1_valid;
  assign fork0_outs_1_ready = end_ready;
  assign u1_loadEn = mem_controller17_loadEn;
  assign u1_loadAddr = mem_controller17_loadAddr;
  assign u1_storeEn = mem_controller17_storeEn;
  assign u1_storeAddr = mem_controller17_storeAddr;
  assign u1_storeData = mem_controller17_storeData;
  assign v1_loadEn = mem_controller16_loadEn;
  assign v1_loadAddr = mem_controller16_loadAddr;
  assign v1_storeEn = mem_controller16_storeEn;
  assign v1_storeAddr = mem_controller16_storeAddr;
  assign v1_storeData = mem_controller16_storeData;
  assign u2_loadEn = mem_controller15_loadEn;
  assign u2_loadAddr = mem_controller15_loadAddr;
  assign u2_storeEn = mem_controller15_storeEn;
  assign u2_storeAddr = mem_controller15_storeAddr;
  assign u2_storeData = mem_controller15_storeData;
  assign v2_loadEn = mem_controller14_loadEn;
  assign v2_loadAddr = mem_controller14_loadAddr;
  assign v2_storeEn = mem_controller14_storeEn;
  assign v2_storeAddr = mem_controller14_storeAddr;
  assign v2_storeData = mem_controller14_storeData;
  assign y_loadEn = mem_controller13_loadEn;
  assign y_loadAddr = mem_controller13_loadAddr;
  assign y_storeEn = mem_controller13_storeEn;
  assign y_storeAddr = mem_controller13_storeAddr;
  assign y_storeData = mem_controller13_storeData;
  assign z_loadEn = mem_controller12_loadEn;
  assign z_loadAddr = mem_controller12_loadAddr;
  assign z_storeEn = mem_controller12_storeEn;
  assign z_storeAddr = mem_controller12_storeAddr;
  assign z_storeData = mem_controller12_storeData;
  assign a_loadEn = mem_controller11_loadEn;
  assign a_loadAddr = mem_controller11_loadAddr;
  assign a_storeEn = mem_controller11_storeEn;
  assign a_storeAddr = mem_controller11_storeAddr;
  assign a_storeData = mem_controller11_storeData;
  assign w_loadEn = mem_controller10_loadEn;
  assign w_loadAddr = mem_controller10_loadAddr;
  assign w_storeEn = mem_controller10_storeEn;
  assign w_storeAddr = mem_controller10_storeAddr;
  assign w_storeData = mem_controller10_storeData;
  assign x_loadEn = mem_controller9_loadEn;
  assign x_loadAddr = mem_controller9_loadAddr;
  assign x_storeEn = mem_controller9_storeEn;
  assign x_storeAddr = mem_controller9_storeAddr;
  assign x_storeData = mem_controller9_storeData;

  fork_dataless #(.SIZE(3)) fork0(
    .ins_valid (start_valid),
    .ins_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready})
  );

  mem_controller #(.NUM_CONTROLS(2), .NUM_LOADS(3), .NUM_STORES(2), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller9(
    .loadData (x_loadData),
    .memStart_valid (x_start_valid),
    .memStart_ready (x_start_ready),
    .ldAddr ({load12_addrOut, load8_addrOut, load5_addrOut}),
    .ldAddr_valid ({load12_addrOut_valid, load8_addrOut_valid, load5_addrOut_valid}),
    .ldAddr_ready ({load12_addrOut_ready, load8_addrOut_ready, load5_addrOut_ready}),
    .ctrl ({extsi32_outs, extsi28_outs}),
    .ctrl_valid ({extsi32_outs_valid, extsi28_outs_valid}),
    .ctrl_ready ({extsi32_outs_ready, extsi28_outs_ready}),
    .stAddr ({store2_addrOut, store1_addrOut}),
    .stAddr_valid ({store2_addrOut_valid, store1_addrOut_valid}),
    .stAddr_ready ({store2_addrOut_ready, store1_addrOut_ready}),
    .stData ({store2_dataToMem, store1_dataToMem}),
    .stData_valid ({store2_dataToMem_valid, store1_dataToMem_valid}),
    .stData_ready ({store2_dataToMem_ready, store1_dataToMem_ready}),
    .ctrlEnd_valid (fork52_outs_8_valid),
    .ctrlEnd_ready (fork52_outs_8_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller9_ldData_2, mem_controller9_ldData_1, mem_controller9_ldData_0}),
    .ldData_valid ({mem_controller9_ldData_2_valid, mem_controller9_ldData_1_valid, mem_controller9_ldData_0_valid}),
    .ldData_ready ({mem_controller9_ldData_2_ready, mem_controller9_ldData_1_ready, mem_controller9_ldData_0_ready}),
    .memEnd_valid (mem_controller9_memEnd_valid),
    .memEnd_ready (mem_controller9_memEnd_ready),
    .loadEn (mem_controller9_loadEn),
    .loadAddr (mem_controller9_loadAddr),
    .storeEn (mem_controller9_storeEn),
    .storeAddr (mem_controller9_storeAddr),
    .storeData (mem_controller9_storeData)
  );

  mem_controller #(.NUM_CONTROLS(1), .NUM_LOADS(1), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller10(
    .loadData (w_loadData),
    .memStart_valid (w_start_valid),
    .memStart_ready (w_start_ready),
    .ldAddr ({load10_addrOut}),
    .ldAddr_valid ({load10_addrOut_valid}),
    .ldAddr_ready ({load10_addrOut_ready}),
    .ctrl ({extsi40_outs}),
    .ctrl_valid ({extsi40_outs_valid}),
    .ctrl_ready ({extsi40_outs_ready}),
    .stAddr ({store3_addrOut}),
    .stAddr_valid ({store3_addrOut_valid}),
    .stAddr_ready ({store3_addrOut_ready}),
    .stData ({store3_dataToMem}),
    .stData_valid ({store3_dataToMem_valid}),
    .stData_ready ({store3_dataToMem_ready}),
    .ctrlEnd_valid (fork52_outs_7_valid),
    .ctrlEnd_ready (fork52_outs_7_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller10_ldData_0}),
    .ldData_valid ({mem_controller10_ldData_0_valid}),
    .ldData_ready ({mem_controller10_ldData_0_ready}),
    .memEnd_valid (mem_controller10_memEnd_valid),
    .memEnd_ready (mem_controller10_memEnd_ready),
    .loadEn (mem_controller10_loadEn),
    .loadAddr (mem_controller10_loadAddr),
    .storeEn (mem_controller10_storeEn),
    .storeAddr (mem_controller10_storeAddr),
    .storeData (mem_controller10_storeData)
  );

  mem_controller #(.NUM_CONTROLS(1), .NUM_LOADS(3), .NUM_STORES(1), .DATA_TYPE(8), .ADDR_TYPE(7)) mem_controller11(
    .loadData (a_loadData),
    .memStart_valid (a_start_valid),
    .memStart_ready (a_start_ready),
    .ctrl ({extsi17_outs}),
    .ctrl_valid ({extsi17_outs_valid}),
    .ctrl_ready ({extsi17_outs_ready}),
    .ldAddr ({load11_addrOut, load6_addrOut, load0_addrOut}),
    .ldAddr_valid ({load11_addrOut_valid, load6_addrOut_valid, load0_addrOut_valid}),
    .ldAddr_ready ({load11_addrOut_ready, load6_addrOut_ready, load0_addrOut_ready}),
    .stAddr ({store0_addrOut}),
    .stAddr_valid ({store0_addrOut_valid}),
    .stAddr_ready ({store0_addrOut_ready}),
    .stData ({store0_dataToMem}),
    .stData_valid ({store0_dataToMem_valid}),
    .stData_ready ({store0_dataToMem_ready}),
    .ctrlEnd_valid (fork52_outs_6_valid),
    .ctrlEnd_ready (fork52_outs_6_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller11_ldData_2, mem_controller11_ldData_1, mem_controller11_ldData_0}),
    .ldData_valid ({mem_controller11_ldData_2_valid, mem_controller11_ldData_1_valid, mem_controller11_ldData_0_valid}),
    .ldData_ready ({mem_controller11_ldData_2_ready, mem_controller11_ldData_1_ready, mem_controller11_ldData_0_ready}),
    .memEnd_valid (mem_controller11_memEnd_valid),
    .memEnd_ready (mem_controller11_memEnd_ready),
    .loadEn (mem_controller11_loadEn),
    .loadAddr (mem_controller11_loadAddr),
    .storeEn (mem_controller11_storeEn),
    .storeAddr (mem_controller11_storeAddr),
    .storeData (mem_controller11_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller12(
    .loadData (z_loadData),
    .memStart_valid (z_start_valid),
    .memStart_ready (z_start_ready),
    .ldAddr ({load9_addrOut}),
    .ldAddr_valid ({load9_addrOut_valid}),
    .ldAddr_ready ({load9_addrOut_ready}),
    .ctrlEnd_valid (fork52_outs_5_valid),
    .ctrlEnd_ready (fork52_outs_5_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller12_ldData_0}),
    .ldData_valid ({mem_controller12_ldData_0_valid}),
    .ldData_ready ({mem_controller12_ldData_0_ready}),
    .memEnd_valid (mem_controller12_memEnd_valid),
    .memEnd_ready (mem_controller12_memEnd_ready),
    .loadEn (mem_controller12_loadEn),
    .loadAddr (mem_controller12_loadAddr),
    .storeEn (mem_controller12_storeEn),
    .storeAddr (mem_controller12_storeAddr),
    .storeData (mem_controller12_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller13(
    .loadData (y_loadData),
    .memStart_valid (y_start_valid),
    .memStart_ready (y_start_ready),
    .ldAddr ({load7_addrOut}),
    .ldAddr_valid ({load7_addrOut_valid}),
    .ldAddr_ready ({load7_addrOut_ready}),
    .ctrlEnd_valid (fork52_outs_4_valid),
    .ctrlEnd_ready (fork52_outs_4_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller13_ldData_0}),
    .ldData_valid ({mem_controller13_ldData_0_valid}),
    .ldData_ready ({mem_controller13_ldData_0_ready}),
    .memEnd_valid (mem_controller13_memEnd_valid),
    .memEnd_ready (mem_controller13_memEnd_ready),
    .loadEn (mem_controller13_loadEn),
    .loadAddr (mem_controller13_loadAddr),
    .storeEn (mem_controller13_storeEn),
    .storeAddr (mem_controller13_storeAddr),
    .storeData (mem_controller13_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller14(
    .loadData (v2_loadData),
    .memStart_valid (v2_start_valid),
    .memStart_ready (v2_start_ready),
    .ldAddr ({load4_addrOut}),
    .ldAddr_valid ({load4_addrOut_valid}),
    .ldAddr_ready ({load4_addrOut_ready}),
    .ctrlEnd_valid (fork52_outs_3_valid),
    .ctrlEnd_ready (fork52_outs_3_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller14_ldData_0}),
    .ldData_valid ({mem_controller14_ldData_0_valid}),
    .ldData_ready ({mem_controller14_ldData_0_ready}),
    .memEnd_valid (mem_controller14_memEnd_valid),
    .memEnd_ready (mem_controller14_memEnd_ready),
    .loadEn (mem_controller14_loadEn),
    .loadAddr (mem_controller14_loadAddr),
    .storeEn (mem_controller14_storeEn),
    .storeAddr (mem_controller14_storeAddr),
    .storeData (mem_controller14_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller15(
    .loadData (u2_loadData),
    .memStart_valid (u2_start_valid),
    .memStart_ready (u2_start_ready),
    .ldAddr ({load3_addrOut}),
    .ldAddr_valid ({load3_addrOut_valid}),
    .ldAddr_ready ({load3_addrOut_ready}),
    .ctrlEnd_valid (fork52_outs_2_valid),
    .ctrlEnd_ready (fork52_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller15_ldData_0}),
    .ldData_valid ({mem_controller15_ldData_0_valid}),
    .ldData_ready ({mem_controller15_ldData_0_ready}),
    .memEnd_valid (mem_controller15_memEnd_valid),
    .memEnd_ready (mem_controller15_memEnd_ready),
    .loadEn (mem_controller15_loadEn),
    .loadAddr (mem_controller15_loadAddr),
    .storeEn (mem_controller15_storeEn),
    .storeAddr (mem_controller15_storeAddr),
    .storeData (mem_controller15_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller16(
    .loadData (v1_loadData),
    .memStart_valid (v1_start_valid),
    .memStart_ready (v1_start_ready),
    .ldAddr ({load2_addrOut}),
    .ldAddr_valid ({load2_addrOut_valid}),
    .ldAddr_ready ({load2_addrOut_ready}),
    .ctrlEnd_valid (fork52_outs_1_valid),
    .ctrlEnd_ready (fork52_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller16_ldData_0}),
    .ldData_valid ({mem_controller16_ldData_0_valid}),
    .ldData_ready ({mem_controller16_ldData_0_ready}),
    .memEnd_valid (mem_controller16_memEnd_valid),
    .memEnd_ready (mem_controller16_memEnd_ready),
    .loadEn (mem_controller16_loadEn),
    .loadAddr (mem_controller16_loadAddr),
    .storeEn (mem_controller16_storeEn),
    .storeAddr (mem_controller16_storeAddr),
    .storeData (mem_controller16_storeData)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(8), .ADDR_TYPE(4)) mem_controller17(
    .loadData (u1_loadData),
    .memStart_valid (u1_start_valid),
    .memStart_ready (u1_start_ready),
    .ldAddr ({load1_addrOut}),
    .ldAddr_valid ({load1_addrOut_valid}),
    .ldAddr_ready ({load1_addrOut_ready}),
    .ctrlEnd_valid (fork52_outs_0_valid),
    .ctrlEnd_ready (fork52_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .ldData ({mem_controller17_ldData_0}),
    .ldData_valid ({mem_controller17_ldData_0_valid}),
    .ldData_ready ({mem_controller17_ldData_0_ready}),
    .memEnd_valid (mem_controller17_memEnd_valid),
    .memEnd_ready (mem_controller17_memEnd_ready),
    .loadEn (mem_controller17_loadEn),
    .loadAddr (mem_controller17_loadAddr),
    .storeEn (mem_controller17_storeEn),
    .storeAddr (mem_controller17_storeAddr),
    .storeData (mem_controller17_storeData)
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant32(
    .ctrl_valid (fork0_outs_0_valid),
    .ctrl_ready (fork0_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant32_outs),
    .outs_valid (constant32_outs_valid),
    .outs_ready (constant32_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi49(
    .ins (constant32_outs),
    .ins_valid (constant32_outs_valid),
    .ins_ready (constant32_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi49_outs),
    .outs_valid (extsi49_outs_valid),
    .outs_ready (extsi49_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux0(
    .index (fork1_outs_0),
    .index_valid (fork1_outs_0_valid),
    .index_ready (fork1_outs_0_ready),
    .ins ({cond_br12_trueOut, extsi49_outs}),
    .ins_valid ({cond_br12_trueOut_valid, extsi49_outs_valid}),
    .ins_ready ({cond_br12_trueOut_ready, extsi49_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux0_outs),
    .outs_valid (mux0_outs_valid),
    .outs_ready (mux0_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux1(
    .index (fork1_outs_1),
    .index_valid (fork1_outs_1_valid),
    .index_ready (fork1_outs_1_ready),
    .ins ({cond_br13_trueOut, alpha}),
    .ins_valid ({cond_br13_trueOut_valid, alpha_valid}),
    .ins_ready ({cond_br13_trueOut_ready, alpha_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux1_outs),
    .outs_valid (mux1_outs_valid),
    .outs_ready (mux1_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux2(
    .index (fork1_outs_2),
    .index_valid (fork1_outs_2_valid),
    .index_ready (fork1_outs_2_ready),
    .ins ({cond_br14_trueOut, beta}),
    .ins_valid ({cond_br14_trueOut_valid, beta_valid}),
    .ins_ready ({cond_br14_trueOut_ready, beta_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux2_outs),
    .outs_valid (mux2_outs_valid),
    .outs_ready (mux2_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .ins_valid ({cond_br15_trueOut_valid, fork0_outs_2_valid}),
    .ins_ready ({cond_br15_trueOut_ready, fork0_outs_2_ready}),
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

  handshake_constant_0 #(.DATA_WIDTH(1)) constant33(
    .ctrl_valid (fork2_outs_0_valid),
    .ctrl_ready (fork2_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant33_outs),
    .outs_valid (constant33_outs_valid),
    .outs_ready (constant33_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi48(
    .ins (constant33_outs),
    .ins_valid (constant33_outs_valid),
    .ins_ready (constant33_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi48_outs),
    .outs_valid (extsi48_outs_valid),
    .outs_ready (extsi48_outs_ready)
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
    .index (fork6_outs_1),
    .index_valid (fork6_outs_1_valid),
    .index_ready (fork6_outs_1_ready),
    .ins ({cond_br7_trueOut, extsi48_outs}),
    .ins_valid ({cond_br7_trueOut_valid, extsi48_outs_valid}),
    .ins_ready ({cond_br7_trueOut_ready, extsi48_outs_ready}),
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

  fork_type #(.SIZE(5), .DATA_TYPE(5)) fork3(
    .ins (buffer9_outs),
    .ins_valid (buffer9_outs_valid),
    .ins_ready (buffer9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork3_outs_4, fork3_outs_3, fork3_outs_2, fork3_outs_1, fork3_outs_0}),
    .outs_valid ({fork3_outs_4_valid, fork3_outs_3_valid, fork3_outs_2_valid, fork3_outs_1_valid, fork3_outs_0_valid}),
    .outs_ready ({fork3_outs_4_ready, fork3_outs_3_ready, fork3_outs_2_ready, fork3_outs_1_ready, fork3_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi50(
    .ins (fork3_outs_0),
    .ins_valid (fork3_outs_0_valid),
    .ins_ready (fork3_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi50_outs),
    .outs_valid (extsi50_outs_valid),
    .outs_ready (extsi50_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi51(
    .ins (fork3_outs_1),
    .ins_valid (fork3_outs_1_valid),
    .ins_ready (fork3_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi51_outs),
    .outs_valid (extsi51_outs_valid),
    .outs_ready (extsi51_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi52(
    .ins (fork3_outs_4),
    .ins_valid (fork3_outs_4_valid),
    .ins_ready (fork3_outs_4_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi52_outs),
    .outs_valid (extsi52_outs_valid),
    .outs_ready (extsi52_outs_ready)
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

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux4(
    .index (fork6_outs_2),
    .index_valid (fork6_outs_2_valid),
    .index_ready (fork6_outs_2_ready),
    .ins ({cond_br8_trueOut, buffer3_outs}),
    .ins_valid ({cond_br8_trueOut_valid, buffer3_outs_valid}),
    .ins_ready ({cond_br8_trueOut_ready, buffer3_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux4_outs),
    .outs_valid (mux4_outs_valid),
    .outs_ready (mux4_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux5(
    .index (fork6_outs_3),
    .index_valid (fork6_outs_3_valid),
    .index_ready (fork6_outs_3_ready),
    .ins ({cond_br9_trueOut, buffer5_outs}),
    .ins_valid ({cond_br9_trueOut_valid, buffer5_outs_valid}),
    .ins_ready ({cond_br9_trueOut_ready, buffer5_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux5_outs),
    .outs_valid (mux5_outs_valid),
    .outs_ready (mux5_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux6(
    .index (fork6_outs_0),
    .index_valid (fork6_outs_0_valid),
    .index_ready (fork6_outs_0_ready),
    .ins ({cond_br10_trueOut, buffer1_outs}),
    .ins_valid ({cond_br10_trueOut_valid, buffer1_outs_valid}),
    .ins_ready ({cond_br10_trueOut_ready, buffer1_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux6_outs),
    .outs_valid (mux6_outs_valid),
    .outs_ready (mux6_outs_ready)
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

  fork_type #(.SIZE(4), .DATA_TYPE(5)) fork4(
    .ins (buffer15_outs),
    .ins_valid (buffer15_outs_valid),
    .ins_ready (buffer15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork4_outs_3, fork4_outs_2, fork4_outs_1, fork4_outs_0}),
    .outs_valid ({fork4_outs_3_valid, fork4_outs_2_valid, fork4_outs_1_valid, fork4_outs_0_valid}),
    .outs_ready ({fork4_outs_3_ready, fork4_outs_2_ready, fork4_outs_1_ready, fork4_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi53(
    .ins (fork4_outs_3),
    .ins_valid (fork4_outs_3_valid),
    .ins_ready (fork4_outs_3_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi53_outs),
    .outs_valid (extsi53_outs_valid),
    .outs_ready (extsi53_outs_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(32)) fork5(
    .ins (extsi53_outs),
    .ins_valid (extsi53_outs_valid),
    .ins_ready (extsi53_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork5_outs_3, fork5_outs_2, fork5_outs_1, fork5_outs_0}),
    .outs_valid ({fork5_outs_3_valid, fork5_outs_2_valid, fork5_outs_1_valid, fork5_outs_0_valid}),
    .outs_ready ({fork5_outs_3_ready, fork5_outs_2_ready, fork5_outs_1_ready, fork5_outs_0_ready})
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

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci7(
    .ins (fork4_outs_1),
    .ins_valid (fork4_outs_1_valid),
    .ins_ready (fork4_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci7_outs),
    .outs_valid (trunci7_outs_valid),
    .outs_ready (trunci7_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge1(
    .ins_valid ({cond_br11_trueOut_valid, fork2_outs_1_valid}),
    .ins_ready ({cond_br11_trueOut_ready, fork2_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge1_outs_valid),
    .outs_ready (control_merge1_outs_ready),
    .index (control_merge1_index),
    .index_valid (control_merge1_index_valid),
    .index_ready (control_merge1_index_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork6(
    .ins (control_merge1_index),
    .ins_valid (control_merge1_index_valid),
    .ins_ready (control_merge1_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork6_outs_3, fork6_outs_2, fork6_outs_1, fork6_outs_0}),
    .outs_valid ({fork6_outs_3_valid, fork6_outs_2_valid, fork6_outs_1_valid, fork6_outs_0_valid}),
    .outs_ready ({fork6_outs_3_ready, fork6_outs_2_ready, fork6_outs_1_ready, fork6_outs_0_ready})
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

  fork_dataless #(.SIZE(2)) fork7(
    .ins_valid (buffer17_outs_valid),
    .ins_ready (buffer17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork7_outs_1_valid, fork7_outs_0_valid}),
    .outs_ready ({fork7_outs_1_ready, fork7_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant34(
    .ctrl_valid (fork7_outs_0_valid),
    .ctrl_ready (fork7_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant34_outs),
    .outs_valid (constant34_outs_valid),
    .outs_ready (constant34_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi17(
    .ins (constant34_outs),
    .ins_valid (constant34_outs_valid),
    .ins_ready (constant34_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi17_outs),
    .outs_valid (extsi17_outs_valid),
    .outs_ready (extsi17_outs_ready)
  );

  source source0(
    .clk (clk),
    .rst (rst),
    .outs_valid (source0_outs_valid),
    .outs_ready (source0_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant35(
    .ctrl_valid (source0_outs_valid),
    .ctrl_ready (source0_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant35_outs),
    .outs_valid (constant35_outs_valid),
    .outs_ready (constant35_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi54(
    .ins (constant35_outs),
    .ins_valid (constant35_outs_valid),
    .ins_ready (constant35_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi54_outs),
    .outs_valid (extsi54_outs_valid),
    .outs_ready (extsi54_outs_ready)
  );

  source source1(
    .clk (clk),
    .rst (rst),
    .outs_valid (source1_outs_valid),
    .outs_ready (source1_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant36(
    .ctrl_valid (source1_outs_valid),
    .ctrl_ready (source1_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant36_outs),
    .outs_valid (constant36_outs_valid),
    .outs_ready (constant36_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork8(
    .ins (constant36_outs),
    .ins_valid (constant36_outs_valid),
    .ins_ready (constant36_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork8_outs_1, fork8_outs_0}),
    .outs_valid ({fork8_outs_1_valid, fork8_outs_0_valid}),
    .outs_ready ({fork8_outs_1_ready, fork8_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi55(
    .ins (fork8_outs_0),
    .ins_valid (fork8_outs_0_valid),
    .ins_ready (fork8_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi55_outs),
    .outs_valid (extsi55_outs_valid),
    .outs_ready (extsi55_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi19(
    .ins (fork8_outs_1),
    .ins_valid (fork8_outs_1_valid),
    .ins_ready (fork8_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi19_outs),
    .outs_valid (extsi19_outs_valid),
    .outs_ready (extsi19_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork9(
    .ins (extsi19_outs),
    .ins_valid (extsi19_outs_valid),
    .ins_ready (extsi19_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork9_outs_1, fork9_outs_0}),
    .outs_valid ({fork9_outs_1_valid, fork9_outs_0_valid}),
    .outs_ready ({fork9_outs_1_ready, fork9_outs_0_ready})
  );

  source source2(
    .clk (clk),
    .rst (rst),
    .outs_valid (source2_outs_valid),
    .outs_ready (source2_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant37(
    .ctrl_valid (source2_outs_valid),
    .ctrl_ready (source2_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant37_outs),
    .outs_valid (constant37_outs_valid),
    .outs_ready (constant37_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi20(
    .ins (constant37_outs),
    .ins_valid (constant37_outs_valid),
    .ins_ready (constant37_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi20_outs),
    .outs_valid (extsi20_outs_valid),
    .outs_ready (extsi20_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork10(
    .ins (extsi20_outs),
    .ins_valid (extsi20_outs_valid),
    .ins_ready (extsi20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork10_outs_1, fork10_outs_0}),
    .outs_valid ({fork10_outs_1_valid, fork10_outs_0_valid}),
    .outs_ready ({fork10_outs_1_ready, fork10_outs_0_ready})
  );

  shli #(.DATA_TYPE(32)) shli0(
    .lhs (fork5_outs_0),
    .lhs_valid (fork5_outs_0_valid),
    .lhs_ready (fork5_outs_0_ready),
    .rhs (fork9_outs_0),
    .rhs_valid (fork9_outs_0_valid),
    .rhs_ready (fork9_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .result (shli0_result),
    .result_valid (shli0_result_valid),
    .result_ready (shli0_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci8(
    .ins (shli0_result),
    .ins_valid (shli0_result_valid),
    .ins_ready (shli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci8_outs),
    .outs_valid (trunci8_outs_valid),
    .outs_ready (trunci8_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli1(
    .lhs (fork5_outs_1),
    .lhs_valid (fork5_outs_1_valid),
    .lhs_ready (fork5_outs_1_ready),
    .rhs (fork10_outs_0),
    .rhs_valid (fork10_outs_0_valid),
    .rhs_ready (fork10_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .result (shli1_result),
    .result_valid (shli1_result_valid),
    .result_ready (shli1_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci9(
    .ins (shli1_result),
    .ins_valid (shli1_result_valid),
    .ins_ready (shli1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci9_outs),
    .outs_valid (trunci9_outs_valid),
    .outs_ready (trunci9_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi16(
    .lhs (trunci8_outs),
    .lhs_valid (trunci8_outs_valid),
    .lhs_ready (trunci8_outs_ready),
    .rhs (trunci9_outs),
    .rhs_valid (trunci9_outs_valid),
    .rhs_ready (trunci9_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi16_result),
    .result_valid (addi16_result_valid),
    .result_ready (addi16_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi5(
    .lhs (extsi50_outs),
    .lhs_valid (extsi50_outs_valid),
    .lhs_ready (extsi50_outs_ready),
    .rhs (addi16_result),
    .rhs_valid (addi16_result_valid),
    .rhs_ready (addi16_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi5_result),
    .result_valid (addi5_result_valid),
    .result_ready (addi5_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load0(
    .addrIn (addi5_result),
    .addrIn_valid (addi5_result_valid),
    .addrIn_ready (addi5_result_ready),
    .dataFromMem (mem_controller11_ldData_0),
    .dataFromMem_valid (mem_controller11_ldData_0_valid),
    .dataFromMem_ready (mem_controller11_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load0_addrOut),
    .addrOut_valid (load0_addrOut_valid),
    .addrOut_ready (load0_addrOut_ready),
    .dataOut (load0_dataOut),
    .dataOut_valid (load0_dataOut_valid),
    .dataOut_ready (load0_dataOut_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load1(
    .addrIn (trunci7_outs),
    .addrIn_valid (trunci7_outs_valid),
    .addrIn_ready (trunci7_outs_ready),
    .dataFromMem (mem_controller17_ldData_0),
    .dataFromMem_valid (mem_controller17_ldData_0_valid),
    .dataFromMem_ready (mem_controller17_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load1_addrOut),
    .addrOut_valid (load1_addrOut_valid),
    .addrOut_ready (load1_addrOut_ready),
    .dataOut (load1_dataOut),
    .dataOut_valid (load1_dataOut_valid),
    .dataOut_ready (load1_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi56(
    .ins (load1_dataOut),
    .ins_valid (load1_dataOut_valid),
    .ins_ready (load1_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi56_outs),
    .outs_valid (extsi56_outs_valid),
    .outs_ready (extsi56_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load2(
    .addrIn (trunci5_outs),
    .addrIn_valid (trunci5_outs_valid),
    .addrIn_ready (trunci5_outs_ready),
    .dataFromMem (mem_controller16_ldData_0),
    .dataFromMem_valid (mem_controller16_ldData_0_valid),
    .dataFromMem_ready (mem_controller16_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load2_addrOut),
    .addrOut_valid (load2_addrOut_valid),
    .addrOut_ready (load2_addrOut_ready),
    .dataOut (load2_dataOut),
    .dataOut_valid (load2_dataOut_valid),
    .dataOut_ready (load2_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi57(
    .ins (load2_dataOut),
    .ins_valid (load2_dataOut_valid),
    .ins_ready (load2_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi57_outs),
    .outs_valid (extsi57_outs_valid),
    .outs_ready (extsi57_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli0(
    .lhs (extsi56_outs),
    .lhs_valid (extsi56_outs_valid),
    .lhs_ready (extsi56_outs_ready),
    .rhs (extsi57_outs),
    .rhs_valid (extsi57_outs_valid),
    .rhs_ready (extsi57_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli0_result),
    .result_valid (muli0_result_valid),
    .result_ready (muli0_result_ready)
  );

  trunci #(.INPUT_TYPE(16), .OUTPUT_TYPE(8)) trunci10(
    .ins (muli0_result),
    .ins_valid (muli0_result_valid),
    .ins_ready (muli0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci10_outs),
    .outs_valid (trunci10_outs_valid),
    .outs_ready (trunci10_outs_ready)
  );

  addi #(.DATA_TYPE(8)) addi0(
    .lhs (load0_dataOut),
    .lhs_valid (load0_dataOut_valid),
    .lhs_ready (load0_dataOut_ready),
    .rhs (trunci10_outs),
    .rhs_valid (trunci10_outs_valid),
    .rhs_ready (trunci10_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi0_result),
    .result_valid (addi0_result_valid),
    .result_ready (addi0_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load3(
    .addrIn (trunci6_outs),
    .addrIn_valid (trunci6_outs_valid),
    .addrIn_ready (trunci6_outs_ready),
    .dataFromMem (mem_controller15_ldData_0),
    .dataFromMem_valid (mem_controller15_ldData_0_valid),
    .dataFromMem_ready (mem_controller15_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load3_addrOut),
    .addrOut_valid (load3_addrOut_valid),
    .addrOut_ready (load3_addrOut_ready),
    .dataOut (load3_dataOut),
    .dataOut_valid (load3_dataOut_valid),
    .dataOut_ready (load3_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi58(
    .ins (load3_dataOut),
    .ins_valid (load3_dataOut_valid),
    .ins_ready (load3_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi58_outs),
    .outs_valid (extsi58_outs_valid),
    .outs_ready (extsi58_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load4(
    .addrIn (trunci4_outs),
    .addrIn_valid (trunci4_outs_valid),
    .addrIn_ready (trunci4_outs_ready),
    .dataFromMem (mem_controller14_ldData_0),
    .dataFromMem_valid (mem_controller14_ldData_0_valid),
    .dataFromMem_ready (mem_controller14_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load4_addrOut),
    .addrOut_valid (load4_addrOut_valid),
    .addrOut_ready (load4_addrOut_ready),
    .dataOut (load4_dataOut),
    .dataOut_valid (load4_dataOut_valid),
    .dataOut_ready (load4_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi59(
    .ins (load4_dataOut),
    .ins_valid (load4_dataOut_valid),
    .ins_ready (load4_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi59_outs),
    .outs_valid (extsi59_outs_valid),
    .outs_ready (extsi59_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli1(
    .lhs (extsi58_outs),
    .lhs_valid (extsi58_outs_valid),
    .lhs_ready (extsi58_outs_ready),
    .rhs (extsi59_outs),
    .rhs_valid (extsi59_outs_valid),
    .rhs_ready (extsi59_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli1_result),
    .result_valid (muli1_result_valid),
    .result_ready (muli1_result_ready)
  );

  trunci #(.INPUT_TYPE(16), .OUTPUT_TYPE(8)) trunci11(
    .ins (muli1_result),
    .ins_valid (muli1_result_valid),
    .ins_ready (muli1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci11_outs),
    .outs_valid (trunci11_outs_valid),
    .outs_ready (trunci11_outs_ready)
  );

  addi #(.DATA_TYPE(8)) addi1(
    .lhs (addi0_result),
    .lhs_valid (addi0_result_valid),
    .lhs_ready (addi0_result_ready),
    .rhs (trunci11_outs),
    .rhs_valid (trunci11_outs_valid),
    .rhs_ready (trunci11_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi1_result),
    .result_valid (addi1_result_valid),
    .result_ready (addi1_result_ready)
  );

  shli #(.DATA_TYPE(32)) shli2(
    .lhs (fork5_outs_2),
    .lhs_valid (fork5_outs_2_valid),
    .lhs_ready (fork5_outs_2_ready),
    .rhs (fork9_outs_1),
    .rhs_valid (fork9_outs_1_valid),
    .rhs_ready (fork9_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .result (shli2_result),
    .result_valid (shli2_result_valid),
    .result_ready (shli2_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci12(
    .ins (shli2_result),
    .ins_valid (shli2_result_valid),
    .ins_ready (shli2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci12_outs),
    .outs_valid (trunci12_outs_valid),
    .outs_ready (trunci12_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli3(
    .lhs (fork5_outs_3),
    .lhs_valid (fork5_outs_3_valid),
    .lhs_ready (fork5_outs_3_ready),
    .rhs (fork10_outs_1),
    .rhs_valid (fork10_outs_1_valid),
    .rhs_ready (fork10_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .result (shli3_result),
    .result_valid (shli3_result_valid),
    .result_ready (shli3_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci13(
    .ins (shli3_result),
    .ins_valid (shli3_result_valid),
    .ins_ready (shli3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci13_outs),
    .outs_valid (trunci13_outs_valid),
    .outs_ready (trunci13_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi17(
    .lhs (trunci12_outs),
    .lhs_valid (trunci12_outs_valid),
    .lhs_ready (trunci12_outs_ready),
    .rhs (trunci13_outs),
    .rhs_valid (trunci13_outs_valid),
    .rhs_ready (trunci13_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi17_result),
    .result_valid (addi17_result_valid),
    .result_ready (addi17_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi6(
    .lhs (extsi51_outs),
    .lhs_valid (extsi51_outs_valid),
    .lhs_ready (extsi51_outs_ready),
    .rhs (addi17_result),
    .rhs_valid (addi17_result_valid),
    .rhs_ready (addi17_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi6_result),
    .result_valid (addi6_result_valid),
    .result_ready (addi6_result_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(7)) store0(
    .addrIn (addi6_result),
    .addrIn_valid (addi6_result_valid),
    .addrIn_ready (addi6_result_ready),
    .dataIn (addi1_result),
    .dataIn_valid (addi1_result_valid),
    .dataIn_ready (addi1_result_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store0_addrOut),
    .addrOut_valid (store0_addrOut_valid),
    .addrOut_ready (store0_addrOut_ready),
    .dataToMem (store0_dataToMem),
    .dataToMem_valid (store0_dataToMem_valid),
    .dataToMem_ready (store0_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi9(
    .lhs (extsi52_outs),
    .lhs_valid (extsi52_outs_valid),
    .lhs_ready (extsi52_outs_ready),
    .rhs (extsi55_outs),
    .rhs_valid (extsi55_outs_valid),
    .rhs_ready (extsi55_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi9_result),
    .result_valid (addi9_result_valid),
    .result_ready (addi9_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork11(
    .ins (addi9_result),
    .ins_valid (addi9_result_valid),
    .ins_ready (addi9_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork11_outs_1, fork11_outs_0}),
    .outs_valid ({fork11_outs_1_valid, fork11_outs_0_valid}),
    .outs_ready ({fork11_outs_1_ready, fork11_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci14(
    .ins (fork11_outs_0),
    .ins_valid (fork11_outs_0_valid),
    .ins_ready (fork11_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci14_outs),
    .outs_valid (trunci14_outs_valid),
    .outs_ready (trunci14_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi0(
    .lhs (fork11_outs_1),
    .lhs_valid (fork11_outs_1_valid),
    .lhs_ready (fork11_outs_1_ready),
    .rhs (extsi54_outs),
    .rhs_valid (extsi54_outs_valid),
    .rhs_ready (extsi54_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi0_result),
    .result_valid (cmpi0_result_valid),
    .result_ready (cmpi0_result_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork12(
    .ins (cmpi0_result),
    .ins_valid (cmpi0_result_valid),
    .ins_ready (cmpi0_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork12_outs_4, fork12_outs_3, fork12_outs_2, fork12_outs_1, fork12_outs_0}),
    .outs_valid ({fork12_outs_4_valid, fork12_outs_3_valid, fork12_outs_2_valid, fork12_outs_1_valid, fork12_outs_0_valid}),
    .outs_ready ({fork12_outs_4_ready, fork12_outs_3_ready, fork12_outs_2_ready, fork12_outs_1_ready, fork12_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br7(
    .condition (fork12_outs_0),
    .condition_valid (fork12_outs_0_valid),
    .condition_ready (fork12_outs_0_ready),
    .data (trunci14_outs),
    .data_valid (trunci14_outs_valid),
    .data_ready (trunci14_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br7_trueOut),
    .trueOut_valid (cond_br7_trueOut_valid),
    .trueOut_ready (cond_br7_trueOut_ready),
    .falseOut (cond_br7_falseOut),
    .falseOut_valid (cond_br7_falseOut_valid),
    .falseOut_ready (cond_br7_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink0(
    .ins (cond_br7_falseOut),
    .ins_valid (cond_br7_falseOut_valid),
    .ins_ready (cond_br7_falseOut_ready),
    .clk (clk),
    .rst (rst)
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

  cond_br #(.DATA_TYPE(8)) cond_br8(
    .condition (fork12_outs_2),
    .condition_valid (fork12_outs_2_valid),
    .condition_ready (fork12_outs_2_ready),
    .data (buffer11_outs),
    .data_valid (buffer11_outs_valid),
    .data_ready (buffer11_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br8_trueOut),
    .trueOut_valid (cond_br8_trueOut_valid),
    .trueOut_ready (cond_br8_trueOut_ready),
    .falseOut (cond_br8_falseOut),
    .falseOut_valid (cond_br8_falseOut_valid),
    .falseOut_ready (cond_br8_falseOut_ready)
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

  cond_br #(.DATA_TYPE(8)) cond_br9(
    .condition (fork12_outs_3),
    .condition_valid (fork12_outs_3_valid),
    .condition_ready (fork12_outs_3_ready),
    .data (buffer13_outs),
    .data_valid (buffer13_outs_valid),
    .data_ready (buffer13_outs_ready),
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
    .condition (fork12_outs_1),
    .condition_valid (fork12_outs_1_valid),
    .condition_ready (fork12_outs_1_ready),
    .data (fork4_outs_2),
    .data_valid (fork4_outs_2_valid),
    .data_ready (fork4_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br10_trueOut),
    .trueOut_valid (cond_br10_trueOut_valid),
    .trueOut_ready (cond_br10_trueOut_ready),
    .falseOut (cond_br10_falseOut),
    .falseOut_valid (cond_br10_falseOut_valid),
    .falseOut_ready (cond_br10_falseOut_ready)
  );

  cond_br_dataless cond_br11(
    .condition (fork12_outs_4),
    .condition_valid (fork12_outs_4_valid),
    .condition_ready (fork12_outs_4_ready),
    .data_valid (fork7_outs_1_valid),
    .data_ready (fork7_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br11_trueOut_valid),
    .trueOut_ready (cond_br11_trueOut_ready),
    .falseOut_valid (cond_br11_falseOut_valid),
    .falseOut_ready (cond_br11_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer22(
    .ins (cond_br10_falseOut),
    .ins_valid (cond_br10_falseOut_valid),
    .ins_ready (cond_br10_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer22_outs),
    .outs_valid (buffer22_outs_valid),
    .outs_ready (buffer22_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer23(
    .ins (buffer22_outs),
    .ins_valid (buffer22_outs_valid),
    .ins_ready (buffer22_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer23_outs),
    .outs_valid (buffer23_outs_valid),
    .outs_ready (buffer23_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi60(
    .ins (buffer23_outs),
    .ins_valid (buffer23_outs_valid),
    .ins_ready (buffer23_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi60_outs),
    .outs_valid (extsi60_outs_valid),
    .outs_ready (extsi60_outs_ready)
  );

  source source3(
    .clk (clk),
    .rst (rst),
    .outs_valid (source3_outs_valid),
    .outs_ready (source3_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant38(
    .ctrl_valid (source3_outs_valid),
    .ctrl_ready (source3_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant38_outs),
    .outs_valid (constant38_outs_valid),
    .outs_ready (constant38_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi61(
    .ins (constant38_outs),
    .ins_valid (constant38_outs_valid),
    .ins_ready (constant38_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi61_outs),
    .outs_valid (extsi61_outs_valid),
    .outs_ready (extsi61_outs_ready)
  );

  source source4(
    .clk (clk),
    .rst (rst),
    .outs_valid (source4_outs_valid),
    .outs_ready (source4_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant39(
    .ctrl_valid (source4_outs_valid),
    .ctrl_ready (source4_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant39_outs),
    .outs_valid (constant39_outs_valid),
    .outs_ready (constant39_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi62(
    .ins (constant39_outs),
    .ins_valid (constant39_outs_valid),
    .ins_ready (constant39_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi62_outs),
    .outs_valid (extsi62_outs_valid),
    .outs_ready (extsi62_outs_ready)
  );

  addi #(.DATA_TYPE(6)) addi10(
    .lhs (extsi60_outs),
    .lhs_valid (extsi60_outs_valid),
    .lhs_ready (extsi60_outs_ready),
    .rhs (extsi62_outs),
    .rhs_valid (extsi62_outs_valid),
    .rhs_ready (extsi62_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi10_result),
    .result_valid (addi10_result_valid),
    .result_ready (addi10_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork13(
    .ins (addi10_result),
    .ins_valid (addi10_result_valid),
    .ins_ready (addi10_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork13_outs_1, fork13_outs_0}),
    .outs_valid ({fork13_outs_1_valid, fork13_outs_0_valid}),
    .outs_ready ({fork13_outs_1_ready, fork13_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci15(
    .ins (fork13_outs_0),
    .ins_valid (fork13_outs_0_valid),
    .ins_ready (fork13_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci15_outs),
    .outs_valid (trunci15_outs_valid),
    .outs_ready (trunci15_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi1(
    .lhs (fork13_outs_1),
    .lhs_valid (fork13_outs_1_valid),
    .lhs_ready (fork13_outs_1_ready),
    .rhs (extsi61_outs),
    .rhs_valid (extsi61_outs_valid),
    .rhs_ready (extsi61_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi1_result),
    .result_valid (cmpi1_result_valid),
    .result_ready (cmpi1_result_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork14(
    .ins (cmpi1_result),
    .ins_valid (cmpi1_result_valid),
    .ins_ready (cmpi1_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork14_outs_3, fork14_outs_2, fork14_outs_1, fork14_outs_0}),
    .outs_valid ({fork14_outs_3_valid, fork14_outs_2_valid, fork14_outs_1_valid, fork14_outs_0_valid}),
    .outs_ready ({fork14_outs_3_ready, fork14_outs_2_ready, fork14_outs_1_ready, fork14_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br12(
    .condition (fork14_outs_0),
    .condition_valid (fork14_outs_0_valid),
    .condition_ready (fork14_outs_0_ready),
    .data (trunci15_outs),
    .data_valid (trunci15_outs_valid),
    .data_ready (trunci15_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br12_trueOut),
    .trueOut_valid (cond_br12_trueOut_valid),
    .trueOut_ready (cond_br12_trueOut_ready),
    .falseOut (cond_br12_falseOut),
    .falseOut_valid (cond_br12_falseOut_valid),
    .falseOut_ready (cond_br12_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink2(
    .ins (cond_br12_falseOut),
    .ins_valid (cond_br12_falseOut_valid),
    .ins_ready (cond_br12_falseOut_ready),
    .clk (clk),
    .rst (rst)
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

  cond_br #(.DATA_TYPE(8)) cond_br13(
    .condition (fork14_outs_1),
    .condition_valid (fork14_outs_1_valid),
    .condition_ready (fork14_outs_1_ready),
    .data (buffer19_outs),
    .data_valid (buffer19_outs_valid),
    .data_ready (buffer19_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br13_trueOut),
    .trueOut_valid (cond_br13_trueOut_valid),
    .trueOut_ready (cond_br13_trueOut_ready),
    .falseOut (cond_br13_falseOut),
    .falseOut_valid (cond_br13_falseOut_valid),
    .falseOut_ready (cond_br13_falseOut_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer20(
    .ins (cond_br9_falseOut),
    .ins_valid (cond_br9_falseOut_valid),
    .ins_ready (cond_br9_falseOut_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br14(
    .condition (fork14_outs_2),
    .condition_valid (fork14_outs_2_valid),
    .condition_ready (fork14_outs_2_ready),
    .data (buffer21_outs),
    .data_valid (buffer21_outs_valid),
    .data_ready (buffer21_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br14_trueOut),
    .trueOut_valid (cond_br14_trueOut_valid),
    .trueOut_ready (cond_br14_trueOut_ready),
    .falseOut (cond_br14_falseOut),
    .falseOut_valid (cond_br14_falseOut_valid),
    .falseOut_ready (cond_br14_falseOut_ready)
  );

  oehb_dataless buffer24(
    .ins_valid (cond_br11_falseOut_valid),
    .ins_ready (cond_br11_falseOut_ready),
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

  cond_br_dataless cond_br15(
    .condition (fork14_outs_3),
    .condition_valid (fork14_outs_3_valid),
    .condition_ready (fork14_outs_3_ready),
    .data_valid (buffer25_outs_valid),
    .data_ready (buffer25_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br15_trueOut_valid),
    .trueOut_ready (cond_br15_trueOut_ready),
    .falseOut_valid (cond_br15_falseOut_valid),
    .falseOut_ready (cond_br15_falseOut_ready)
  );

  oehb_dataless buffer30(
    .ins_valid (cond_br15_falseOut_valid),
    .ins_ready (cond_br15_falseOut_ready),
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

  fork_dataless #(.SIZE(2)) fork15(
    .ins_valid (buffer31_outs_valid),
    .ins_ready (buffer31_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork15_outs_1_valid, fork15_outs_0_valid}),
    .outs_ready ({fork15_outs_1_ready, fork15_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant40(
    .ctrl_valid (fork15_outs_0_valid),
    .ctrl_ready (fork15_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant40_outs),
    .outs_valid (constant40_outs_valid),
    .outs_ready (constant40_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi47(
    .ins (constant40_outs),
    .ins_valid (constant40_outs_valid),
    .ins_ready (constant40_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi47_outs),
    .outs_valid (extsi47_outs_valid),
    .outs_ready (extsi47_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer26(
    .ins (cond_br13_falseOut),
    .ins_valid (cond_br13_falseOut_valid),
    .ins_ready (cond_br13_falseOut_ready),
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

  oehb #(.DATA_TYPE(8)) buffer28(
    .ins (cond_br14_falseOut),
    .ins_valid (cond_br14_falseOut_valid),
    .ins_ready (cond_br14_falseOut_ready),
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

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux7(
    .index (fork17_outs_0),
    .index_valid (fork17_outs_0_valid),
    .index_ready (fork17_outs_0_ready),
    .ins ({cond_br22_trueOut, extsi47_outs}),
    .ins_valid ({cond_br22_trueOut_valid, extsi47_outs_valid}),
    .ins_ready ({cond_br22_trueOut_ready, extsi47_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux7_outs),
    .outs_valid (mux7_outs_valid),
    .outs_ready (mux7_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer32(
    .ins (mux7_outs),
    .ins_valid (mux7_outs_valid),
    .ins_ready (mux7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer32_outs),
    .outs_valid (buffer32_outs_valid),
    .outs_ready (buffer32_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer33(
    .ins (buffer32_outs),
    .ins_valid (buffer32_outs_valid),
    .ins_ready (buffer32_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer33_outs),
    .outs_valid (buffer33_outs_valid),
    .outs_ready (buffer33_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork16(
    .ins (buffer33_outs),
    .ins_valid (buffer33_outs_valid),
    .ins_ready (buffer33_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork16_outs_1, fork16_outs_0}),
    .outs_valid ({fork16_outs_1_valid, fork16_outs_0_valid}),
    .outs_ready ({fork16_outs_1_ready, fork16_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci16(
    .ins (fork16_outs_0),
    .ins_valid (fork16_outs_0_valid),
    .ins_ready (fork16_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci16_outs),
    .outs_valid (trunci16_outs_valid),
    .outs_ready (trunci16_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux8(
    .index (fork17_outs_2),
    .index_valid (fork17_outs_2_valid),
    .index_ready (fork17_outs_2_ready),
    .ins ({cond_br23_trueOut, buffer27_outs}),
    .ins_valid ({cond_br23_trueOut_valid, buffer27_outs_valid}),
    .ins_ready ({cond_br23_trueOut_ready, buffer27_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux8_outs),
    .outs_valid (mux8_outs_valid),
    .outs_ready (mux8_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux9(
    .index (fork17_outs_1),
    .index_valid (fork17_outs_1_valid),
    .index_ready (fork17_outs_1_ready),
    .ins ({cond_br24_trueOut, buffer29_outs}),
    .ins_valid ({cond_br24_trueOut_valid, buffer29_outs_valid}),
    .ins_ready ({cond_br24_trueOut_ready, buffer29_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux9_outs),
    .outs_valid (mux9_outs_valid),
    .outs_ready (mux9_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge4(
    .ins_valid ({cond_br25_trueOut_valid, fork15_outs_1_valid}),
    .ins_ready ({cond_br25_trueOut_ready, fork15_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge4_outs_valid),
    .outs_ready (control_merge4_outs_ready),
    .index (control_merge4_index),
    .index_valid (control_merge4_index_valid),
    .index_ready (control_merge4_index_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork17(
    .ins (control_merge4_index),
    .ins_valid (control_merge4_index_valid),
    .ins_ready (control_merge4_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork17_outs_2, fork17_outs_1, fork17_outs_0}),
    .outs_valid ({fork17_outs_2_valid, fork17_outs_1_valid, fork17_outs_0_valid}),
    .outs_ready ({fork17_outs_2_ready, fork17_outs_1_ready, fork17_outs_0_ready})
  );

  oehb_dataless buffer38(
    .ins_valid (control_merge4_outs_valid),
    .ins_ready (control_merge4_outs_ready),
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

  fork_dataless #(.SIZE(2)) fork18(
    .ins_valid (buffer39_outs_valid),
    .ins_ready (buffer39_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork18_outs_1_valid, fork18_outs_0_valid}),
    .outs_ready ({fork18_outs_1_ready, fork18_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant41(
    .ctrl_valid (fork18_outs_0_valid),
    .ctrl_ready (fork18_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant41_outs),
    .outs_valid (constant41_outs_valid),
    .outs_ready (constant41_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load5(
    .addrIn (trunci16_outs),
    .addrIn_valid (trunci16_outs_valid),
    .addrIn_ready (trunci16_outs_ready),
    .dataFromMem (mem_controller9_ldData_0),
    .dataFromMem_valid (mem_controller9_ldData_0_valid),
    .dataFromMem_ready (mem_controller9_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load5_addrOut),
    .addrOut_valid (load5_addrOut_valid),
    .addrOut_ready (load5_addrOut_ready),
    .dataOut (load5_dataOut),
    .dataOut_valid (load5_dataOut_valid),
    .dataOut_ready (load5_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi46(
    .ins (constant41_outs),
    .ins_valid (constant41_outs_valid),
    .ins_ready (constant41_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi46_outs),
    .outs_valid (extsi46_outs_valid),
    .outs_ready (extsi46_outs_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(32)) extsi63(
    .ins (load5_dataOut),
    .ins_valid (load5_dataOut_valid),
    .ins_ready (load5_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi63_outs),
    .outs_valid (extsi63_outs_valid),
    .outs_ready (extsi63_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer34(
    .ins (mux8_outs),
    .ins_valid (mux8_outs_valid),
    .ins_ready (mux8_outs_ready),
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

  oehb #(.DATA_TYPE(8)) buffer36(
    .ins (mux9_outs),
    .ins_valid (mux9_outs_valid),
    .ins_ready (mux9_outs_ready),
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

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux10(
    .index (fork23_outs_1),
    .index_valid (fork23_outs_1_valid),
    .index_ready (fork23_outs_1_ready),
    .ins ({cond_br16_trueOut, extsi46_outs}),
    .ins_valid ({cond_br16_trueOut_valid, extsi46_outs_valid}),
    .ins_ready ({cond_br16_trueOut_ready, extsi46_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux10_outs),
    .outs_valid (mux10_outs_valid),
    .outs_ready (mux10_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer40(
    .ins (mux10_outs),
    .ins_valid (mux10_outs_valid),
    .ins_ready (mux10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer40_outs),
    .outs_valid (buffer40_outs_valid),
    .outs_ready (buffer40_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer41(
    .ins (buffer40_outs),
    .ins_valid (buffer40_outs_valid),
    .ins_ready (buffer40_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer41_outs),
    .outs_valid (buffer41_outs_valid),
    .outs_ready (buffer41_outs_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(5)) fork19(
    .ins (buffer41_outs),
    .ins_valid (buffer41_outs_valid),
    .ins_ready (buffer41_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork19_outs_2, fork19_outs_1, fork19_outs_0}),
    .outs_valid ({fork19_outs_2_valid, fork19_outs_1_valid, fork19_outs_0_valid}),
    .outs_ready ({fork19_outs_2_ready, fork19_outs_1_ready, fork19_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi64(
    .ins (fork19_outs_1),
    .ins_valid (fork19_outs_1_valid),
    .ins_ready (fork19_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi64_outs),
    .outs_valid (extsi64_outs_valid),
    .outs_ready (extsi64_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi65(
    .ins (fork19_outs_2),
    .ins_valid (fork19_outs_2_valid),
    .ins_ready (fork19_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi65_outs),
    .outs_valid (extsi65_outs_valid),
    .outs_ready (extsi65_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork20(
    .ins (extsi65_outs),
    .ins_valid (extsi65_outs_valid),
    .ins_ready (extsi65_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork20_outs_1, fork20_outs_0}),
    .outs_valid ({fork20_outs_1_valid, fork20_outs_0_valid}),
    .outs_ready ({fork20_outs_1_ready, fork20_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci17(
    .ins (fork19_outs_0),
    .ins_valid (fork19_outs_0_valid),
    .ins_ready (fork19_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci17_outs),
    .outs_valid (trunci17_outs_valid),
    .outs_ready (trunci17_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux11(
    .index (fork23_outs_3),
    .index_valid (fork23_outs_3_valid),
    .index_ready (fork23_outs_3_ready),
    .ins ({cond_br17_trueOut, extsi63_outs}),
    .ins_valid ({cond_br17_trueOut_valid, extsi63_outs_valid}),
    .ins_ready ({cond_br17_trueOut_ready, extsi63_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux11_outs),
    .outs_valid (mux11_outs_valid),
    .outs_ready (mux11_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux12(
    .index (fork23_outs_4),
    .index_valid (fork23_outs_4_valid),
    .index_ready (fork23_outs_4_ready),
    .ins ({cond_br18_trueOut, buffer35_outs}),
    .ins_valid ({cond_br18_trueOut_valid, buffer35_outs_valid}),
    .ins_ready ({cond_br18_trueOut_ready, buffer35_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux12_outs),
    .outs_valid (mux12_outs_valid),
    .outs_ready (mux12_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux13(
    .index (fork23_outs_2),
    .index_valid (fork23_outs_2_valid),
    .index_ready (fork23_outs_2_ready),
    .ins ({cond_br19_trueOut, buffer37_outs}),
    .ins_valid ({cond_br19_trueOut_valid, buffer37_outs_valid}),
    .ins_ready ({cond_br19_trueOut_ready, buffer37_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux13_outs),
    .outs_valid (mux13_outs_valid),
    .outs_ready (mux13_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer46(
    .ins (mux13_outs),
    .ins_valid (mux13_outs_valid),
    .ins_ready (mux13_outs_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork21(
    .ins (buffer47_outs),
    .ins_valid (buffer47_outs_valid),
    .ins_ready (buffer47_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork21_outs_1, fork21_outs_0}),
    .outs_valid ({fork21_outs_1_valid, fork21_outs_0_valid}),
    .outs_ready ({fork21_outs_1_ready, fork21_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi66(
    .ins (fork21_outs_1),
    .ins_valid (fork21_outs_1_valid),
    .ins_ready (fork21_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi66_outs),
    .outs_valid (extsi66_outs_valid),
    .outs_ready (extsi66_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux14(
    .index (fork23_outs_0),
    .index_valid (fork23_outs_0_valid),
    .index_ready (fork23_outs_0_ready),
    .ins ({cond_br20_trueOut, fork16_outs_1}),
    .ins_valid ({cond_br20_trueOut_valid, fork16_outs_1_valid}),
    .ins_ready ({cond_br20_trueOut_ready, fork16_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux14_outs),
    .outs_valid (mux14_outs_valid),
    .outs_ready (mux14_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer48(
    .ins (mux14_outs),
    .ins_valid (mux14_outs_valid),
    .ins_ready (mux14_outs_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork22(
    .ins (buffer49_outs),
    .ins_valid (buffer49_outs_valid),
    .ins_ready (buffer49_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork22_outs_1, fork22_outs_0}),
    .outs_valid ({fork22_outs_1_valid, fork22_outs_0_valid}),
    .outs_ready ({fork22_outs_1_ready, fork22_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi67(
    .ins (fork22_outs_0),
    .ins_valid (fork22_outs_0_valid),
    .ins_ready (fork22_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi67_outs),
    .outs_valid (extsi67_outs_valid),
    .outs_ready (extsi67_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge5(
    .ins_valid ({cond_br21_trueOut_valid, fork18_outs_1_valid}),
    .ins_ready ({cond_br21_trueOut_ready, fork18_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge5_outs_valid),
    .outs_ready (control_merge5_outs_ready),
    .index (control_merge5_index),
    .index_valid (control_merge5_index_valid),
    .index_ready (control_merge5_index_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork23(
    .ins (control_merge5_index),
    .ins_valid (control_merge5_index_valid),
    .ins_ready (control_merge5_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork23_outs_4, fork23_outs_3, fork23_outs_2, fork23_outs_1, fork23_outs_0}),
    .outs_valid ({fork23_outs_4_valid, fork23_outs_3_valid, fork23_outs_2_valid, fork23_outs_1_valid, fork23_outs_0_valid}),
    .outs_ready ({fork23_outs_4_ready, fork23_outs_3_ready, fork23_outs_2_ready, fork23_outs_1_ready, fork23_outs_0_ready})
  );

  source source5(
    .clk (clk),
    .rst (rst),
    .outs_valid (source5_outs_valid),
    .outs_ready (source5_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant42(
    .ctrl_valid (source5_outs_valid),
    .ctrl_ready (source5_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant42_outs),
    .outs_valid (constant42_outs_valid),
    .outs_ready (constant42_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi68(
    .ins (constant42_outs),
    .ins_valid (constant42_outs_valid),
    .ins_ready (constant42_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi68_outs),
    .outs_valid (extsi68_outs_valid),
    .outs_ready (extsi68_outs_ready)
  );

  source source6(
    .clk (clk),
    .rst (rst),
    .outs_valid (source6_outs_valid),
    .outs_ready (source6_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant43(
    .ctrl_valid (source6_outs_valid),
    .ctrl_ready (source6_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant43_outs),
    .outs_valid (constant43_outs_valid),
    .outs_ready (constant43_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork24(
    .ins (constant43_outs),
    .ins_valid (constant43_outs_valid),
    .ins_ready (constant43_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork24_outs_1, fork24_outs_0}),
    .outs_valid ({fork24_outs_1_valid, fork24_outs_0_valid}),
    .outs_ready ({fork24_outs_1_ready, fork24_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi69(
    .ins (fork24_outs_0),
    .ins_valid (fork24_outs_0_valid),
    .ins_ready (fork24_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi69_outs),
    .outs_valid (extsi69_outs_valid),
    .outs_ready (extsi69_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi26(
    .ins (fork24_outs_1),
    .ins_valid (fork24_outs_1_valid),
    .ins_ready (fork24_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi26_outs),
    .outs_valid (extsi26_outs_valid),
    .outs_ready (extsi26_outs_ready)
  );

  source source7(
    .clk (clk),
    .rst (rst),
    .outs_valid (source7_outs_valid),
    .outs_ready (source7_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant44(
    .ctrl_valid (source7_outs_valid),
    .ctrl_ready (source7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant44_outs),
    .outs_valid (constant44_outs_valid),
    .outs_ready (constant44_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi27(
    .ins (constant44_outs),
    .ins_valid (constant44_outs_valid),
    .ins_ready (constant44_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi27_outs),
    .outs_valid (extsi27_outs_valid),
    .outs_ready (extsi27_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli4(
    .lhs (fork20_outs_0),
    .lhs_valid (fork20_outs_0_valid),
    .lhs_ready (fork20_outs_0_ready),
    .rhs (extsi26_outs),
    .rhs_valid (extsi26_outs_valid),
    .rhs_ready (extsi26_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli4_result),
    .result_valid (shli4_result_valid),
    .result_ready (shli4_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci18(
    .ins (shli4_result),
    .ins_valid (shli4_result_valid),
    .ins_ready (shli4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci18_outs),
    .outs_valid (trunci18_outs_valid),
    .outs_ready (trunci18_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli5(
    .lhs (fork20_outs_1),
    .lhs_valid (fork20_outs_1_valid),
    .lhs_ready (fork20_outs_1_ready),
    .rhs (extsi27_outs),
    .rhs_valid (extsi27_outs_valid),
    .rhs_ready (extsi27_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli5_result),
    .result_valid (shli5_result_valid),
    .result_ready (shli5_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci19(
    .ins (shli5_result),
    .ins_valid (shli5_result_valid),
    .ins_ready (shli5_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci19_outs),
    .outs_valid (trunci19_outs_valid),
    .outs_ready (trunci19_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi18(
    .lhs (trunci18_outs),
    .lhs_valid (trunci18_outs_valid),
    .lhs_ready (trunci18_outs_ready),
    .rhs (trunci19_outs),
    .rhs_valid (trunci19_outs_valid),
    .rhs_ready (trunci19_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi18_result),
    .result_valid (addi18_result_valid),
    .result_ready (addi18_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi7(
    .lhs (extsi67_outs),
    .lhs_valid (extsi67_outs_valid),
    .lhs_ready (extsi67_outs_ready),
    .rhs (addi18_result),
    .rhs_valid (addi18_result_valid),
    .rhs_ready (addi18_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi7_result),
    .result_valid (addi7_result_valid),
    .result_ready (addi7_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load6(
    .addrIn (addi7_result),
    .addrIn_valid (addi7_result_valid),
    .addrIn_ready (addi7_result_ready),
    .dataFromMem (mem_controller11_ldData_1),
    .dataFromMem_valid (mem_controller11_ldData_1_valid),
    .dataFromMem_ready (mem_controller11_ldData_1_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load6_addrOut),
    .addrOut_valid (load6_addrOut_valid),
    .addrOut_ready (load6_addrOut_ready),
    .dataOut (load6_dataOut),
    .dataOut_valid (load6_dataOut_valid),
    .dataOut_ready (load6_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi70(
    .ins (load6_dataOut),
    .ins_valid (load6_dataOut_valid),
    .ins_ready (load6_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi70_outs),
    .outs_valid (extsi70_outs_valid),
    .outs_ready (extsi70_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli2(
    .lhs (extsi66_outs),
    .lhs_valid (extsi66_outs_valid),
    .lhs_ready (extsi66_outs_ready),
    .rhs (extsi70_outs),
    .rhs_valid (extsi70_outs_valid),
    .rhs_ready (extsi70_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli2_result),
    .result_valid (muli2_result_valid),
    .result_ready (muli2_result_ready)
  );

  extsi #(.INPUT_TYPE(16), .OUTPUT_TYPE(24)) extsi71(
    .ins (muli2_result),
    .ins_valid (muli2_result_valid),
    .ins_ready (muli2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi71_outs),
    .outs_valid (extsi71_outs_valid),
    .outs_ready (extsi71_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load7(
    .addrIn (trunci17_outs),
    .addrIn_valid (trunci17_outs_valid),
    .addrIn_ready (trunci17_outs_ready),
    .dataFromMem (mem_controller13_ldData_0),
    .dataFromMem_valid (mem_controller13_ldData_0_valid),
    .dataFromMem_ready (mem_controller13_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load7_addrOut),
    .addrOut_valid (load7_addrOut_valid),
    .addrOut_ready (load7_addrOut_ready),
    .dataOut (load7_dataOut),
    .dataOut_valid (load7_dataOut_valid),
    .dataOut_ready (load7_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(24)) extsi72(
    .ins (load7_dataOut),
    .ins_valid (load7_dataOut_valid),
    .ins_ready (load7_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi72_outs),
    .outs_valid (extsi72_outs_valid),
    .outs_ready (extsi72_outs_ready)
  );

  muli #(.DATA_TYPE(24)) muli3(
    .lhs (extsi71_outs),
    .lhs_valid (extsi71_outs_valid),
    .lhs_ready (extsi71_outs_ready),
    .rhs (extsi72_outs),
    .rhs_valid (extsi72_outs_valid),
    .rhs_ready (extsi72_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli3_result),
    .result_valid (muli3_result_valid),
    .result_ready (muli3_result_ready)
  );

  extsi #(.INPUT_TYPE(24), .OUTPUT_TYPE(32)) extsi73(
    .ins (muli3_result),
    .ins_valid (muli3_result_valid),
    .ins_ready (muli3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi73_outs),
    .outs_valid (extsi73_outs_valid),
    .outs_ready (extsi73_outs_ready)
  );

  oehb #(.DATA_TYPE(32)) buffer42(
    .ins (mux11_outs),
    .ins_valid (mux11_outs_valid),
    .ins_ready (mux11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer42_outs),
    .outs_valid (buffer42_outs_valid),
    .outs_ready (buffer42_outs_ready)
  );

  tehb #(.DATA_TYPE(32)) buffer43(
    .ins (buffer42_outs),
    .ins_valid (buffer42_outs_valid),
    .ins_ready (buffer42_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer43_outs),
    .outs_valid (buffer43_outs_valid),
    .outs_ready (buffer43_outs_ready)
  );

  addi #(.DATA_TYPE(32)) addi2(
    .lhs (buffer43_outs),
    .lhs_valid (buffer43_outs_valid),
    .lhs_ready (buffer43_outs_ready),
    .rhs (extsi73_outs),
    .rhs_valid (extsi73_outs_valid),
    .rhs_ready (extsi73_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi2_result),
    .result_valid (addi2_result_valid),
    .result_ready (addi2_result_ready)
  );

  addi #(.DATA_TYPE(6)) addi11(
    .lhs (extsi64_outs),
    .lhs_valid (extsi64_outs_valid),
    .lhs_ready (extsi64_outs_ready),
    .rhs (extsi69_outs),
    .rhs_valid (extsi69_outs_valid),
    .rhs_ready (extsi69_outs_ready),
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

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci20(
    .ins (fork25_outs_0),
    .ins_valid (fork25_outs_0_valid),
    .ins_ready (fork25_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci20_outs),
    .outs_valid (trunci20_outs_valid),
    .outs_ready (trunci20_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi2(
    .lhs (fork25_outs_1),
    .lhs_valid (fork25_outs_1_valid),
    .lhs_ready (fork25_outs_1_ready),
    .rhs (extsi68_outs),
    .rhs_valid (extsi68_outs_valid),
    .rhs_ready (extsi68_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi2_result),
    .result_valid (cmpi2_result_valid),
    .result_ready (cmpi2_result_ready)
  );

  fork_type #(.SIZE(6), .DATA_TYPE(1)) fork26(
    .ins (cmpi2_result),
    .ins_valid (cmpi2_result_valid),
    .ins_ready (cmpi2_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork26_outs_5, fork26_outs_4, fork26_outs_3, fork26_outs_2, fork26_outs_1, fork26_outs_0}),
    .outs_valid ({fork26_outs_5_valid, fork26_outs_4_valid, fork26_outs_3_valid, fork26_outs_2_valid, fork26_outs_1_valid, fork26_outs_0_valid}),
    .outs_ready ({fork26_outs_5_ready, fork26_outs_4_ready, fork26_outs_3_ready, fork26_outs_2_ready, fork26_outs_1_ready, fork26_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br16(
    .condition (fork26_outs_0),
    .condition_valid (fork26_outs_0_valid),
    .condition_ready (fork26_outs_0_ready),
    .data (trunci20_outs),
    .data_valid (trunci20_outs_valid),
    .data_ready (trunci20_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br16_trueOut),
    .trueOut_valid (cond_br16_trueOut_valid),
    .trueOut_ready (cond_br16_trueOut_ready),
    .falseOut (cond_br16_falseOut),
    .falseOut_valid (cond_br16_falseOut_valid),
    .falseOut_ready (cond_br16_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink4(
    .ins (cond_br16_falseOut),
    .ins_valid (cond_br16_falseOut_valid),
    .ins_ready (cond_br16_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br17(
    .condition (fork26_outs_2),
    .condition_valid (fork26_outs_2_valid),
    .condition_ready (fork26_outs_2_ready),
    .data (addi2_result),
    .data_valid (addi2_result_valid),
    .data_ready (addi2_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br17_trueOut),
    .trueOut_valid (cond_br17_trueOut_valid),
    .trueOut_ready (cond_br17_trueOut_ready),
    .falseOut (cond_br17_falseOut),
    .falseOut_valid (cond_br17_falseOut_valid),
    .falseOut_ready (cond_br17_falseOut_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci21(
    .ins (cond_br17_falseOut),
    .ins_valid (cond_br17_falseOut_valid),
    .ins_ready (cond_br17_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci21_outs),
    .outs_valid (trunci21_outs_valid),
    .outs_ready (trunci21_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer44(
    .ins (mux12_outs),
    .ins_valid (mux12_outs_valid),
    .ins_ready (mux12_outs_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br18(
    .condition (fork26_outs_3),
    .condition_valid (fork26_outs_3_valid),
    .condition_ready (fork26_outs_3_ready),
    .data (buffer45_outs),
    .data_valid (buffer45_outs_valid),
    .data_ready (buffer45_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br18_trueOut),
    .trueOut_valid (cond_br18_trueOut_valid),
    .trueOut_ready (cond_br18_trueOut_ready),
    .falseOut (cond_br18_falseOut),
    .falseOut_valid (cond_br18_falseOut_valid),
    .falseOut_ready (cond_br18_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br19(
    .condition (fork26_outs_5),
    .condition_valid (fork26_outs_5_valid),
    .condition_ready (fork26_outs_5_ready),
    .data (fork21_outs_0),
    .data_valid (fork21_outs_0_valid),
    .data_ready (fork21_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br19_trueOut),
    .trueOut_valid (cond_br19_trueOut_valid),
    .trueOut_ready (cond_br19_trueOut_ready),
    .falseOut (cond_br19_falseOut),
    .falseOut_valid (cond_br19_falseOut_valid),
    .falseOut_ready (cond_br19_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br20(
    .condition (fork26_outs_1),
    .condition_valid (fork26_outs_1_valid),
    .condition_ready (fork26_outs_1_ready),
    .data (fork22_outs_1),
    .data_valid (fork22_outs_1_valid),
    .data_ready (fork22_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br20_trueOut),
    .trueOut_valid (cond_br20_trueOut_valid),
    .trueOut_ready (cond_br20_trueOut_ready),
    .falseOut (cond_br20_falseOut),
    .falseOut_valid (cond_br20_falseOut_valid),
    .falseOut_ready (cond_br20_falseOut_ready)
  );

  oehb_dataless buffer50(
    .ins_valid (control_merge5_outs_valid),
    .ins_ready (control_merge5_outs_ready),
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
    .condition (fork26_outs_4),
    .condition_valid (fork26_outs_4_valid),
    .condition_ready (fork26_outs_4_ready),
    .data_valid (buffer51_outs_valid),
    .data_ready (buffer51_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br21_trueOut_valid),
    .trueOut_ready (cond_br21_trueOut_ready),
    .falseOut_valid (cond_br21_falseOut_valid),
    .falseOut_ready (cond_br21_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer56(
    .ins (cond_br20_falseOut),
    .ins_valid (cond_br20_falseOut_valid),
    .ins_ready (cond_br20_falseOut_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork27(
    .ins (buffer57_outs),
    .ins_valid (buffer57_outs_valid),
    .ins_ready (buffer57_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork27_outs_1, fork27_outs_0}),
    .outs_valid ({fork27_outs_1_valid, fork27_outs_0_valid}),
    .outs_ready ({fork27_outs_1_ready, fork27_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi74(
    .ins (fork27_outs_1),
    .ins_valid (fork27_outs_1_valid),
    .ins_ready (fork27_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi74_outs),
    .outs_valid (extsi74_outs_valid),
    .outs_ready (extsi74_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci22(
    .ins (fork27_outs_0),
    .ins_valid (fork27_outs_0_valid),
    .ins_ready (fork27_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci22_outs),
    .outs_valid (trunci22_outs_valid),
    .outs_ready (trunci22_outs_ready)
  );

  oehb_dataless buffer60(
    .ins_valid (cond_br21_falseOut_valid),
    .ins_ready (cond_br21_falseOut_ready),
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

  fork_dataless #(.SIZE(3)) fork28(
    .ins_valid (buffer61_outs_valid),
    .ins_ready (buffer61_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork28_outs_2_valid, fork28_outs_1_valid, fork28_outs_0_valid}),
    .outs_ready ({fork28_outs_2_ready, fork28_outs_1_ready, fork28_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant45(
    .ctrl_valid (fork28_outs_1_valid),
    .ctrl_ready (fork28_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant45_outs),
    .outs_valid (constant45_outs_valid),
    .outs_ready (constant45_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi28(
    .ins (constant45_outs),
    .ins_valid (constant45_outs_valid),
    .ins_ready (constant45_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi28_outs),
    .outs_valid (extsi28_outs_valid),
    .outs_ready (extsi28_outs_ready)
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant46(
    .ctrl_valid (fork28_outs_0_valid),
    .ctrl_ready (fork28_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant46_outs),
    .outs_valid (constant46_outs_valid),
    .outs_ready (constant46_outs_ready)
  );

  source source8(
    .clk (clk),
    .rst (rst),
    .outs_valid (source8_outs_valid),
    .outs_ready (source8_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant47(
    .ctrl_valid (source8_outs_valid),
    .ctrl_ready (source8_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant47_outs),
    .outs_valid (constant47_outs_valid),
    .outs_ready (constant47_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi75(
    .ins (constant47_outs),
    .ins_valid (constant47_outs_valid),
    .ins_ready (constant47_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi75_outs),
    .outs_valid (extsi75_outs_valid),
    .outs_ready (extsi75_outs_ready)
  );

  source source9(
    .clk (clk),
    .rst (rst),
    .outs_valid (source9_outs_valid),
    .outs_ready (source9_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant48(
    .ctrl_valid (source9_outs_valid),
    .ctrl_ready (source9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant48_outs),
    .outs_valid (constant48_outs_valid),
    .outs_ready (constant48_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi76(
    .ins (constant48_outs),
    .ins_valid (constant48_outs_valid),
    .ins_ready (constant48_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi76_outs),
    .outs_valid (extsi76_outs_valid),
    .outs_ready (extsi76_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer58(
    .ins (trunci21_outs),
    .ins_valid (trunci21_outs_valid),
    .ins_ready (trunci21_outs_ready),
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

  store #(.DATA_TYPE(8), .ADDR_TYPE(4)) store1(
    .addrIn (trunci22_outs),
    .addrIn_valid (trunci22_outs_valid),
    .addrIn_ready (trunci22_outs_ready),
    .dataIn (buffer59_outs),
    .dataIn_valid (buffer59_outs_valid),
    .dataIn_ready (buffer59_outs_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store1_addrOut),
    .addrOut_valid (store1_addrOut_valid),
    .addrOut_ready (store1_addrOut_ready),
    .dataToMem (store1_dataToMem),
    .dataToMem_valid (store1_dataToMem_valid),
    .dataToMem_ready (store1_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi12(
    .lhs (extsi74_outs),
    .lhs_valid (extsi74_outs_valid),
    .lhs_ready (extsi74_outs_ready),
    .rhs (extsi76_outs),
    .rhs_valid (extsi76_outs_valid),
    .rhs_ready (extsi76_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi12_result),
    .result_valid (addi12_result_valid),
    .result_ready (addi12_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork29(
    .ins (addi12_result),
    .ins_valid (addi12_result_valid),
    .ins_ready (addi12_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork29_outs_1, fork29_outs_0}),
    .outs_valid ({fork29_outs_1_valid, fork29_outs_0_valid}),
    .outs_ready ({fork29_outs_1_ready, fork29_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci23(
    .ins (fork29_outs_0),
    .ins_valid (fork29_outs_0_valid),
    .ins_ready (fork29_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci23_outs),
    .outs_valid (trunci23_outs_valid),
    .outs_ready (trunci23_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi3(
    .lhs (fork29_outs_1),
    .lhs_valid (fork29_outs_1_valid),
    .lhs_ready (fork29_outs_1_ready),
    .rhs (extsi75_outs),
    .rhs_valid (extsi75_outs_valid),
    .rhs_ready (extsi75_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi3_result),
    .result_valid (cmpi3_result_valid),
    .result_ready (cmpi3_result_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork30(
    .ins (cmpi3_result),
    .ins_valid (cmpi3_result_valid),
    .ins_ready (cmpi3_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork30_outs_4, fork30_outs_3, fork30_outs_2, fork30_outs_1, fork30_outs_0}),
    .outs_valid ({fork30_outs_4_valid, fork30_outs_3_valid, fork30_outs_2_valid, fork30_outs_1_valid, fork30_outs_0_valid}),
    .outs_ready ({fork30_outs_4_ready, fork30_outs_3_ready, fork30_outs_2_ready, fork30_outs_1_ready, fork30_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br22(
    .condition (fork30_outs_0),
    .condition_valid (fork30_outs_0_valid),
    .condition_ready (fork30_outs_0_ready),
    .data (trunci23_outs),
    .data_valid (trunci23_outs_valid),
    .data_ready (trunci23_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br22_trueOut),
    .trueOut_valid (cond_br22_trueOut_valid),
    .trueOut_ready (cond_br22_trueOut_ready),
    .falseOut (cond_br22_falseOut),
    .falseOut_valid (cond_br22_falseOut_valid),
    .falseOut_ready (cond_br22_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink6(
    .ins (cond_br22_falseOut),
    .ins_valid (cond_br22_falseOut_valid),
    .ins_ready (cond_br22_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer52(
    .ins (cond_br18_falseOut),
    .ins_valid (cond_br18_falseOut_valid),
    .ins_ready (cond_br18_falseOut_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br23(
    .condition (fork30_outs_1),
    .condition_valid (fork30_outs_1_valid),
    .condition_ready (fork30_outs_1_ready),
    .data (buffer53_outs),
    .data_valid (buffer53_outs_valid),
    .data_ready (buffer53_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br23_trueOut),
    .trueOut_valid (cond_br23_trueOut_valid),
    .trueOut_ready (cond_br23_trueOut_ready),
    .falseOut (cond_br23_falseOut),
    .falseOut_valid (cond_br23_falseOut_valid),
    .falseOut_ready (cond_br23_falseOut_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer54(
    .ins (cond_br19_falseOut),
    .ins_valid (cond_br19_falseOut_valid),
    .ins_ready (cond_br19_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer54_outs),
    .outs_valid (buffer54_outs_valid),
    .outs_ready (buffer54_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer55(
    .ins (buffer54_outs),
    .ins_valid (buffer54_outs_valid),
    .ins_ready (buffer54_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer55_outs),
    .outs_valid (buffer55_outs_valid),
    .outs_ready (buffer55_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br24(
    .condition (fork30_outs_4),
    .condition_valid (fork30_outs_4_valid),
    .condition_ready (fork30_outs_4_ready),
    .data (buffer55_outs),
    .data_valid (buffer55_outs_valid),
    .data_ready (buffer55_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br24_trueOut),
    .trueOut_valid (cond_br24_trueOut_valid),
    .trueOut_ready (cond_br24_trueOut_ready),
    .falseOut (cond_br24_falseOut),
    .falseOut_valid (cond_br24_falseOut_valid),
    .falseOut_ready (cond_br24_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink7(
    .ins (cond_br24_falseOut),
    .ins_valid (cond_br24_falseOut_valid),
    .ins_ready (cond_br24_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br_dataless cond_br25(
    .condition (fork30_outs_2),
    .condition_valid (fork30_outs_2_valid),
    .condition_ready (fork30_outs_2_ready),
    .data_valid (fork28_outs_2_valid),
    .data_ready (fork28_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br25_trueOut_valid),
    .trueOut_ready (cond_br25_trueOut_ready),
    .falseOut_valid (cond_br25_falseOut_valid),
    .falseOut_ready (cond_br25_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(1)) cond_br26(
    .condition (fork30_outs_3),
    .condition_valid (fork30_outs_3_valid),
    .condition_ready (fork30_outs_3_ready),
    .data (constant46_outs),
    .data_valid (constant46_outs_valid),
    .data_ready (constant46_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br26_trueOut),
    .trueOut_valid (cond_br26_trueOut_valid),
    .trueOut_ready (cond_br26_trueOut_ready),
    .falseOut (cond_br26_falseOut),
    .falseOut_valid (cond_br26_falseOut_valid),
    .falseOut_ready (cond_br26_falseOut_ready)
  );

  sink #(.DATA_TYPE(1)) sink8(
    .ins (cond_br26_trueOut),
    .ins_valid (cond_br26_trueOut_valid),
    .ins_ready (cond_br26_trueOut_ready),
    .clk (clk),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi45(
    .ins (cond_br26_falseOut),
    .ins_valid (cond_br26_falseOut_valid),
    .ins_ready (cond_br26_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi45_outs),
    .outs_valid (extsi45_outs_valid),
    .outs_ready (extsi45_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux15(
    .index (fork32_outs_0),
    .index_valid (fork32_outs_0_valid),
    .index_ready (fork32_outs_0_ready),
    .ins ({cond_br27_trueOut, extsi45_outs}),
    .ins_valid ({cond_br27_trueOut_valid, extsi45_outs_valid}),
    .ins_ready ({cond_br27_trueOut_ready, extsi45_outs_ready}),
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

  fork_type #(.SIZE(4), .DATA_TYPE(5)) fork31(
    .ins (buffer63_outs),
    .ins_valid (buffer63_outs_valid),
    .ins_ready (buffer63_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork31_outs_3, fork31_outs_2, fork31_outs_1, fork31_outs_0}),
    .outs_valid ({fork31_outs_3_valid, fork31_outs_2_valid, fork31_outs_1_valid, fork31_outs_0_valid}),
    .outs_ready ({fork31_outs_3_ready, fork31_outs_2_ready, fork31_outs_1_ready, fork31_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi77(
    .ins (fork31_outs_3),
    .ins_valid (fork31_outs_3_valid),
    .ins_ready (fork31_outs_3_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi77_outs),
    .outs_valid (extsi77_outs_valid),
    .outs_ready (extsi77_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci24(
    .ins (fork31_outs_0),
    .ins_valid (fork31_outs_0_valid),
    .ins_ready (fork31_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci24_outs),
    .outs_valid (trunci24_outs_valid),
    .outs_ready (trunci24_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci25(
    .ins (fork31_outs_1),
    .ins_valid (fork31_outs_1_valid),
    .ins_ready (fork31_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci25_outs),
    .outs_valid (trunci25_outs_valid),
    .outs_ready (trunci25_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci26(
    .ins (fork31_outs_2),
    .ins_valid (fork31_outs_2_valid),
    .ins_ready (fork31_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci26_outs),
    .outs_valid (trunci26_outs_valid),
    .outs_ready (trunci26_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux16(
    .index (fork32_outs_1),
    .index_valid (fork32_outs_1_valid),
    .index_ready (fork32_outs_1_ready),
    .ins ({cond_br28_trueOut, cond_br23_falseOut}),
    .ins_valid ({cond_br28_trueOut_valid, cond_br23_falseOut_valid}),
    .ins_ready ({cond_br28_trueOut_ready, cond_br23_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux16_outs),
    .outs_valid (mux16_outs_valid),
    .outs_ready (mux16_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge7(
    .ins_valid ({cond_br29_trueOut_valid, cond_br25_falseOut_valid}),
    .ins_ready ({cond_br29_trueOut_ready, cond_br25_falseOut_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge7_outs_valid),
    .outs_ready (control_merge7_outs_ready),
    .index (control_merge7_index),
    .index_valid (control_merge7_index_valid),
    .index_ready (control_merge7_index_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork32(
    .ins (control_merge7_index),
    .ins_valid (control_merge7_index_valid),
    .ins_ready (control_merge7_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork32_outs_1, fork32_outs_0}),
    .outs_valid ({fork32_outs_1_valid, fork32_outs_0_valid}),
    .outs_ready ({fork32_outs_1_ready, fork32_outs_0_ready})
  );

  oehb_dataless buffer66(
    .ins_valid (control_merge7_outs_valid),
    .ins_ready (control_merge7_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer66_outs_valid),
    .outs_ready (buffer66_outs_ready)
  );

  tehb_dataless buffer67(
    .ins_valid (buffer66_outs_valid),
    .ins_ready (buffer66_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer67_outs_valid),
    .outs_ready (buffer67_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork33(
    .ins_valid (buffer67_outs_valid),
    .ins_ready (buffer67_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork33_outs_1_valid, fork33_outs_0_valid}),
    .outs_ready ({fork33_outs_1_ready, fork33_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant49(
    .ctrl_valid (fork33_outs_0_valid),
    .ctrl_ready (fork33_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant49_outs),
    .outs_valid (constant49_outs_valid),
    .outs_ready (constant49_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi32(
    .ins (constant49_outs),
    .ins_valid (constant49_outs_valid),
    .ins_ready (constant49_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi32_outs),
    .outs_valid (extsi32_outs_valid),
    .outs_ready (extsi32_outs_ready)
  );

  source source10(
    .clk (clk),
    .rst (rst),
    .outs_valid (source10_outs_valid),
    .outs_ready (source10_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant50(
    .ctrl_valid (source10_outs_valid),
    .ctrl_ready (source10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant50_outs),
    .outs_valid (constant50_outs_valid),
    .outs_ready (constant50_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi78(
    .ins (constant50_outs),
    .ins_valid (constant50_outs_valid),
    .ins_ready (constant50_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi78_outs),
    .outs_valid (extsi78_outs_valid),
    .outs_ready (extsi78_outs_ready)
  );

  source source11(
    .clk (clk),
    .rst (rst),
    .outs_valid (source11_outs_valid),
    .outs_ready (source11_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant51(
    .ctrl_valid (source11_outs_valid),
    .ctrl_ready (source11_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant51_outs),
    .outs_valid (constant51_outs_valid),
    .outs_ready (constant51_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi79(
    .ins (constant51_outs),
    .ins_valid (constant51_outs_valid),
    .ins_ready (constant51_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi79_outs),
    .outs_valid (extsi79_outs_valid),
    .outs_ready (extsi79_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load8(
    .addrIn (trunci26_outs),
    .addrIn_valid (trunci26_outs_valid),
    .addrIn_ready (trunci26_outs_ready),
    .dataFromMem (mem_controller9_ldData_1),
    .dataFromMem_valid (mem_controller9_ldData_1_valid),
    .dataFromMem_ready (mem_controller9_ldData_1_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load8_addrOut),
    .addrOut_valid (load8_addrOut_valid),
    .addrOut_ready (load8_addrOut_ready),
    .dataOut (load8_dataOut),
    .dataOut_valid (load8_dataOut_valid),
    .dataOut_ready (load8_dataOut_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load9(
    .addrIn (trunci25_outs),
    .addrIn_valid (trunci25_outs_valid),
    .addrIn_ready (trunci25_outs_ready),
    .dataFromMem (mem_controller12_ldData_0),
    .dataFromMem_valid (mem_controller12_ldData_0_valid),
    .dataFromMem_ready (mem_controller12_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load9_addrOut),
    .addrOut_valid (load9_addrOut_valid),
    .addrOut_ready (load9_addrOut_ready),
    .dataOut (load9_dataOut),
    .dataOut_valid (load9_dataOut_valid),
    .dataOut_ready (load9_dataOut_ready)
  );

  addi #(.DATA_TYPE(8)) addi3(
    .lhs (load8_dataOut),
    .lhs_valid (load8_dataOut_valid),
    .lhs_ready (load8_dataOut_ready),
    .rhs (load9_dataOut),
    .rhs_valid (load9_dataOut_valid),
    .rhs_ready (load9_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .result (addi3_result),
    .result_valid (addi3_result_valid),
    .result_ready (addi3_result_ready)
  );

  store #(.DATA_TYPE(8), .ADDR_TYPE(4)) store2(
    .addrIn (trunci24_outs),
    .addrIn_valid (trunci24_outs_valid),
    .addrIn_ready (trunci24_outs_ready),
    .dataIn (addi3_result),
    .dataIn_valid (addi3_result_valid),
    .dataIn_ready (addi3_result_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store2_addrOut),
    .addrOut_valid (store2_addrOut_valid),
    .addrOut_ready (store2_addrOut_ready),
    .dataToMem (store2_dataToMem),
    .dataToMem_valid (store2_dataToMem_valid),
    .dataToMem_ready (store2_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi13(
    .lhs (extsi77_outs),
    .lhs_valid (extsi77_outs_valid),
    .lhs_ready (extsi77_outs_ready),
    .rhs (extsi79_outs),
    .rhs_valid (extsi79_outs_valid),
    .rhs_ready (extsi79_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi13_result),
    .result_valid (addi13_result_valid),
    .result_ready (addi13_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork34(
    .ins (addi13_result),
    .ins_valid (addi13_result_valid),
    .ins_ready (addi13_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork34_outs_1, fork34_outs_0}),
    .outs_valid ({fork34_outs_1_valid, fork34_outs_0_valid}),
    .outs_ready ({fork34_outs_1_ready, fork34_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci27(
    .ins (fork34_outs_0),
    .ins_valid (fork34_outs_0_valid),
    .ins_ready (fork34_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci27_outs),
    .outs_valid (trunci27_outs_valid),
    .outs_ready (trunci27_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi4(
    .lhs (fork34_outs_1),
    .lhs_valid (fork34_outs_1_valid),
    .lhs_ready (fork34_outs_1_ready),
    .rhs (extsi78_outs),
    .rhs_valid (extsi78_outs_valid),
    .rhs_ready (extsi78_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi4_result),
    .result_valid (cmpi4_result_valid),
    .result_ready (cmpi4_result_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork35(
    .ins (cmpi4_result),
    .ins_valid (cmpi4_result_valid),
    .ins_ready (cmpi4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork35_outs_2, fork35_outs_1, fork35_outs_0}),
    .outs_valid ({fork35_outs_2_valid, fork35_outs_1_valid, fork35_outs_0_valid}),
    .outs_ready ({fork35_outs_2_ready, fork35_outs_1_ready, fork35_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br27(
    .condition (fork35_outs_0),
    .condition_valid (fork35_outs_0_valid),
    .condition_ready (fork35_outs_0_ready),
    .data (trunci27_outs),
    .data_valid (trunci27_outs_valid),
    .data_ready (trunci27_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br27_trueOut),
    .trueOut_valid (cond_br27_trueOut_valid),
    .trueOut_ready (cond_br27_trueOut_ready),
    .falseOut (cond_br27_falseOut),
    .falseOut_valid (cond_br27_falseOut_valid),
    .falseOut_ready (cond_br27_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink9(
    .ins (cond_br27_falseOut),
    .ins_valid (cond_br27_falseOut_valid),
    .ins_ready (cond_br27_falseOut_ready),
    .clk (clk),
    .rst (rst)
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

  cond_br #(.DATA_TYPE(8)) cond_br28(
    .condition (fork35_outs_1),
    .condition_valid (fork35_outs_1_valid),
    .condition_ready (fork35_outs_1_ready),
    .data (buffer65_outs),
    .data_valid (buffer65_outs_valid),
    .data_ready (buffer65_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br28_trueOut),
    .trueOut_valid (cond_br28_trueOut_valid),
    .trueOut_ready (cond_br28_trueOut_ready),
    .falseOut (cond_br28_falseOut),
    .falseOut_valid (cond_br28_falseOut_valid),
    .falseOut_ready (cond_br28_falseOut_ready)
  );

  cond_br_dataless cond_br29(
    .condition (fork35_outs_2),
    .condition_valid (fork35_outs_2_valid),
    .condition_ready (fork35_outs_2_ready),
    .data_valid (fork33_outs_1_valid),
    .data_ready (fork33_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br29_trueOut_valid),
    .trueOut_ready (cond_br29_trueOut_ready),
    .falseOut_valid (cond_br29_falseOut_valid),
    .falseOut_ready (cond_br29_falseOut_ready)
  );

  oehb_dataless buffer70(
    .ins_valid (cond_br29_falseOut_valid),
    .ins_ready (cond_br29_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer70_outs_valid),
    .outs_ready (buffer70_outs_ready)
  );

  tehb_dataless buffer71(
    .ins_valid (buffer70_outs_valid),
    .ins_ready (buffer70_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer71_outs_valid),
    .outs_ready (buffer71_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork36(
    .ins_valid (buffer71_outs_valid),
    .ins_ready (buffer71_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork36_outs_1_valid, fork36_outs_0_valid}),
    .outs_ready ({fork36_outs_1_ready, fork36_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant52(
    .ctrl_valid (fork36_outs_0_valid),
    .ctrl_ready (fork36_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant52_outs),
    .outs_valid (constant52_outs_valid),
    .outs_ready (constant52_outs_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi44(
    .ins (constant52_outs),
    .ins_valid (constant52_outs_valid),
    .ins_ready (constant52_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi44_outs),
    .outs_valid (extsi44_outs_valid),
    .outs_ready (extsi44_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer68(
    .ins (cond_br28_falseOut),
    .ins_valid (cond_br28_falseOut_valid),
    .ins_ready (cond_br28_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer68_outs),
    .outs_valid (buffer68_outs_valid),
    .outs_ready (buffer68_outs_ready)
  );

  tehb #(.DATA_TYPE(8)) buffer69(
    .ins (buffer68_outs),
    .ins_valid (buffer68_outs_valid),
    .ins_ready (buffer68_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer69_outs),
    .outs_valid (buffer69_outs_valid),
    .outs_ready (buffer69_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux17(
    .index (fork38_outs_0),
    .index_valid (fork38_outs_0_valid),
    .index_ready (fork38_outs_0_ready),
    .ins ({cond_br35_trueOut, extsi44_outs}),
    .ins_valid ({cond_br35_trueOut_valid, extsi44_outs_valid}),
    .ins_ready ({cond_br35_trueOut_ready, extsi44_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux17_outs),
    .outs_valid (mux17_outs_valid),
    .outs_ready (mux17_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer72(
    .ins (mux17_outs),
    .ins_valid (mux17_outs_valid),
    .ins_ready (mux17_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer72_outs),
    .outs_valid (buffer72_outs_valid),
    .outs_ready (buffer72_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer73(
    .ins (buffer72_outs),
    .ins_valid (buffer72_outs_valid),
    .ins_ready (buffer72_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer73_outs),
    .outs_valid (buffer73_outs_valid),
    .outs_ready (buffer73_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork37(
    .ins (buffer73_outs),
    .ins_valid (buffer73_outs_valid),
    .ins_ready (buffer73_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork37_outs_1, fork37_outs_0}),
    .outs_valid ({fork37_outs_1_valid, fork37_outs_0_valid}),
    .outs_ready ({fork37_outs_1_ready, fork37_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci28(
    .ins (fork37_outs_0),
    .ins_valid (fork37_outs_0_valid),
    .ins_ready (fork37_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci28_outs),
    .outs_valid (trunci28_outs_valid),
    .outs_ready (trunci28_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux18(
    .index (fork38_outs_1),
    .index_valid (fork38_outs_1_valid),
    .index_ready (fork38_outs_1_ready),
    .ins ({cond_br36_trueOut, buffer69_outs}),
    .ins_valid ({cond_br36_trueOut_valid, buffer69_outs_valid}),
    .ins_ready ({cond_br36_trueOut_ready, buffer69_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux18_outs),
    .outs_valid (mux18_outs_valid),
    .outs_ready (mux18_outs_ready)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge9(
    .ins_valid ({cond_br37_trueOut_valid, fork36_outs_1_valid}),
    .ins_ready ({cond_br37_trueOut_ready, fork36_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge9_outs_valid),
    .outs_ready (control_merge9_outs_ready),
    .index (control_merge9_index),
    .index_valid (control_merge9_index_valid),
    .index_ready (control_merge9_index_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork38(
    .ins (control_merge9_index),
    .ins_valid (control_merge9_index_valid),
    .ins_ready (control_merge9_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork38_outs_1, fork38_outs_0}),
    .outs_valid ({fork38_outs_1_valid, fork38_outs_0_valid}),
    .outs_ready ({fork38_outs_1_ready, fork38_outs_0_ready})
  );

  oehb_dataless buffer76(
    .ins_valid (control_merge9_outs_valid),
    .ins_ready (control_merge9_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer76_outs_valid),
    .outs_ready (buffer76_outs_ready)
  );

  tehb_dataless buffer77(
    .ins_valid (buffer76_outs_valid),
    .ins_ready (buffer76_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer77_outs_valid),
    .outs_ready (buffer77_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork39(
    .ins_valid (buffer77_outs_valid),
    .ins_ready (buffer77_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork39_outs_1_valid, fork39_outs_0_valid}),
    .outs_ready ({fork39_outs_1_ready, fork39_outs_0_ready})
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant53(
    .ctrl_valid (fork39_outs_0_valid),
    .ctrl_ready (fork39_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant53_outs),
    .outs_valid (constant53_outs_valid),
    .outs_ready (constant53_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load10(
    .addrIn (trunci28_outs),
    .addrIn_valid (trunci28_outs_valid),
    .addrIn_ready (trunci28_outs_ready),
    .dataFromMem (mem_controller10_ldData_0),
    .dataFromMem_valid (mem_controller10_ldData_0_valid),
    .dataFromMem_ready (mem_controller10_ldData_0_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load10_addrOut),
    .addrOut_valid (load10_addrOut_valid),
    .addrOut_ready (load10_addrOut_ready),
    .dataOut (load10_dataOut),
    .dataOut_valid (load10_dataOut_valid),
    .dataOut_ready (load10_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(5)) extsi43(
    .ins (constant53_outs),
    .ins_valid (constant53_outs_valid),
    .ins_ready (constant53_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi43_outs),
    .outs_valid (extsi43_outs_valid),
    .outs_ready (extsi43_outs_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(32)) extsi80(
    .ins (load10_dataOut),
    .ins_valid (load10_dataOut_valid),
    .ins_ready (load10_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi80_outs),
    .outs_valid (extsi80_outs_valid),
    .outs_ready (extsi80_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer74(
    .ins (mux18_outs),
    .ins_valid (mux18_outs_valid),
    .ins_ready (mux18_outs_ready),
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

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux19(
    .index (fork44_outs_1),
    .index_valid (fork44_outs_1_valid),
    .index_ready (fork44_outs_1_ready),
    .ins ({cond_br30_trueOut, extsi43_outs}),
    .ins_valid ({cond_br30_trueOut_valid, extsi43_outs_valid}),
    .ins_ready ({cond_br30_trueOut_ready, extsi43_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux19_outs),
    .outs_valid (mux19_outs_valid),
    .outs_ready (mux19_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer78(
    .ins (mux19_outs),
    .ins_valid (mux19_outs_valid),
    .ins_ready (mux19_outs_ready),
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

  fork_type #(.SIZE(3), .DATA_TYPE(5)) fork40(
    .ins (buffer79_outs),
    .ins_valid (buffer79_outs_valid),
    .ins_ready (buffer79_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork40_outs_2, fork40_outs_1, fork40_outs_0}),
    .outs_valid ({fork40_outs_2_valid, fork40_outs_1_valid, fork40_outs_0_valid}),
    .outs_ready ({fork40_outs_2_ready, fork40_outs_1_ready, fork40_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(7)) extsi81(
    .ins (fork40_outs_0),
    .ins_valid (fork40_outs_0_valid),
    .ins_ready (fork40_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi81_outs),
    .outs_valid (extsi81_outs_valid),
    .outs_ready (extsi81_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi82(
    .ins (fork40_outs_2),
    .ins_valid (fork40_outs_2_valid),
    .ins_ready (fork40_outs_2_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi82_outs),
    .outs_valid (extsi82_outs_valid),
    .outs_ready (extsi82_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci29(
    .ins (fork40_outs_1),
    .ins_valid (fork40_outs_1_valid),
    .ins_ready (fork40_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci29_outs),
    .outs_valid (trunci29_outs_valid),
    .outs_ready (trunci29_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux20(
    .index (fork44_outs_3),
    .index_valid (fork44_outs_3_valid),
    .index_ready (fork44_outs_3_ready),
    .ins ({cond_br31_trueOut, extsi80_outs}),
    .ins_valid ({cond_br31_trueOut_valid, extsi80_outs_valid}),
    .ins_ready ({cond_br31_trueOut_ready, extsi80_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux20_outs),
    .outs_valid (mux20_outs_valid),
    .outs_ready (mux20_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(8), .SELECT_TYPE(1)) mux21(
    .index (fork44_outs_2),
    .index_valid (fork44_outs_2_valid),
    .index_ready (fork44_outs_2_ready),
    .ins ({cond_br32_trueOut, buffer75_outs}),
    .ins_valid ({cond_br32_trueOut_valid, buffer75_outs_valid}),
    .ins_ready ({cond_br32_trueOut_ready, buffer75_outs_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux21_outs),
    .outs_valid (mux21_outs_valid),
    .outs_ready (mux21_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer82(
    .ins (mux21_outs),
    .ins_valid (mux21_outs_valid),
    .ins_ready (mux21_outs_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(8)) fork41(
    .ins (buffer83_outs),
    .ins_valid (buffer83_outs_valid),
    .ins_ready (buffer83_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork41_outs_1, fork41_outs_0}),
    .outs_valid ({fork41_outs_1_valid, fork41_outs_0_valid}),
    .outs_ready ({fork41_outs_1_ready, fork41_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi83(
    .ins (fork41_outs_1),
    .ins_valid (fork41_outs_1_valid),
    .ins_ready (fork41_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi83_outs),
    .outs_valid (extsi83_outs_valid),
    .outs_ready (extsi83_outs_ready)
  );

  mux #(.SIZE(2), .DATA_TYPE(5), .SELECT_TYPE(1)) mux22(
    .index (fork44_outs_0),
    .index_valid (fork44_outs_0_valid),
    .index_ready (fork44_outs_0_ready),
    .ins ({cond_br33_trueOut, fork37_outs_1}),
    .ins_valid ({cond_br33_trueOut_valid, fork37_outs_1_valid}),
    .ins_ready ({cond_br33_trueOut_ready, fork37_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs (mux22_outs),
    .outs_valid (mux22_outs_valid),
    .outs_ready (mux22_outs_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer84(
    .ins (mux22_outs),
    .ins_valid (mux22_outs_valid),
    .ins_ready (mux22_outs_ready),
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

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork42(
    .ins (buffer85_outs),
    .ins_valid (buffer85_outs_valid),
    .ins_ready (buffer85_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork42_outs_1, fork42_outs_0}),
    .outs_valid ({fork42_outs_1_valid, fork42_outs_0_valid}),
    .outs_ready ({fork42_outs_1_ready, fork42_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi84(
    .ins (fork42_outs_1),
    .ins_valid (fork42_outs_1_valid),
    .ins_ready (fork42_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi84_outs),
    .outs_valid (extsi84_outs_valid),
    .outs_ready (extsi84_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork43(
    .ins (extsi84_outs),
    .ins_valid (extsi84_outs_valid),
    .ins_ready (extsi84_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork43_outs_1, fork43_outs_0}),
    .outs_valid ({fork43_outs_1_valid, fork43_outs_0_valid}),
    .outs_ready ({fork43_outs_1_ready, fork43_outs_0_ready})
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge10(
    .ins_valid ({cond_br34_trueOut_valid, fork39_outs_1_valid}),
    .ins_ready ({cond_br34_trueOut_ready, fork39_outs_1_ready}),
    .clk (clk),
    .rst (rst),
    .outs_valid (control_merge10_outs_valid),
    .outs_ready (control_merge10_outs_ready),
    .index (control_merge10_index),
    .index_valid (control_merge10_index_valid),
    .index_ready (control_merge10_index_ready)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork44(
    .ins (control_merge10_index),
    .ins_valid (control_merge10_index_valid),
    .ins_ready (control_merge10_index_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork44_outs_3, fork44_outs_2, fork44_outs_1, fork44_outs_0}),
    .outs_valid ({fork44_outs_3_valid, fork44_outs_2_valid, fork44_outs_1_valid, fork44_outs_0_valid}),
    .outs_ready ({fork44_outs_3_ready, fork44_outs_2_ready, fork44_outs_1_ready, fork44_outs_0_ready})
  );

  source source12(
    .clk (clk),
    .rst (rst),
    .outs_valid (source12_outs_valid),
    .outs_ready (source12_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant54(
    .ctrl_valid (source12_outs_valid),
    .ctrl_ready (source12_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant54_outs),
    .outs_valid (constant54_outs_valid),
    .outs_ready (constant54_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi85(
    .ins (constant54_outs),
    .ins_valid (constant54_outs_valid),
    .ins_ready (constant54_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi85_outs),
    .outs_valid (extsi85_outs_valid),
    .outs_ready (extsi85_outs_ready)
  );

  source source13(
    .clk (clk),
    .rst (rst),
    .outs_valid (source13_outs_valid),
    .outs_ready (source13_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant55(
    .ctrl_valid (source13_outs_valid),
    .ctrl_ready (source13_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant55_outs),
    .outs_valid (constant55_outs_valid),
    .outs_ready (constant55_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(2)) fork45(
    .ins (constant55_outs),
    .ins_valid (constant55_outs_valid),
    .ins_ready (constant55_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork45_outs_1, fork45_outs_0}),
    .outs_valid ({fork45_outs_1_valid, fork45_outs_0_valid}),
    .outs_ready ({fork45_outs_1_ready, fork45_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi86(
    .ins (fork45_outs_0),
    .ins_valid (fork45_outs_0_valid),
    .ins_ready (fork45_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi86_outs),
    .outs_valid (extsi86_outs_valid),
    .outs_ready (extsi86_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi38(
    .ins (fork45_outs_1),
    .ins_valid (fork45_outs_1_valid),
    .ins_ready (fork45_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi38_outs),
    .outs_valid (extsi38_outs_valid),
    .outs_ready (extsi38_outs_ready)
  );

  source source14(
    .clk (clk),
    .rst (rst),
    .outs_valid (source14_outs_valid),
    .outs_ready (source14_outs_ready)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant56(
    .ctrl_valid (source14_outs_valid),
    .ctrl_ready (source14_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant56_outs),
    .outs_valid (constant56_outs_valid),
    .outs_ready (constant56_outs_ready)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi39(
    .ins (constant56_outs),
    .ins_valid (constant56_outs_valid),
    .ins_ready (constant56_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi39_outs),
    .outs_valid (extsi39_outs_valid),
    .outs_ready (extsi39_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli6(
    .lhs (fork43_outs_0),
    .lhs_valid (fork43_outs_0_valid),
    .lhs_ready (fork43_outs_0_ready),
    .rhs (extsi38_outs),
    .rhs_valid (extsi38_outs_valid),
    .rhs_ready (extsi38_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli6_result),
    .result_valid (shli6_result_valid),
    .result_ready (shli6_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci30(
    .ins (shli6_result),
    .ins_valid (shli6_result_valid),
    .ins_ready (shli6_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci30_outs),
    .outs_valid (trunci30_outs_valid),
    .outs_ready (trunci30_outs_ready)
  );

  shli #(.DATA_TYPE(32)) shli7(
    .lhs (fork43_outs_1),
    .lhs_valid (fork43_outs_1_valid),
    .lhs_ready (fork43_outs_1_ready),
    .rhs (extsi39_outs),
    .rhs_valid (extsi39_outs_valid),
    .rhs_ready (extsi39_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (shli7_result),
    .result_valid (shli7_result_valid),
    .result_ready (shli7_result_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(7)) trunci31(
    .ins (shli7_result),
    .ins_valid (shli7_result_valid),
    .ins_ready (shli7_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci31_outs),
    .outs_valid (trunci31_outs_valid),
    .outs_ready (trunci31_outs_ready)
  );

  addi #(.DATA_TYPE(7)) addi19(
    .lhs (trunci30_outs),
    .lhs_valid (trunci30_outs_valid),
    .lhs_ready (trunci30_outs_ready),
    .rhs (trunci31_outs),
    .rhs_valid (trunci31_outs_valid),
    .rhs_ready (trunci31_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi19_result),
    .result_valid (addi19_result_valid),
    .result_ready (addi19_result_ready)
  );

  addi #(.DATA_TYPE(7)) addi8(
    .lhs (extsi81_outs),
    .lhs_valid (extsi81_outs_valid),
    .lhs_ready (extsi81_outs_ready),
    .rhs (addi19_result),
    .rhs_valid (addi19_result_valid),
    .rhs_ready (addi19_result_ready),
    .clk (clk),
    .rst (rst),
    .result (addi8_result),
    .result_valid (addi8_result_valid),
    .result_ready (addi8_result_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(7)) load11(
    .addrIn (addi8_result),
    .addrIn_valid (addi8_result_valid),
    .addrIn_ready (addi8_result_ready),
    .dataFromMem (mem_controller11_ldData_2),
    .dataFromMem_valid (mem_controller11_ldData_2_valid),
    .dataFromMem_ready (mem_controller11_ldData_2_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load11_addrOut),
    .addrOut_valid (load11_addrOut_valid),
    .addrOut_ready (load11_addrOut_ready),
    .dataOut (load11_dataOut),
    .dataOut_valid (load11_dataOut_valid),
    .dataOut_ready (load11_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(16)) extsi87(
    .ins (load11_dataOut),
    .ins_valid (load11_dataOut_valid),
    .ins_ready (load11_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi87_outs),
    .outs_valid (extsi87_outs_valid),
    .outs_ready (extsi87_outs_ready)
  );

  muli #(.DATA_TYPE(16)) muli4(
    .lhs (extsi83_outs),
    .lhs_valid (extsi83_outs_valid),
    .lhs_ready (extsi83_outs_ready),
    .rhs (extsi87_outs),
    .rhs_valid (extsi87_outs_valid),
    .rhs_ready (extsi87_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli4_result),
    .result_valid (muli4_result_valid),
    .result_ready (muli4_result_ready)
  );

  extsi #(.INPUT_TYPE(16), .OUTPUT_TYPE(24)) extsi88(
    .ins (muli4_result),
    .ins_valid (muli4_result_valid),
    .ins_ready (muli4_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi88_outs),
    .outs_valid (extsi88_outs_valid),
    .outs_ready (extsi88_outs_ready)
  );

  load #(.DATA_TYPE(8), .ADDR_TYPE(4)) load12(
    .addrIn (trunci29_outs),
    .addrIn_valid (trunci29_outs_valid),
    .addrIn_ready (trunci29_outs_ready),
    .dataFromMem (mem_controller9_ldData_2),
    .dataFromMem_valid (mem_controller9_ldData_2_valid),
    .dataFromMem_ready (mem_controller9_ldData_2_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (load12_addrOut),
    .addrOut_valid (load12_addrOut_valid),
    .addrOut_ready (load12_addrOut_ready),
    .dataOut (load12_dataOut),
    .dataOut_valid (load12_dataOut_valid),
    .dataOut_ready (load12_dataOut_ready)
  );

  extsi #(.INPUT_TYPE(8), .OUTPUT_TYPE(24)) extsi89(
    .ins (load12_dataOut),
    .ins_valid (load12_dataOut_valid),
    .ins_ready (load12_dataOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi89_outs),
    .outs_valid (extsi89_outs_valid),
    .outs_ready (extsi89_outs_ready)
  );

  muli #(.DATA_TYPE(24)) muli5(
    .lhs (extsi88_outs),
    .lhs_valid (extsi88_outs_valid),
    .lhs_ready (extsi88_outs_ready),
    .rhs (extsi89_outs),
    .rhs_valid (extsi89_outs_valid),
    .rhs_ready (extsi89_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (muli5_result),
    .result_valid (muli5_result_valid),
    .result_ready (muli5_result_ready)
  );

  extsi #(.INPUT_TYPE(24), .OUTPUT_TYPE(32)) extsi90(
    .ins (muli5_result),
    .ins_valid (muli5_result_valid),
    .ins_ready (muli5_result_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi90_outs),
    .outs_valid (extsi90_outs_valid),
    .outs_ready (extsi90_outs_ready)
  );

  oehb #(.DATA_TYPE(32)) buffer80(
    .ins (mux20_outs),
    .ins_valid (mux20_outs_valid),
    .ins_ready (mux20_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer80_outs),
    .outs_valid (buffer80_outs_valid),
    .outs_ready (buffer80_outs_ready)
  );

  tehb #(.DATA_TYPE(32)) buffer81(
    .ins (buffer80_outs),
    .ins_valid (buffer80_outs_valid),
    .ins_ready (buffer80_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer81_outs),
    .outs_valid (buffer81_outs_valid),
    .outs_ready (buffer81_outs_ready)
  );

  addi #(.DATA_TYPE(32)) addi4(
    .lhs (buffer81_outs),
    .lhs_valid (buffer81_outs_valid),
    .lhs_ready (buffer81_outs_ready),
    .rhs (extsi90_outs),
    .rhs_valid (extsi90_outs_valid),
    .rhs_ready (extsi90_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi4_result),
    .result_valid (addi4_result_valid),
    .result_ready (addi4_result_ready)
  );

  addi #(.DATA_TYPE(6)) addi14(
    .lhs (extsi82_outs),
    .lhs_valid (extsi82_outs_valid),
    .lhs_ready (extsi82_outs_ready),
    .rhs (extsi86_outs),
    .rhs_valid (extsi86_outs_valid),
    .rhs_ready (extsi86_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi14_result),
    .result_valid (addi14_result_valid),
    .result_ready (addi14_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork46(
    .ins (addi14_result),
    .ins_valid (addi14_result_valid),
    .ins_ready (addi14_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork46_outs_1, fork46_outs_0}),
    .outs_valid ({fork46_outs_1_valid, fork46_outs_0_valid}),
    .outs_ready ({fork46_outs_1_ready, fork46_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci32(
    .ins (fork46_outs_0),
    .ins_valid (fork46_outs_0_valid),
    .ins_ready (fork46_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci32_outs),
    .outs_valid (trunci32_outs_valid),
    .outs_ready (trunci32_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi5(
    .lhs (fork46_outs_1),
    .lhs_valid (fork46_outs_1_valid),
    .lhs_ready (fork46_outs_1_ready),
    .rhs (extsi85_outs),
    .rhs_valid (extsi85_outs_valid),
    .rhs_ready (extsi85_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi5_result),
    .result_valid (cmpi5_result_valid),
    .result_ready (cmpi5_result_ready)
  );

  fork_type #(.SIZE(5), .DATA_TYPE(1)) fork47(
    .ins (cmpi5_result),
    .ins_valid (cmpi5_result_valid),
    .ins_ready (cmpi5_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork47_outs_4, fork47_outs_3, fork47_outs_2, fork47_outs_1, fork47_outs_0}),
    .outs_valid ({fork47_outs_4_valid, fork47_outs_3_valid, fork47_outs_2_valid, fork47_outs_1_valid, fork47_outs_0_valid}),
    .outs_ready ({fork47_outs_4_ready, fork47_outs_3_ready, fork47_outs_2_ready, fork47_outs_1_ready, fork47_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br30(
    .condition (fork47_outs_0),
    .condition_valid (fork47_outs_0_valid),
    .condition_ready (fork47_outs_0_ready),
    .data (trunci32_outs),
    .data_valid (trunci32_outs_valid),
    .data_ready (trunci32_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br30_trueOut),
    .trueOut_valid (cond_br30_trueOut_valid),
    .trueOut_ready (cond_br30_trueOut_ready),
    .falseOut (cond_br30_falseOut),
    .falseOut_valid (cond_br30_falseOut_valid),
    .falseOut_ready (cond_br30_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink11(
    .ins (cond_br30_falseOut),
    .ins_valid (cond_br30_falseOut_valid),
    .ins_ready (cond_br30_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br31(
    .condition (fork47_outs_2),
    .condition_valid (fork47_outs_2_valid),
    .condition_ready (fork47_outs_2_ready),
    .data (addi4_result),
    .data_valid (addi4_result_valid),
    .data_ready (addi4_result_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br31_trueOut),
    .trueOut_valid (cond_br31_trueOut_valid),
    .trueOut_ready (cond_br31_trueOut_ready),
    .falseOut (cond_br31_falseOut),
    .falseOut_valid (cond_br31_falseOut_valid),
    .falseOut_ready (cond_br31_falseOut_ready)
  );

  trunci #(.INPUT_TYPE(32), .OUTPUT_TYPE(8)) trunci33(
    .ins (cond_br31_falseOut),
    .ins_valid (cond_br31_falseOut_valid),
    .ins_ready (cond_br31_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci33_outs),
    .outs_valid (trunci33_outs_valid),
    .outs_ready (trunci33_outs_ready)
  );

  cond_br #(.DATA_TYPE(8)) cond_br32(
    .condition (fork47_outs_4),
    .condition_valid (fork47_outs_4_valid),
    .condition_ready (fork47_outs_4_ready),
    .data (fork41_outs_0),
    .data_valid (fork41_outs_0_valid),
    .data_ready (fork41_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br32_trueOut),
    .trueOut_valid (cond_br32_trueOut_valid),
    .trueOut_ready (cond_br32_trueOut_ready),
    .falseOut (cond_br32_falseOut),
    .falseOut_valid (cond_br32_falseOut_valid),
    .falseOut_ready (cond_br32_falseOut_ready)
  );

  cond_br #(.DATA_TYPE(5)) cond_br33(
    .condition (fork47_outs_1),
    .condition_valid (fork47_outs_1_valid),
    .condition_ready (fork47_outs_1_ready),
    .data (fork42_outs_0),
    .data_valid (fork42_outs_0_valid),
    .data_ready (fork42_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br33_trueOut),
    .trueOut_valid (cond_br33_trueOut_valid),
    .trueOut_ready (cond_br33_trueOut_ready),
    .falseOut (cond_br33_falseOut),
    .falseOut_valid (cond_br33_falseOut_valid),
    .falseOut_ready (cond_br33_falseOut_ready)
  );

  oehb_dataless buffer86(
    .ins_valid (control_merge10_outs_valid),
    .ins_ready (control_merge10_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer86_outs_valid),
    .outs_ready (buffer86_outs_ready)
  );

  tehb_dataless buffer87(
    .ins_valid (buffer86_outs_valid),
    .ins_ready (buffer86_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer87_outs_valid),
    .outs_ready (buffer87_outs_ready)
  );

  cond_br_dataless cond_br34(
    .condition (fork47_outs_3),
    .condition_valid (fork47_outs_3_valid),
    .condition_ready (fork47_outs_3_ready),
    .data_valid (buffer87_outs_valid),
    .data_ready (buffer87_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br34_trueOut_valid),
    .trueOut_ready (cond_br34_trueOut_ready),
    .falseOut_valid (cond_br34_falseOut_valid),
    .falseOut_ready (cond_br34_falseOut_ready)
  );

  oehb #(.DATA_TYPE(5)) buffer90(
    .ins (cond_br33_falseOut),
    .ins_valid (cond_br33_falseOut_valid),
    .ins_ready (cond_br33_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer90_outs),
    .outs_valid (buffer90_outs_valid),
    .outs_ready (buffer90_outs_ready)
  );

  tehb #(.DATA_TYPE(5)) buffer91(
    .ins (buffer90_outs),
    .ins_valid (buffer90_outs_valid),
    .ins_ready (buffer90_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (buffer91_outs),
    .outs_valid (buffer91_outs_valid),
    .outs_ready (buffer91_outs_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(5)) fork48(
    .ins (buffer91_outs),
    .ins_valid (buffer91_outs_valid),
    .ins_ready (buffer91_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork48_outs_1, fork48_outs_0}),
    .outs_valid ({fork48_outs_1_valid, fork48_outs_0_valid}),
    .outs_ready ({fork48_outs_1_ready, fork48_outs_0_ready})
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi91(
    .ins (fork48_outs_1),
    .ins_valid (fork48_outs_1_valid),
    .ins_ready (fork48_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi91_outs),
    .outs_valid (extsi91_outs_valid),
    .outs_ready (extsi91_outs_ready)
  );

  trunci #(.INPUT_TYPE(5), .OUTPUT_TYPE(4)) trunci34(
    .ins (fork48_outs_0),
    .ins_valid (fork48_outs_0_valid),
    .ins_ready (fork48_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci34_outs),
    .outs_valid (trunci34_outs_valid),
    .outs_ready (trunci34_outs_ready)
  );

  oehb_dataless buffer94(
    .ins_valid (cond_br34_falseOut_valid),
    .ins_ready (cond_br34_falseOut_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer94_outs_valid),
    .outs_ready (buffer94_outs_ready)
  );

  tehb_dataless buffer95(
    .ins_valid (buffer94_outs_valid),
    .ins_ready (buffer94_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid (buffer95_outs_valid),
    .outs_ready (buffer95_outs_ready)
  );

  fork_dataless #(.SIZE(2)) fork49(
    .ins_valid (buffer95_outs_valid),
    .ins_ready (buffer95_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork49_outs_1_valid, fork49_outs_0_valid}),
    .outs_ready ({fork49_outs_1_ready, fork49_outs_0_ready})
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant57(
    .ctrl_valid (fork49_outs_0_valid),
    .ctrl_ready (fork49_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant57_outs),
    .outs_valid (constant57_outs_valid),
    .outs_ready (constant57_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi40(
    .ins (constant57_outs),
    .ins_valid (constant57_outs_valid),
    .ins_ready (constant57_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi40_outs),
    .outs_valid (extsi40_outs_valid),
    .outs_ready (extsi40_outs_ready)
  );

  source source15(
    .clk (clk),
    .rst (rst),
    .outs_valid (source15_outs_valid),
    .outs_ready (source15_outs_ready)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant58(
    .ctrl_valid (source15_outs_valid),
    .ctrl_ready (source15_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant58_outs),
    .outs_valid (constant58_outs_valid),
    .outs_ready (constant58_outs_ready)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(6)) extsi92(
    .ins (constant58_outs),
    .ins_valid (constant58_outs_valid),
    .ins_ready (constant58_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi92_outs),
    .outs_valid (extsi92_outs_valid),
    .outs_ready (extsi92_outs_ready)
  );

  source source16(
    .clk (clk),
    .rst (rst),
    .outs_valid (source16_outs_valid),
    .outs_ready (source16_outs_ready)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant59(
    .ctrl_valid (source16_outs_valid),
    .ctrl_ready (source16_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (constant59_outs),
    .outs_valid (constant59_outs_valid),
    .outs_ready (constant59_outs_ready)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(6)) extsi93(
    .ins (constant59_outs),
    .ins_valid (constant59_outs_valid),
    .ins_ready (constant59_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs (extsi93_outs),
    .outs_valid (extsi93_outs_valid),
    .outs_ready (extsi93_outs_ready)
  );

  oehb #(.DATA_TYPE(8)) buffer92(
    .ins (trunci33_outs),
    .ins_valid (trunci33_outs_valid),
    .ins_ready (trunci33_outs_ready),
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

  store #(.DATA_TYPE(8), .ADDR_TYPE(4)) store3(
    .addrIn (trunci34_outs),
    .addrIn_valid (trunci34_outs_valid),
    .addrIn_ready (trunci34_outs_ready),
    .dataIn (buffer93_outs),
    .dataIn_valid (buffer93_outs_valid),
    .dataIn_ready (buffer93_outs_ready),
    .clk (clk),
    .rst (rst),
    .addrOut (store3_addrOut),
    .addrOut_valid (store3_addrOut_valid),
    .addrOut_ready (store3_addrOut_ready),
    .dataToMem (store3_dataToMem),
    .dataToMem_valid (store3_dataToMem_valid),
    .dataToMem_ready (store3_dataToMem_ready)
  );

  addi #(.DATA_TYPE(6)) addi15(
    .lhs (extsi91_outs),
    .lhs_valid (extsi91_outs_valid),
    .lhs_ready (extsi91_outs_ready),
    .rhs (extsi93_outs),
    .rhs_valid (extsi93_outs_valid),
    .rhs_ready (extsi93_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (addi15_result),
    .result_valid (addi15_result_valid),
    .result_ready (addi15_result_ready)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(6)) fork50(
    .ins (addi15_result),
    .ins_valid (addi15_result_valid),
    .ins_ready (addi15_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork50_outs_1, fork50_outs_0}),
    .outs_valid ({fork50_outs_1_valid, fork50_outs_0_valid}),
    .outs_ready ({fork50_outs_1_ready, fork50_outs_0_ready})
  );

  trunci #(.INPUT_TYPE(6), .OUTPUT_TYPE(5)) trunci35(
    .ins (fork50_outs_0),
    .ins_valid (fork50_outs_0_valid),
    .ins_ready (fork50_outs_0_ready),
    .clk (clk),
    .rst (rst),
    .outs (trunci35_outs),
    .outs_valid (trunci35_outs_valid),
    .outs_ready (trunci35_outs_ready)
  );

  handshake_cmpi_0 #(.DATA_TYPE(6)) cmpi6(
    .lhs (fork50_outs_1),
    .lhs_valid (fork50_outs_1_valid),
    .lhs_ready (fork50_outs_1_ready),
    .rhs (extsi92_outs),
    .rhs_valid (extsi92_outs_valid),
    .rhs_ready (extsi92_outs_ready),
    .clk (clk),
    .rst (rst),
    .result (cmpi6_result),
    .result_valid (cmpi6_result_valid),
    .result_ready (cmpi6_result_ready)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork51(
    .ins (cmpi6_result),
    .ins_valid (cmpi6_result_valid),
    .ins_ready (cmpi6_result_ready),
    .clk (clk),
    .rst (rst),
    .outs ({fork51_outs_2, fork51_outs_1, fork51_outs_0}),
    .outs_valid ({fork51_outs_2_valid, fork51_outs_1_valid, fork51_outs_0_valid}),
    .outs_ready ({fork51_outs_2_ready, fork51_outs_1_ready, fork51_outs_0_ready})
  );

  cond_br #(.DATA_TYPE(5)) cond_br35(
    .condition (fork51_outs_0),
    .condition_valid (fork51_outs_0_valid),
    .condition_ready (fork51_outs_0_ready),
    .data (trunci35_outs),
    .data_valid (trunci35_outs_valid),
    .data_ready (trunci35_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br35_trueOut),
    .trueOut_valid (cond_br35_trueOut_valid),
    .trueOut_ready (cond_br35_trueOut_ready),
    .falseOut (cond_br35_falseOut),
    .falseOut_valid (cond_br35_falseOut_valid),
    .falseOut_ready (cond_br35_falseOut_ready)
  );

  sink #(.DATA_TYPE(5)) sink13(
    .ins (cond_br35_falseOut),
    .ins_valid (cond_br35_falseOut_valid),
    .ins_ready (cond_br35_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(8)) buffer88(
    .ins (cond_br32_falseOut),
    .ins_valid (cond_br32_falseOut_valid),
    .ins_ready (cond_br32_falseOut_ready),
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

  cond_br #(.DATA_TYPE(8)) cond_br36(
    .condition (fork51_outs_2),
    .condition_valid (fork51_outs_2_valid),
    .condition_ready (fork51_outs_2_ready),
    .data (buffer89_outs),
    .data_valid (buffer89_outs_valid),
    .data_ready (buffer89_outs_ready),
    .clk (clk),
    .rst (rst),
    .trueOut (cond_br36_trueOut),
    .trueOut_valid (cond_br36_trueOut_valid),
    .trueOut_ready (cond_br36_trueOut_ready),
    .falseOut (cond_br36_falseOut),
    .falseOut_valid (cond_br36_falseOut_valid),
    .falseOut_ready (cond_br36_falseOut_ready)
  );

  sink #(.DATA_TYPE(8)) sink14(
    .ins (cond_br36_falseOut),
    .ins_valid (cond_br36_falseOut_valid),
    .ins_ready (cond_br36_falseOut_ready),
    .clk (clk),
    .rst (rst)
  );

  cond_br_dataless cond_br37(
    .condition (fork51_outs_1),
    .condition_valid (fork51_outs_1_valid),
    .condition_ready (fork51_outs_1_ready),
    .data_valid (fork49_outs_1_valid),
    .data_ready (fork49_outs_1_ready),
    .clk (clk),
    .rst (rst),
    .trueOut_valid (cond_br37_trueOut_valid),
    .trueOut_ready (cond_br37_trueOut_ready),
    .falseOut_valid (cond_br37_falseOut_valid),
    .falseOut_ready (cond_br37_falseOut_ready)
  );

  oehb_dataless buffer96(
    .ins_valid (cond_br37_falseOut_valid),
    .ins_ready (cond_br37_falseOut_ready),
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

  fork_dataless #(.SIZE(9)) fork52(
    .ins_valid (buffer97_outs_valid),
    .ins_ready (buffer97_outs_ready),
    .clk (clk),
    .rst (rst),
    .outs_valid ({fork52_outs_8_valid, fork52_outs_7_valid, fork52_outs_6_valid, fork52_outs_5_valid, fork52_outs_4_valid, fork52_outs_3_valid, fork52_outs_2_valid, fork52_outs_1_valid, fork52_outs_0_valid}),
    .outs_ready ({fork52_outs_8_ready, fork52_outs_7_ready, fork52_outs_6_ready, fork52_outs_5_ready, fork52_outs_4_ready, fork52_outs_3_ready, fork52_outs_2_ready, fork52_outs_1_ready, fork52_outs_0_ready})
  );

endmodule
