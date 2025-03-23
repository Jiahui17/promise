module gemver_wrapper(
  input [7:0] alpha,
  input  alpha_valid,
  input [7:0] beta,
  input  beta_valid,
  input [7:0] u1_din0,
  input [7:0] u1_din1,
  input [7:0] v1_din0,
  input [7:0] v1_din1,
  input [7:0] u2_din0,
  input [7:0] u2_din1,
  input [7:0] v2_din0,
  input [7:0] v2_din1,
  input [7:0] y_din0,
  input [7:0] y_din1,
  input [7:0] z_din0,
  input [7:0] z_din1,
  input [7:0] a_din0,
  input [7:0] a_din1,
  input [7:0] w_din0,
  input [7:0] w_din1,
  input [7:0] x_din0,
  input [7:0] x_din1,
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
  output  u1_ce0,
  output  u1_we0,
  output [3:0] u1_address0,
  output [7:0] u1_dout0,
  output  u1_ce1,
  output  u1_we1,
  output [3:0] u1_address1,
  output [7:0] u1_dout1,
  output  v1_ce0,
  output  v1_we0,
  output [3:0] v1_address0,
  output [7:0] v1_dout0,
  output  v1_ce1,
  output  v1_we1,
  output [3:0] v1_address1,
  output [7:0] v1_dout1,
  output  u2_ce0,
  output  u2_we0,
  output [3:0] u2_address0,
  output [7:0] u2_dout0,
  output  u2_ce1,
  output  u2_we1,
  output [3:0] u2_address1,
  output [7:0] u2_dout1,
  output  v2_ce0,
  output  v2_we0,
  output [3:0] v2_address0,
  output [7:0] v2_dout0,
  output  v2_ce1,
  output  v2_we1,
  output [3:0] v2_address1,
  output [7:0] v2_dout1,
  output  y_ce0,
  output  y_we0,
  output [3:0] y_address0,
  output [7:0] y_dout0,
  output  y_ce1,
  output  y_we1,
  output [3:0] y_address1,
  output [7:0] y_dout1,
  output  z_ce0,
  output  z_we0,
  output [3:0] z_address0,
  output [7:0] z_dout0,
  output  z_ce1,
  output  z_we1,
  output [3:0] z_address1,
  output [7:0] z_dout1,
  output  a_ce0,
  output  a_we0,
  output [6:0] a_address0,
  output [7:0] a_dout0,
  output  a_ce1,
  output  a_we1,
  output [6:0] a_address1,
  output [7:0] a_dout1,
  output  w_ce0,
  output  w_we0,
  output [3:0] w_address0,
  output [7:0] w_dout0,
  output  w_ce1,
  output  w_we1,
  output [3:0] w_address1,
  output [7:0] w_dout1,
  output  x_ce0,
  output  x_we0,
  output [3:0] x_address0,
  output [7:0] x_dout0,
  output  x_ce1,
  output  x_we1,
  output [3:0] x_address1,
  output [7:0] x_dout1
);
  wire  mem_to_bram_converter_a_ce0;
  wire  mem_to_bram_converter_a_we0;
  wire [6:0] mem_to_bram_converter_a_address0;
  wire [7:0] mem_to_bram_converter_a_dout0;
  wire  mem_to_bram_converter_a_ce1;
  wire  mem_to_bram_converter_a_we1;
  wire [6:0] mem_to_bram_converter_a_address1;
  wire [7:0] mem_to_bram_converter_a_dout1;
  wire [7:0] mem_to_bram_converter_a_loadData;
  wire  mem_to_bram_converter_v1_ce0;
  wire  mem_to_bram_converter_v1_we0;
  wire [3:0] mem_to_bram_converter_v1_address0;
  wire [7:0] mem_to_bram_converter_v1_dout0;
  wire  mem_to_bram_converter_v1_ce1;
  wire  mem_to_bram_converter_v1_we1;
  wire [3:0] mem_to_bram_converter_v1_address1;
  wire [7:0] mem_to_bram_converter_v1_dout1;
  wire [7:0] mem_to_bram_converter_v1_loadData;
  wire  mem_to_bram_converter_v2_ce0;
  wire  mem_to_bram_converter_v2_we0;
  wire [3:0] mem_to_bram_converter_v2_address0;
  wire [7:0] mem_to_bram_converter_v2_dout0;
  wire  mem_to_bram_converter_v2_ce1;
  wire  mem_to_bram_converter_v2_we1;
  wire [3:0] mem_to_bram_converter_v2_address1;
  wire [7:0] mem_to_bram_converter_v2_dout1;
  wire [7:0] mem_to_bram_converter_v2_loadData;
  wire  mem_to_bram_converter_x_ce0;
  wire  mem_to_bram_converter_x_we0;
  wire [3:0] mem_to_bram_converter_x_address0;
  wire [7:0] mem_to_bram_converter_x_dout0;
  wire  mem_to_bram_converter_x_ce1;
  wire  mem_to_bram_converter_x_we1;
  wire [3:0] mem_to_bram_converter_x_address1;
  wire [7:0] mem_to_bram_converter_x_dout1;
  wire [7:0] mem_to_bram_converter_x_loadData;
  wire  mem_to_bram_converter_w_ce0;
  wire  mem_to_bram_converter_w_we0;
  wire [3:0] mem_to_bram_converter_w_address0;
  wire [7:0] mem_to_bram_converter_w_dout0;
  wire  mem_to_bram_converter_w_ce1;
  wire  mem_to_bram_converter_w_we1;
  wire [3:0] mem_to_bram_converter_w_address1;
  wire [7:0] mem_to_bram_converter_w_dout1;
  wire [7:0] mem_to_bram_converter_w_loadData;
  wire  mem_to_bram_converter_u1_ce0;
  wire  mem_to_bram_converter_u1_we0;
  wire [3:0] mem_to_bram_converter_u1_address0;
  wire [7:0] mem_to_bram_converter_u1_dout0;
  wire  mem_to_bram_converter_u1_ce1;
  wire  mem_to_bram_converter_u1_we1;
  wire [3:0] mem_to_bram_converter_u1_address1;
  wire [7:0] mem_to_bram_converter_u1_dout1;
  wire [7:0] mem_to_bram_converter_u1_loadData;
  wire  mem_to_bram_converter_z_ce0;
  wire  mem_to_bram_converter_z_we0;
  wire [3:0] mem_to_bram_converter_z_address0;
  wire [7:0] mem_to_bram_converter_z_dout0;
  wire  mem_to_bram_converter_z_ce1;
  wire  mem_to_bram_converter_z_we1;
  wire [3:0] mem_to_bram_converter_z_address1;
  wire [7:0] mem_to_bram_converter_z_dout1;
  wire [7:0] mem_to_bram_converter_z_loadData;
  wire  mem_to_bram_converter_y_ce0;
  wire  mem_to_bram_converter_y_we0;
  wire [3:0] mem_to_bram_converter_y_address0;
  wire [7:0] mem_to_bram_converter_y_dout0;
  wire  mem_to_bram_converter_y_ce1;
  wire  mem_to_bram_converter_y_we1;
  wire [3:0] mem_to_bram_converter_y_address1;
  wire [7:0] mem_to_bram_converter_y_dout1;
  wire [7:0] mem_to_bram_converter_y_loadData;
  wire  mem_to_bram_converter_u2_ce0;
  wire  mem_to_bram_converter_u2_we0;
  wire [3:0] mem_to_bram_converter_u2_address0;
  wire [7:0] mem_to_bram_converter_u2_dout0;
  wire  mem_to_bram_converter_u2_ce1;
  wire  mem_to_bram_converter_u2_we1;
  wire [3:0] mem_to_bram_converter_u2_address1;
  wire [7:0] mem_to_bram_converter_u2_dout1;
  wire [7:0] mem_to_bram_converter_u2_loadData;
  wire  gemver_wrapped_u1_end_valid;
  wire  gemver_wrapped_u1_end_ready;
  wire  gemver_wrapped_v1_end_valid;
  wire  gemver_wrapped_v1_end_ready;
  wire  gemver_wrapped_u2_end_valid;
  wire  gemver_wrapped_u2_end_ready;
  wire  gemver_wrapped_v2_end_valid;
  wire  gemver_wrapped_v2_end_ready;
  wire  gemver_wrapped_y_end_valid;
  wire  gemver_wrapped_y_end_ready;
  wire  gemver_wrapped_z_end_valid;
  wire  gemver_wrapped_z_end_ready;
  wire  gemver_wrapped_a_end_valid;
  wire  gemver_wrapped_a_end_ready;
  wire  gemver_wrapped_w_end_valid;
  wire  gemver_wrapped_w_end_ready;
  wire  gemver_wrapped_x_end_valid;
  wire  gemver_wrapped_x_end_ready;
  wire  gemver_wrapped_end_valid;
  wire  gemver_wrapped_end_ready;
  wire  gemver_wrapped_u1_loadEn;
  wire [3:0] gemver_wrapped_u1_loadAddr;
  wire  gemver_wrapped_u1_storeEn;
  wire [3:0] gemver_wrapped_u1_storeAddr;
  wire [7:0] gemver_wrapped_u1_storeData;
  wire  gemver_wrapped_v1_loadEn;
  wire [3:0] gemver_wrapped_v1_loadAddr;
  wire  gemver_wrapped_v1_storeEn;
  wire [3:0] gemver_wrapped_v1_storeAddr;
  wire [7:0] gemver_wrapped_v1_storeData;
  wire  gemver_wrapped_u2_loadEn;
  wire [3:0] gemver_wrapped_u2_loadAddr;
  wire  gemver_wrapped_u2_storeEn;
  wire [3:0] gemver_wrapped_u2_storeAddr;
  wire [7:0] gemver_wrapped_u2_storeData;
  wire  gemver_wrapped_v2_loadEn;
  wire [3:0] gemver_wrapped_v2_loadAddr;
  wire  gemver_wrapped_v2_storeEn;
  wire [3:0] gemver_wrapped_v2_storeAddr;
  wire [7:0] gemver_wrapped_v2_storeData;
  wire  gemver_wrapped_y_loadEn;
  wire [3:0] gemver_wrapped_y_loadAddr;
  wire  gemver_wrapped_y_storeEn;
  wire [3:0] gemver_wrapped_y_storeAddr;
  wire [7:0] gemver_wrapped_y_storeData;
  wire  gemver_wrapped_z_loadEn;
  wire [3:0] gemver_wrapped_z_loadAddr;
  wire  gemver_wrapped_z_storeEn;
  wire [3:0] gemver_wrapped_z_storeAddr;
  wire [7:0] gemver_wrapped_z_storeData;
  wire  gemver_wrapped_a_loadEn;
  wire [6:0] gemver_wrapped_a_loadAddr;
  wire  gemver_wrapped_a_storeEn;
  wire [6:0] gemver_wrapped_a_storeAddr;
  wire [7:0] gemver_wrapped_a_storeData;
  wire  gemver_wrapped_w_loadEn;
  wire [3:0] gemver_wrapped_w_loadAddr;
  wire  gemver_wrapped_w_storeEn;
  wire [3:0] gemver_wrapped_w_storeAddr;
  wire [7:0] gemver_wrapped_w_storeData;
  wire  gemver_wrapped_x_loadEn;
  wire [3:0] gemver_wrapped_x_loadAddr;
  wire  gemver_wrapped_x_storeEn;
  wire [3:0] gemver_wrapped_x_storeAddr;
  wire [7:0] gemver_wrapped_x_storeData;

  assign u1_end_valid = gemver_wrapped_u1_end_valid;
  assign gemver_wrapped_u1_end_ready = u1_end_ready;
  assign v1_end_valid = gemver_wrapped_v1_end_valid;
  assign gemver_wrapped_v1_end_ready = v1_end_ready;
  assign u2_end_valid = gemver_wrapped_u2_end_valid;
  assign gemver_wrapped_u2_end_ready = u2_end_ready;
  assign v2_end_valid = gemver_wrapped_v2_end_valid;
  assign gemver_wrapped_v2_end_ready = v2_end_ready;
  assign y_end_valid = gemver_wrapped_y_end_valid;
  assign gemver_wrapped_y_end_ready = y_end_ready;
  assign z_end_valid = gemver_wrapped_z_end_valid;
  assign gemver_wrapped_z_end_ready = z_end_ready;
  assign a_end_valid = gemver_wrapped_a_end_valid;
  assign gemver_wrapped_a_end_ready = a_end_ready;
  assign w_end_valid = gemver_wrapped_w_end_valid;
  assign gemver_wrapped_w_end_ready = w_end_ready;
  assign x_end_valid = gemver_wrapped_x_end_valid;
  assign gemver_wrapped_x_end_ready = x_end_ready;
  assign end_valid = gemver_wrapped_end_valid;
  assign gemver_wrapped_end_ready = end_ready;
  assign u1_ce0 = mem_to_bram_converter_u1_ce0;
  assign u1_we0 = mem_to_bram_converter_u1_we0;
  assign u1_address0 = mem_to_bram_converter_u1_address0;
  assign u1_dout0 = mem_to_bram_converter_u1_dout0;
  assign u1_ce1 = mem_to_bram_converter_u1_ce1;
  assign u1_we1 = mem_to_bram_converter_u1_we1;
  assign u1_address1 = mem_to_bram_converter_u1_address1;
  assign u1_dout1 = mem_to_bram_converter_u1_dout1;
  assign v1_ce0 = mem_to_bram_converter_v1_ce0;
  assign v1_we0 = mem_to_bram_converter_v1_we0;
  assign v1_address0 = mem_to_bram_converter_v1_address0;
  assign v1_dout0 = mem_to_bram_converter_v1_dout0;
  assign v1_ce1 = mem_to_bram_converter_v1_ce1;
  assign v1_we1 = mem_to_bram_converter_v1_we1;
  assign v1_address1 = mem_to_bram_converter_v1_address1;
  assign v1_dout1 = mem_to_bram_converter_v1_dout1;
  assign u2_ce0 = mem_to_bram_converter_u2_ce0;
  assign u2_we0 = mem_to_bram_converter_u2_we0;
  assign u2_address0 = mem_to_bram_converter_u2_address0;
  assign u2_dout0 = mem_to_bram_converter_u2_dout0;
  assign u2_ce1 = mem_to_bram_converter_u2_ce1;
  assign u2_we1 = mem_to_bram_converter_u2_we1;
  assign u2_address1 = mem_to_bram_converter_u2_address1;
  assign u2_dout1 = mem_to_bram_converter_u2_dout1;
  assign v2_ce0 = mem_to_bram_converter_v2_ce0;
  assign v2_we0 = mem_to_bram_converter_v2_we0;
  assign v2_address0 = mem_to_bram_converter_v2_address0;
  assign v2_dout0 = mem_to_bram_converter_v2_dout0;
  assign v2_ce1 = mem_to_bram_converter_v2_ce1;
  assign v2_we1 = mem_to_bram_converter_v2_we1;
  assign v2_address1 = mem_to_bram_converter_v2_address1;
  assign v2_dout1 = mem_to_bram_converter_v2_dout1;
  assign y_ce0 = mem_to_bram_converter_y_ce0;
  assign y_we0 = mem_to_bram_converter_y_we0;
  assign y_address0 = mem_to_bram_converter_y_address0;
  assign y_dout0 = mem_to_bram_converter_y_dout0;
  assign y_ce1 = mem_to_bram_converter_y_ce1;
  assign y_we1 = mem_to_bram_converter_y_we1;
  assign y_address1 = mem_to_bram_converter_y_address1;
  assign y_dout1 = mem_to_bram_converter_y_dout1;
  assign z_ce0 = mem_to_bram_converter_z_ce0;
  assign z_we0 = mem_to_bram_converter_z_we0;
  assign z_address0 = mem_to_bram_converter_z_address0;
  assign z_dout0 = mem_to_bram_converter_z_dout0;
  assign z_ce1 = mem_to_bram_converter_z_ce1;
  assign z_we1 = mem_to_bram_converter_z_we1;
  assign z_address1 = mem_to_bram_converter_z_address1;
  assign z_dout1 = mem_to_bram_converter_z_dout1;
  assign a_ce0 = mem_to_bram_converter_a_ce0;
  assign a_we0 = mem_to_bram_converter_a_we0;
  assign a_address0 = mem_to_bram_converter_a_address0;
  assign a_dout0 = mem_to_bram_converter_a_dout0;
  assign a_ce1 = mem_to_bram_converter_a_ce1;
  assign a_we1 = mem_to_bram_converter_a_we1;
  assign a_address1 = mem_to_bram_converter_a_address1;
  assign a_dout1 = mem_to_bram_converter_a_dout1;
  assign w_ce0 = mem_to_bram_converter_w_ce0;
  assign w_we0 = mem_to_bram_converter_w_we0;
  assign w_address0 = mem_to_bram_converter_w_address0;
  assign w_dout0 = mem_to_bram_converter_w_dout0;
  assign w_ce1 = mem_to_bram_converter_w_ce1;
  assign w_we1 = mem_to_bram_converter_w_we1;
  assign w_address1 = mem_to_bram_converter_w_address1;
  assign w_dout1 = mem_to_bram_converter_w_dout1;
  assign x_ce0 = mem_to_bram_converter_x_ce0;
  assign x_we0 = mem_to_bram_converter_x_we0;
  assign x_address0 = mem_to_bram_converter_x_address0;
  assign x_dout0 = mem_to_bram_converter_x_dout0;
  assign x_ce1 = mem_to_bram_converter_x_ce1;
  assign x_we1 = mem_to_bram_converter_x_we1;
  assign x_address1 = mem_to_bram_converter_x_address1;
  assign x_dout1 = mem_to_bram_converter_x_dout1;

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_a(
    .loadEn (gemver_wrapped_a_loadEn),
    .loadAddr (gemver_wrapped_a_loadAddr),
    .storeEn (gemver_wrapped_a_storeEn),
    .storeAddr (gemver_wrapped_a_storeAddr),
    .storeData (gemver_wrapped_a_storeData),
    .din0 (a_din0),
    .din1 (a_din1),
    .ce0 (mem_to_bram_converter_a_ce0),
    .we0 (mem_to_bram_converter_a_we0),
    .address0 (mem_to_bram_converter_a_address0),
    .dout0 (mem_to_bram_converter_a_dout0),
    .ce1 (mem_to_bram_converter_a_ce1),
    .we1 (mem_to_bram_converter_a_we1),
    .address1 (mem_to_bram_converter_a_address1),
    .dout1 (mem_to_bram_converter_a_dout1),
    .loadData (mem_to_bram_converter_a_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_v1(
    .loadEn (gemver_wrapped_v1_loadEn),
    .loadAddr (gemver_wrapped_v1_loadAddr),
    .storeEn (gemver_wrapped_v1_storeEn),
    .storeAddr (gemver_wrapped_v1_storeAddr),
    .storeData (gemver_wrapped_v1_storeData),
    .din0 (v1_din0),
    .din1 (v1_din1),
    .ce0 (mem_to_bram_converter_v1_ce0),
    .we0 (mem_to_bram_converter_v1_we0),
    .address0 (mem_to_bram_converter_v1_address0),
    .dout0 (mem_to_bram_converter_v1_dout0),
    .ce1 (mem_to_bram_converter_v1_ce1),
    .we1 (mem_to_bram_converter_v1_we1),
    .address1 (mem_to_bram_converter_v1_address1),
    .dout1 (mem_to_bram_converter_v1_dout1),
    .loadData (mem_to_bram_converter_v1_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_v2(
    .loadEn (gemver_wrapped_v2_loadEn),
    .loadAddr (gemver_wrapped_v2_loadAddr),
    .storeEn (gemver_wrapped_v2_storeEn),
    .storeAddr (gemver_wrapped_v2_storeAddr),
    .storeData (gemver_wrapped_v2_storeData),
    .din0 (v2_din0),
    .din1 (v2_din1),
    .ce0 (mem_to_bram_converter_v2_ce0),
    .we0 (mem_to_bram_converter_v2_we0),
    .address0 (mem_to_bram_converter_v2_address0),
    .dout0 (mem_to_bram_converter_v2_dout0),
    .ce1 (mem_to_bram_converter_v2_ce1),
    .we1 (mem_to_bram_converter_v2_we1),
    .address1 (mem_to_bram_converter_v2_address1),
    .dout1 (mem_to_bram_converter_v2_dout1),
    .loadData (mem_to_bram_converter_v2_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_x(
    .loadEn (gemver_wrapped_x_loadEn),
    .loadAddr (gemver_wrapped_x_loadAddr),
    .storeEn (gemver_wrapped_x_storeEn),
    .storeAddr (gemver_wrapped_x_storeAddr),
    .storeData (gemver_wrapped_x_storeData),
    .din0 (x_din0),
    .din1 (x_din1),
    .ce0 (mem_to_bram_converter_x_ce0),
    .we0 (mem_to_bram_converter_x_we0),
    .address0 (mem_to_bram_converter_x_address0),
    .dout0 (mem_to_bram_converter_x_dout0),
    .ce1 (mem_to_bram_converter_x_ce1),
    .we1 (mem_to_bram_converter_x_we1),
    .address1 (mem_to_bram_converter_x_address1),
    .dout1 (mem_to_bram_converter_x_dout1),
    .loadData (mem_to_bram_converter_x_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_w(
    .loadEn (gemver_wrapped_w_loadEn),
    .loadAddr (gemver_wrapped_w_loadAddr),
    .storeEn (gemver_wrapped_w_storeEn),
    .storeAddr (gemver_wrapped_w_storeAddr),
    .storeData (gemver_wrapped_w_storeData),
    .din0 (w_din0),
    .din1 (w_din1),
    .ce0 (mem_to_bram_converter_w_ce0),
    .we0 (mem_to_bram_converter_w_we0),
    .address0 (mem_to_bram_converter_w_address0),
    .dout0 (mem_to_bram_converter_w_dout0),
    .ce1 (mem_to_bram_converter_w_ce1),
    .we1 (mem_to_bram_converter_w_we1),
    .address1 (mem_to_bram_converter_w_address1),
    .dout1 (mem_to_bram_converter_w_dout1),
    .loadData (mem_to_bram_converter_w_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_u1(
    .loadEn (gemver_wrapped_u1_loadEn),
    .loadAddr (gemver_wrapped_u1_loadAddr),
    .storeEn (gemver_wrapped_u1_storeEn),
    .storeAddr (gemver_wrapped_u1_storeAddr),
    .storeData (gemver_wrapped_u1_storeData),
    .din0 (u1_din0),
    .din1 (u1_din1),
    .ce0 (mem_to_bram_converter_u1_ce0),
    .we0 (mem_to_bram_converter_u1_we0),
    .address0 (mem_to_bram_converter_u1_address0),
    .dout0 (mem_to_bram_converter_u1_dout0),
    .ce1 (mem_to_bram_converter_u1_ce1),
    .we1 (mem_to_bram_converter_u1_we1),
    .address1 (mem_to_bram_converter_u1_address1),
    .dout1 (mem_to_bram_converter_u1_dout1),
    .loadData (mem_to_bram_converter_u1_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_z(
    .loadEn (gemver_wrapped_z_loadEn),
    .loadAddr (gemver_wrapped_z_loadAddr),
    .storeEn (gemver_wrapped_z_storeEn),
    .storeAddr (gemver_wrapped_z_storeAddr),
    .storeData (gemver_wrapped_z_storeData),
    .din0 (z_din0),
    .din1 (z_din1),
    .ce0 (mem_to_bram_converter_z_ce0),
    .we0 (mem_to_bram_converter_z_we0),
    .address0 (mem_to_bram_converter_z_address0),
    .dout0 (mem_to_bram_converter_z_dout0),
    .ce1 (mem_to_bram_converter_z_ce1),
    .we1 (mem_to_bram_converter_z_we1),
    .address1 (mem_to_bram_converter_z_address1),
    .dout1 (mem_to_bram_converter_z_dout1),
    .loadData (mem_to_bram_converter_z_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_y(
    .loadEn (gemver_wrapped_y_loadEn),
    .loadAddr (gemver_wrapped_y_loadAddr),
    .storeEn (gemver_wrapped_y_storeEn),
    .storeAddr (gemver_wrapped_y_storeAddr),
    .storeData (gemver_wrapped_y_storeData),
    .din0 (y_din0),
    .din1 (y_din1),
    .ce0 (mem_to_bram_converter_y_ce0),
    .we0 (mem_to_bram_converter_y_we0),
    .address0 (mem_to_bram_converter_y_address0),
    .dout0 (mem_to_bram_converter_y_dout0),
    .ce1 (mem_to_bram_converter_y_ce1),
    .we1 (mem_to_bram_converter_y_we1),
    .address1 (mem_to_bram_converter_y_address1),
    .dout1 (mem_to_bram_converter_y_dout1),
    .loadData (mem_to_bram_converter_y_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_u2(
    .loadEn (gemver_wrapped_u2_loadEn),
    .loadAddr (gemver_wrapped_u2_loadAddr),
    .storeEn (gemver_wrapped_u2_storeEn),
    .storeAddr (gemver_wrapped_u2_storeAddr),
    .storeData (gemver_wrapped_u2_storeData),
    .din0 (u2_din0),
    .din1 (u2_din1),
    .ce0 (mem_to_bram_converter_u2_ce0),
    .we0 (mem_to_bram_converter_u2_we0),
    .address0 (mem_to_bram_converter_u2_address0),
    .dout0 (mem_to_bram_converter_u2_dout0),
    .ce1 (mem_to_bram_converter_u2_ce1),
    .we1 (mem_to_bram_converter_u2_we1),
    .address1 (mem_to_bram_converter_u2_address1),
    .dout1 (mem_to_bram_converter_u2_dout1),
    .loadData (mem_to_bram_converter_u2_loadData)
  );

  gemver gemver_wrapped(
    .alpha (alpha),
    .alpha_valid (alpha_valid),
    .alpha_ready (alpha_ready),
    .beta (beta),
    .beta_valid (beta_valid),
    .beta_ready (beta_ready),
    .u1_loadData (mem_to_bram_converter_u1_loadData),
    .v1_loadData (mem_to_bram_converter_v1_loadData),
    .u2_loadData (mem_to_bram_converter_u2_loadData),
    .v2_loadData (mem_to_bram_converter_v2_loadData),
    .y_loadData (mem_to_bram_converter_y_loadData),
    .z_loadData (mem_to_bram_converter_z_loadData),
    .a_loadData (mem_to_bram_converter_a_loadData),
    .w_loadData (mem_to_bram_converter_w_loadData),
    .x_loadData (mem_to_bram_converter_x_loadData),
    .u1_start_valid (u1_start_valid),
    .u1_start_ready (u1_start_ready),
    .v1_start_valid (v1_start_valid),
    .v1_start_ready (v1_start_ready),
    .u2_start_valid (u2_start_valid),
    .u2_start_ready (u2_start_ready),
    .v2_start_valid (v2_start_valid),
    .v2_start_ready (v2_start_ready),
    .y_start_valid (y_start_valid),
    .y_start_ready (y_start_ready),
    .z_start_valid (z_start_valid),
    .z_start_ready (z_start_ready),
    .a_start_valid (a_start_valid),
    .a_start_ready (a_start_ready),
    .w_start_valid (w_start_valid),
    .w_start_ready (w_start_ready),
    .x_start_valid (x_start_valid),
    .x_start_ready (x_start_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .u1_end_valid (gemver_wrapped_u1_end_valid),
    .u1_end_ready (gemver_wrapped_u1_end_ready),
    .v1_end_valid (gemver_wrapped_v1_end_valid),
    .v1_end_ready (gemver_wrapped_v1_end_ready),
    .u2_end_valid (gemver_wrapped_u2_end_valid),
    .u2_end_ready (gemver_wrapped_u2_end_ready),
    .v2_end_valid (gemver_wrapped_v2_end_valid),
    .v2_end_ready (gemver_wrapped_v2_end_ready),
    .y_end_valid (gemver_wrapped_y_end_valid),
    .y_end_ready (gemver_wrapped_y_end_ready),
    .z_end_valid (gemver_wrapped_z_end_valid),
    .z_end_ready (gemver_wrapped_z_end_ready),
    .a_end_valid (gemver_wrapped_a_end_valid),
    .a_end_ready (gemver_wrapped_a_end_ready),
    .w_end_valid (gemver_wrapped_w_end_valid),
    .w_end_ready (gemver_wrapped_w_end_ready),
    .x_end_valid (gemver_wrapped_x_end_valid),
    .x_end_ready (gemver_wrapped_x_end_ready),
    .end_valid (gemver_wrapped_end_valid),
    .end_ready (gemver_wrapped_end_ready),
    .u1_loadEn (gemver_wrapped_u1_loadEn),
    .u1_loadAddr (gemver_wrapped_u1_loadAddr),
    .u1_storeEn (gemver_wrapped_u1_storeEn),
    .u1_storeAddr (gemver_wrapped_u1_storeAddr),
    .u1_storeData (gemver_wrapped_u1_storeData),
    .v1_loadEn (gemver_wrapped_v1_loadEn),
    .v1_loadAddr (gemver_wrapped_v1_loadAddr),
    .v1_storeEn (gemver_wrapped_v1_storeEn),
    .v1_storeAddr (gemver_wrapped_v1_storeAddr),
    .v1_storeData (gemver_wrapped_v1_storeData),
    .u2_loadEn (gemver_wrapped_u2_loadEn),
    .u2_loadAddr (gemver_wrapped_u2_loadAddr),
    .u2_storeEn (gemver_wrapped_u2_storeEn),
    .u2_storeAddr (gemver_wrapped_u2_storeAddr),
    .u2_storeData (gemver_wrapped_u2_storeData),
    .v2_loadEn (gemver_wrapped_v2_loadEn),
    .v2_loadAddr (gemver_wrapped_v2_loadAddr),
    .v2_storeEn (gemver_wrapped_v2_storeEn),
    .v2_storeAddr (gemver_wrapped_v2_storeAddr),
    .v2_storeData (gemver_wrapped_v2_storeData),
    .y_loadEn (gemver_wrapped_y_loadEn),
    .y_loadAddr (gemver_wrapped_y_loadAddr),
    .y_storeEn (gemver_wrapped_y_storeEn),
    .y_storeAddr (gemver_wrapped_y_storeAddr),
    .y_storeData (gemver_wrapped_y_storeData),
    .z_loadEn (gemver_wrapped_z_loadEn),
    .z_loadAddr (gemver_wrapped_z_loadAddr),
    .z_storeEn (gemver_wrapped_z_storeEn),
    .z_storeAddr (gemver_wrapped_z_storeAddr),
    .z_storeData (gemver_wrapped_z_storeData),
    .a_loadEn (gemver_wrapped_a_loadEn),
    .a_loadAddr (gemver_wrapped_a_loadAddr),
    .a_storeEn (gemver_wrapped_a_storeEn),
    .a_storeAddr (gemver_wrapped_a_storeAddr),
    .a_storeData (gemver_wrapped_a_storeData),
    .w_loadEn (gemver_wrapped_w_loadEn),
    .w_loadAddr (gemver_wrapped_w_loadAddr),
    .w_storeEn (gemver_wrapped_w_storeEn),
    .w_storeAddr (gemver_wrapped_w_storeAddr),
    .w_storeData (gemver_wrapped_w_storeData),
    .x_loadEn (gemver_wrapped_x_loadEn),
    .x_loadAddr (gemver_wrapped_x_loadAddr),
    .x_storeEn (gemver_wrapped_x_storeEn),
    .x_storeAddr (gemver_wrapped_x_storeAddr),
    .x_storeData (gemver_wrapped_x_storeData)
  );

endmodule
