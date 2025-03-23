module bicg_wrapper(
  input [7:0] a_din0,
  input [7:0] a_din1,
  input [7:0] s_din0,
  input [7:0] s_din1,
  input [7:0] q_din0,
  input [7:0] q_din1,
  input [7:0] p_din0,
  input [7:0] p_din1,
  input [7:0] r_din0,
  input [7:0] r_din1,
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
  output  a_ce0,
  output  a_we0,
  output [6:0] a_address0,
  output [7:0] a_dout0,
  output  a_ce1,
  output  a_we1,
  output [6:0] a_address1,
  output [7:0] a_dout1,
  output  s_ce0,
  output  s_we0,
  output [3:0] s_address0,
  output [7:0] s_dout0,
  output  s_ce1,
  output  s_we1,
  output [3:0] s_address1,
  output [7:0] s_dout1,
  output  q_ce0,
  output  q_we0,
  output [3:0] q_address0,
  output [7:0] q_dout0,
  output  q_ce1,
  output  q_we1,
  output [3:0] q_address1,
  output [7:0] q_dout1,
  output  p_ce0,
  output  p_we0,
  output [3:0] p_address0,
  output [7:0] p_dout0,
  output  p_ce1,
  output  p_we1,
  output [3:0] p_address1,
  output [7:0] p_dout1,
  output  r_ce0,
  output  r_we0,
  output [3:0] r_address0,
  output [7:0] r_dout0,
  output  r_ce1,
  output  r_we1,
  output [3:0] r_address1,
  output [7:0] r_dout1
);
  wire  mem_to_bram_converter_q_ce0;
  wire  mem_to_bram_converter_q_we0;
  wire [3:0] mem_to_bram_converter_q_address0;
  wire [7:0] mem_to_bram_converter_q_dout0;
  wire  mem_to_bram_converter_q_ce1;
  wire  mem_to_bram_converter_q_we1;
  wire [3:0] mem_to_bram_converter_q_address1;
  wire [7:0] mem_to_bram_converter_q_dout1;
  wire [7:0] mem_to_bram_converter_q_loadData;
  wire  mem_to_bram_converter_r_ce0;
  wire  mem_to_bram_converter_r_we0;
  wire [3:0] mem_to_bram_converter_r_address0;
  wire [7:0] mem_to_bram_converter_r_dout0;
  wire  mem_to_bram_converter_r_ce1;
  wire  mem_to_bram_converter_r_we1;
  wire [3:0] mem_to_bram_converter_r_address1;
  wire [7:0] mem_to_bram_converter_r_dout1;
  wire [7:0] mem_to_bram_converter_r_loadData;
  wire  mem_to_bram_converter_a_ce0;
  wire  mem_to_bram_converter_a_we0;
  wire [6:0] mem_to_bram_converter_a_address0;
  wire [7:0] mem_to_bram_converter_a_dout0;
  wire  mem_to_bram_converter_a_ce1;
  wire  mem_to_bram_converter_a_we1;
  wire [6:0] mem_to_bram_converter_a_address1;
  wire [7:0] mem_to_bram_converter_a_dout1;
  wire [7:0] mem_to_bram_converter_a_loadData;
  wire  mem_to_bram_converter_s_ce0;
  wire  mem_to_bram_converter_s_we0;
  wire [3:0] mem_to_bram_converter_s_address0;
  wire [7:0] mem_to_bram_converter_s_dout0;
  wire  mem_to_bram_converter_s_ce1;
  wire  mem_to_bram_converter_s_we1;
  wire [3:0] mem_to_bram_converter_s_address1;
  wire [7:0] mem_to_bram_converter_s_dout1;
  wire [7:0] mem_to_bram_converter_s_loadData;
  wire  mem_to_bram_converter_p_ce0;
  wire  mem_to_bram_converter_p_we0;
  wire [3:0] mem_to_bram_converter_p_address0;
  wire [7:0] mem_to_bram_converter_p_dout0;
  wire  mem_to_bram_converter_p_ce1;
  wire  mem_to_bram_converter_p_we1;
  wire [3:0] mem_to_bram_converter_p_address1;
  wire [7:0] mem_to_bram_converter_p_dout1;
  wire [7:0] mem_to_bram_converter_p_loadData;
  wire [7:0] bicg_wrapped_out0;
  wire  bicg_wrapped_out0_valid;
  wire  bicg_wrapped_out0_ready;
  wire  bicg_wrapped_a_end_valid;
  wire  bicg_wrapped_a_end_ready;
  wire  bicg_wrapped_s_end_valid;
  wire  bicg_wrapped_s_end_ready;
  wire  bicg_wrapped_q_end_valid;
  wire  bicg_wrapped_q_end_ready;
  wire  bicg_wrapped_p_end_valid;
  wire  bicg_wrapped_p_end_ready;
  wire  bicg_wrapped_r_end_valid;
  wire  bicg_wrapped_r_end_ready;
  wire  bicg_wrapped_end_valid;
  wire  bicg_wrapped_end_ready;
  wire  bicg_wrapped_a_loadEn;
  wire [6:0] bicg_wrapped_a_loadAddr;
  wire  bicg_wrapped_a_storeEn;
  wire [6:0] bicg_wrapped_a_storeAddr;
  wire [7:0] bicg_wrapped_a_storeData;
  wire  bicg_wrapped_s_loadEn;
  wire [3:0] bicg_wrapped_s_loadAddr;
  wire  bicg_wrapped_s_storeEn;
  wire [3:0] bicg_wrapped_s_storeAddr;
  wire [7:0] bicg_wrapped_s_storeData;
  wire  bicg_wrapped_q_loadEn;
  wire [3:0] bicg_wrapped_q_loadAddr;
  wire  bicg_wrapped_q_storeEn;
  wire [3:0] bicg_wrapped_q_storeAddr;
  wire [7:0] bicg_wrapped_q_storeData;
  wire  bicg_wrapped_p_loadEn;
  wire [3:0] bicg_wrapped_p_loadAddr;
  wire  bicg_wrapped_p_storeEn;
  wire [3:0] bicg_wrapped_p_storeAddr;
  wire [7:0] bicg_wrapped_p_storeData;
  wire  bicg_wrapped_r_loadEn;
  wire [3:0] bicg_wrapped_r_loadAddr;
  wire  bicg_wrapped_r_storeEn;
  wire [3:0] bicg_wrapped_r_storeAddr;
  wire [7:0] bicg_wrapped_r_storeData;

  assign out0 = bicg_wrapped_out0;
  assign out0_valid = bicg_wrapped_out0_valid;
  assign bicg_wrapped_out0_ready = out0_ready;
  assign a_end_valid = bicg_wrapped_a_end_valid;
  assign bicg_wrapped_a_end_ready = a_end_ready;
  assign s_end_valid = bicg_wrapped_s_end_valid;
  assign bicg_wrapped_s_end_ready = s_end_ready;
  assign q_end_valid = bicg_wrapped_q_end_valid;
  assign bicg_wrapped_q_end_ready = q_end_ready;
  assign p_end_valid = bicg_wrapped_p_end_valid;
  assign bicg_wrapped_p_end_ready = p_end_ready;
  assign r_end_valid = bicg_wrapped_r_end_valid;
  assign bicg_wrapped_r_end_ready = r_end_ready;
  assign end_valid = bicg_wrapped_end_valid;
  assign bicg_wrapped_end_ready = end_ready;
  assign a_ce0 = mem_to_bram_converter_a_ce0;
  assign a_we0 = mem_to_bram_converter_a_we0;
  assign a_address0 = mem_to_bram_converter_a_address0;
  assign a_dout0 = mem_to_bram_converter_a_dout0;
  assign a_ce1 = mem_to_bram_converter_a_ce1;
  assign a_we1 = mem_to_bram_converter_a_we1;
  assign a_address1 = mem_to_bram_converter_a_address1;
  assign a_dout1 = mem_to_bram_converter_a_dout1;
  assign s_ce0 = mem_to_bram_converter_s_ce0;
  assign s_we0 = mem_to_bram_converter_s_we0;
  assign s_address0 = mem_to_bram_converter_s_address0;
  assign s_dout0 = mem_to_bram_converter_s_dout0;
  assign s_ce1 = mem_to_bram_converter_s_ce1;
  assign s_we1 = mem_to_bram_converter_s_we1;
  assign s_address1 = mem_to_bram_converter_s_address1;
  assign s_dout1 = mem_to_bram_converter_s_dout1;
  assign q_ce0 = mem_to_bram_converter_q_ce0;
  assign q_we0 = mem_to_bram_converter_q_we0;
  assign q_address0 = mem_to_bram_converter_q_address0;
  assign q_dout0 = mem_to_bram_converter_q_dout0;
  assign q_ce1 = mem_to_bram_converter_q_ce1;
  assign q_we1 = mem_to_bram_converter_q_we1;
  assign q_address1 = mem_to_bram_converter_q_address1;
  assign q_dout1 = mem_to_bram_converter_q_dout1;
  assign p_ce0 = mem_to_bram_converter_p_ce0;
  assign p_we0 = mem_to_bram_converter_p_we0;
  assign p_address0 = mem_to_bram_converter_p_address0;
  assign p_dout0 = mem_to_bram_converter_p_dout0;
  assign p_ce1 = mem_to_bram_converter_p_ce1;
  assign p_we1 = mem_to_bram_converter_p_we1;
  assign p_address1 = mem_to_bram_converter_p_address1;
  assign p_dout1 = mem_to_bram_converter_p_dout1;
  assign r_ce0 = mem_to_bram_converter_r_ce0;
  assign r_we0 = mem_to_bram_converter_r_we0;
  assign r_address0 = mem_to_bram_converter_r_address0;
  assign r_dout0 = mem_to_bram_converter_r_dout0;
  assign r_ce1 = mem_to_bram_converter_r_ce1;
  assign r_we1 = mem_to_bram_converter_r_we1;
  assign r_address1 = mem_to_bram_converter_r_address1;
  assign r_dout1 = mem_to_bram_converter_r_dout1;

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_q(
    .loadEn (bicg_wrapped_q_loadEn),
    .loadAddr (bicg_wrapped_q_loadAddr),
    .storeEn (bicg_wrapped_q_storeEn),
    .storeAddr (bicg_wrapped_q_storeAddr),
    .storeData (bicg_wrapped_q_storeData),
    .din0 (q_din0),
    .din1 (q_din1),
    .ce0 (mem_to_bram_converter_q_ce0),
    .we0 (mem_to_bram_converter_q_we0),
    .address0 (mem_to_bram_converter_q_address0),
    .dout0 (mem_to_bram_converter_q_dout0),
    .ce1 (mem_to_bram_converter_q_ce1),
    .we1 (mem_to_bram_converter_q_we1),
    .address1 (mem_to_bram_converter_q_address1),
    .dout1 (mem_to_bram_converter_q_dout1),
    .loadData (mem_to_bram_converter_q_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_r(
    .loadEn (bicg_wrapped_r_loadEn),
    .loadAddr (bicg_wrapped_r_loadAddr),
    .storeEn (bicg_wrapped_r_storeEn),
    .storeAddr (bicg_wrapped_r_storeAddr),
    .storeData (bicg_wrapped_r_storeData),
    .din0 (r_din0),
    .din1 (r_din1),
    .ce0 (mem_to_bram_converter_r_ce0),
    .we0 (mem_to_bram_converter_r_we0),
    .address0 (mem_to_bram_converter_r_address0),
    .dout0 (mem_to_bram_converter_r_dout0),
    .ce1 (mem_to_bram_converter_r_ce1),
    .we1 (mem_to_bram_converter_r_we1),
    .address1 (mem_to_bram_converter_r_address1),
    .dout1 (mem_to_bram_converter_r_dout1),
    .loadData (mem_to_bram_converter_r_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_a(
    .loadEn (bicg_wrapped_a_loadEn),
    .loadAddr (bicg_wrapped_a_loadAddr),
    .storeEn (bicg_wrapped_a_storeEn),
    .storeAddr (bicg_wrapped_a_storeAddr),
    .storeData (bicg_wrapped_a_storeData),
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

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_s(
    .loadEn (bicg_wrapped_s_loadEn),
    .loadAddr (bicg_wrapped_s_loadAddr),
    .storeEn (bicg_wrapped_s_storeEn),
    .storeAddr (bicg_wrapped_s_storeAddr),
    .storeData (bicg_wrapped_s_storeData),
    .din0 (s_din0),
    .din1 (s_din1),
    .ce0 (mem_to_bram_converter_s_ce0),
    .we0 (mem_to_bram_converter_s_we0),
    .address0 (mem_to_bram_converter_s_address0),
    .dout0 (mem_to_bram_converter_s_dout0),
    .ce1 (mem_to_bram_converter_s_ce1),
    .we1 (mem_to_bram_converter_s_we1),
    .address1 (mem_to_bram_converter_s_address1),
    .dout1 (mem_to_bram_converter_s_dout1),
    .loadData (mem_to_bram_converter_s_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_p(
    .loadEn (bicg_wrapped_p_loadEn),
    .loadAddr (bicg_wrapped_p_loadAddr),
    .storeEn (bicg_wrapped_p_storeEn),
    .storeAddr (bicg_wrapped_p_storeAddr),
    .storeData (bicg_wrapped_p_storeData),
    .din0 (p_din0),
    .din1 (p_din1),
    .ce0 (mem_to_bram_converter_p_ce0),
    .we0 (mem_to_bram_converter_p_we0),
    .address0 (mem_to_bram_converter_p_address0),
    .dout0 (mem_to_bram_converter_p_dout0),
    .ce1 (mem_to_bram_converter_p_ce1),
    .we1 (mem_to_bram_converter_p_we1),
    .address1 (mem_to_bram_converter_p_address1),
    .dout1 (mem_to_bram_converter_p_dout1),
    .loadData (mem_to_bram_converter_p_loadData)
  );

  bicg bicg_wrapped(
    .a_loadData (mem_to_bram_converter_a_loadData),
    .s_loadData (mem_to_bram_converter_s_loadData),
    .q_loadData (mem_to_bram_converter_q_loadData),
    .p_loadData (mem_to_bram_converter_p_loadData),
    .r_loadData (mem_to_bram_converter_r_loadData),
    .a_start_valid (a_start_valid),
    .a_start_ready (a_start_ready),
    .s_start_valid (s_start_valid),
    .s_start_ready (s_start_ready),
    .q_start_valid (q_start_valid),
    .q_start_ready (q_start_ready),
    .p_start_valid (p_start_valid),
    .p_start_ready (p_start_ready),
    .r_start_valid (r_start_valid),
    .r_start_ready (r_start_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .out0 (bicg_wrapped_out0),
    .out0_valid (bicg_wrapped_out0_valid),
    .out0_ready (bicg_wrapped_out0_ready),
    .a_end_valid (bicg_wrapped_a_end_valid),
    .a_end_ready (bicg_wrapped_a_end_ready),
    .s_end_valid (bicg_wrapped_s_end_valid),
    .s_end_ready (bicg_wrapped_s_end_ready),
    .q_end_valid (bicg_wrapped_q_end_valid),
    .q_end_ready (bicg_wrapped_q_end_ready),
    .p_end_valid (bicg_wrapped_p_end_valid),
    .p_end_ready (bicg_wrapped_p_end_ready),
    .r_end_valid (bicg_wrapped_r_end_valid),
    .r_end_ready (bicg_wrapped_r_end_ready),
    .end_valid (bicg_wrapped_end_valid),
    .end_ready (bicg_wrapped_end_ready),
    .a_loadEn (bicg_wrapped_a_loadEn),
    .a_loadAddr (bicg_wrapped_a_loadAddr),
    .a_storeEn (bicg_wrapped_a_storeEn),
    .a_storeAddr (bicg_wrapped_a_storeAddr),
    .a_storeData (bicg_wrapped_a_storeData),
    .s_loadEn (bicg_wrapped_s_loadEn),
    .s_loadAddr (bicg_wrapped_s_loadAddr),
    .s_storeEn (bicg_wrapped_s_storeEn),
    .s_storeAddr (bicg_wrapped_s_storeAddr),
    .s_storeData (bicg_wrapped_s_storeData),
    .q_loadEn (bicg_wrapped_q_loadEn),
    .q_loadAddr (bicg_wrapped_q_loadAddr),
    .q_storeEn (bicg_wrapped_q_storeEn),
    .q_storeAddr (bicg_wrapped_q_storeAddr),
    .q_storeData (bicg_wrapped_q_storeData),
    .p_loadEn (bicg_wrapped_p_loadEn),
    .p_loadAddr (bicg_wrapped_p_loadAddr),
    .p_storeEn (bicg_wrapped_p_storeEn),
    .p_storeAddr (bicg_wrapped_p_storeAddr),
    .p_storeData (bicg_wrapped_p_storeData),
    .r_loadEn (bicg_wrapped_r_loadEn),
    .r_loadAddr (bicg_wrapped_r_loadAddr),
    .r_storeEn (bicg_wrapped_r_storeEn),
    .r_storeAddr (bicg_wrapped_r_storeAddr),
    .r_storeData (bicg_wrapped_r_storeData)
  );

endmodule
