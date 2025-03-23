module matvec_wrapper(
  input [7:0] m_din0,
  input [7:0] m_din1,
  input [7:0] v_din0,
  input [7:0] v_din1,
  input [7:0] out_din0,
  input [7:0] out_din1,
  input  m_start_valid,
  input  v_start_valid,
  input  out_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  m_end_ready,
  input  v_end_ready,
  input  out_end_ready,
  input  end_ready,
  output  m_start_ready,
  output  v_start_ready,
  output  out_start_ready,
  output  start_ready,
  output [7:0] out0,
  output  out0_valid,
  output  m_end_valid,
  output  v_end_valid,
  output  out_end_valid,
  output  end_valid,
  output  m_ce0,
  output  m_we0,
  output [6:0] m_address0,
  output [7:0] m_dout0,
  output  m_ce1,
  output  m_we1,
  output [6:0] m_address1,
  output [7:0] m_dout1,
  output  v_ce0,
  output  v_we0,
  output [3:0] v_address0,
  output [7:0] v_dout0,
  output  v_ce1,
  output  v_we1,
  output [3:0] v_address1,
  output [7:0] v_dout1,
  output  out_ce0,
  output  out_we0,
  output [3:0] out_address0,
  output [7:0] out_dout0,
  output  out_ce1,
  output  out_we1,
  output [3:0] out_address1,
  output [7:0] out_dout1
);
  wire  mem_to_bram_converter_m_ce0;
  wire  mem_to_bram_converter_m_we0;
  wire [6:0] mem_to_bram_converter_m_address0;
  wire [7:0] mem_to_bram_converter_m_dout0;
  wire  mem_to_bram_converter_m_ce1;
  wire  mem_to_bram_converter_m_we1;
  wire [6:0] mem_to_bram_converter_m_address1;
  wire [7:0] mem_to_bram_converter_m_dout1;
  wire [7:0] mem_to_bram_converter_m_loadData;
  wire  mem_to_bram_converter_out_ce0;
  wire  mem_to_bram_converter_out_we0;
  wire [3:0] mem_to_bram_converter_out_address0;
  wire [7:0] mem_to_bram_converter_out_dout0;
  wire  mem_to_bram_converter_out_ce1;
  wire  mem_to_bram_converter_out_we1;
  wire [3:0] mem_to_bram_converter_out_address1;
  wire [7:0] mem_to_bram_converter_out_dout1;
  wire [7:0] mem_to_bram_converter_out_loadData;
  wire  mem_to_bram_converter_v_ce0;
  wire  mem_to_bram_converter_v_we0;
  wire [3:0] mem_to_bram_converter_v_address0;
  wire [7:0] mem_to_bram_converter_v_dout0;
  wire  mem_to_bram_converter_v_ce1;
  wire  mem_to_bram_converter_v_we1;
  wire [3:0] mem_to_bram_converter_v_address1;
  wire [7:0] mem_to_bram_converter_v_dout1;
  wire [7:0] mem_to_bram_converter_v_loadData;
  wire [7:0] matvec_wrapped_out0;
  wire  matvec_wrapped_out0_valid;
  wire  matvec_wrapped_out0_ready;
  wire  matvec_wrapped_m_end_valid;
  wire  matvec_wrapped_m_end_ready;
  wire  matvec_wrapped_v_end_valid;
  wire  matvec_wrapped_v_end_ready;
  wire  matvec_wrapped_out_end_valid;
  wire  matvec_wrapped_out_end_ready;
  wire  matvec_wrapped_end_valid;
  wire  matvec_wrapped_end_ready;
  wire  matvec_wrapped_m_loadEn;
  wire [6:0] matvec_wrapped_m_loadAddr;
  wire  matvec_wrapped_m_storeEn;
  wire [6:0] matvec_wrapped_m_storeAddr;
  wire [7:0] matvec_wrapped_m_storeData;
  wire  matvec_wrapped_v_loadEn;
  wire [3:0] matvec_wrapped_v_loadAddr;
  wire  matvec_wrapped_v_storeEn;
  wire [3:0] matvec_wrapped_v_storeAddr;
  wire [7:0] matvec_wrapped_v_storeData;
  wire  matvec_wrapped_out_loadEn;
  wire [3:0] matvec_wrapped_out_loadAddr;
  wire  matvec_wrapped_out_storeEn;
  wire [3:0] matvec_wrapped_out_storeAddr;
  wire [7:0] matvec_wrapped_out_storeData;

  assign out0 = matvec_wrapped_out0;
  assign out0_valid = matvec_wrapped_out0_valid;
  assign matvec_wrapped_out0_ready = out0_ready;
  assign m_end_valid = matvec_wrapped_m_end_valid;
  assign matvec_wrapped_m_end_ready = m_end_ready;
  assign v_end_valid = matvec_wrapped_v_end_valid;
  assign matvec_wrapped_v_end_ready = v_end_ready;
  assign out_end_valid = matvec_wrapped_out_end_valid;
  assign matvec_wrapped_out_end_ready = out_end_ready;
  assign end_valid = matvec_wrapped_end_valid;
  assign matvec_wrapped_end_ready = end_ready;
  assign m_ce0 = mem_to_bram_converter_m_ce0;
  assign m_we0 = mem_to_bram_converter_m_we0;
  assign m_address0 = mem_to_bram_converter_m_address0;
  assign m_dout0 = mem_to_bram_converter_m_dout0;
  assign m_ce1 = mem_to_bram_converter_m_ce1;
  assign m_we1 = mem_to_bram_converter_m_we1;
  assign m_address1 = mem_to_bram_converter_m_address1;
  assign m_dout1 = mem_to_bram_converter_m_dout1;
  assign v_ce0 = mem_to_bram_converter_v_ce0;
  assign v_we0 = mem_to_bram_converter_v_we0;
  assign v_address0 = mem_to_bram_converter_v_address0;
  assign v_dout0 = mem_to_bram_converter_v_dout0;
  assign v_ce1 = mem_to_bram_converter_v_ce1;
  assign v_we1 = mem_to_bram_converter_v_we1;
  assign v_address1 = mem_to_bram_converter_v_address1;
  assign v_dout1 = mem_to_bram_converter_v_dout1;
  assign out_ce0 = mem_to_bram_converter_out_ce0;
  assign out_we0 = mem_to_bram_converter_out_we0;
  assign out_address0 = mem_to_bram_converter_out_address0;
  assign out_dout0 = mem_to_bram_converter_out_dout0;
  assign out_ce1 = mem_to_bram_converter_out_ce1;
  assign out_we1 = mem_to_bram_converter_out_we1;
  assign out_address1 = mem_to_bram_converter_out_address1;
  assign out_dout1 = mem_to_bram_converter_out_dout1;

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_m(
    .loadEn (matvec_wrapped_m_loadEn),
    .loadAddr (matvec_wrapped_m_loadAddr),
    .storeEn (matvec_wrapped_m_storeEn),
    .storeAddr (matvec_wrapped_m_storeAddr),
    .storeData (matvec_wrapped_m_storeData),
    .din0 (m_din0),
    .din1 (m_din1),
    .ce0 (mem_to_bram_converter_m_ce0),
    .we0 (mem_to_bram_converter_m_we0),
    .address0 (mem_to_bram_converter_m_address0),
    .dout0 (mem_to_bram_converter_m_dout0),
    .ce1 (mem_to_bram_converter_m_ce1),
    .we1 (mem_to_bram_converter_m_we1),
    .address1 (mem_to_bram_converter_m_address1),
    .dout1 (mem_to_bram_converter_m_dout1),
    .loadData (mem_to_bram_converter_m_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_out(
    .loadEn (matvec_wrapped_out_loadEn),
    .loadAddr (matvec_wrapped_out_loadAddr),
    .storeEn (matvec_wrapped_out_storeEn),
    .storeAddr (matvec_wrapped_out_storeAddr),
    .storeData (matvec_wrapped_out_storeData),
    .din0 (out_din0),
    .din1 (out_din1),
    .ce0 (mem_to_bram_converter_out_ce0),
    .we0 (mem_to_bram_converter_out_we0),
    .address0 (mem_to_bram_converter_out_address0),
    .dout0 (mem_to_bram_converter_out_dout0),
    .ce1 (mem_to_bram_converter_out_ce1),
    .we1 (mem_to_bram_converter_out_we1),
    .address1 (mem_to_bram_converter_out_address1),
    .dout1 (mem_to_bram_converter_out_dout1),
    .loadData (mem_to_bram_converter_out_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_v(
    .loadEn (matvec_wrapped_v_loadEn),
    .loadAddr (matvec_wrapped_v_loadAddr),
    .storeEn (matvec_wrapped_v_storeEn),
    .storeAddr (matvec_wrapped_v_storeAddr),
    .storeData (matvec_wrapped_v_storeData),
    .din0 (v_din0),
    .din1 (v_din1),
    .ce0 (mem_to_bram_converter_v_ce0),
    .we0 (mem_to_bram_converter_v_we0),
    .address0 (mem_to_bram_converter_v_address0),
    .dout0 (mem_to_bram_converter_v_dout0),
    .ce1 (mem_to_bram_converter_v_ce1),
    .we1 (mem_to_bram_converter_v_we1),
    .address1 (mem_to_bram_converter_v_address1),
    .dout1 (mem_to_bram_converter_v_dout1),
    .loadData (mem_to_bram_converter_v_loadData)
  );

  matvec matvec_wrapped(
    .m_loadData (mem_to_bram_converter_m_loadData),
    .v_loadData (mem_to_bram_converter_v_loadData),
    .out_loadData (mem_to_bram_converter_out_loadData),
    .m_start_valid (m_start_valid),
    .m_start_ready (m_start_ready),
    .v_start_valid (v_start_valid),
    .v_start_ready (v_start_ready),
    .out_start_valid (out_start_valid),
    .out_start_ready (out_start_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .out0 (matvec_wrapped_out0),
    .out0_valid (matvec_wrapped_out0_valid),
    .out0_ready (matvec_wrapped_out0_ready),
    .m_end_valid (matvec_wrapped_m_end_valid),
    .m_end_ready (matvec_wrapped_m_end_ready),
    .v_end_valid (matvec_wrapped_v_end_valid),
    .v_end_ready (matvec_wrapped_v_end_ready),
    .out_end_valid (matvec_wrapped_out_end_valid),
    .out_end_ready (matvec_wrapped_out_end_ready),
    .end_valid (matvec_wrapped_end_valid),
    .end_ready (matvec_wrapped_end_ready),
    .m_loadEn (matvec_wrapped_m_loadEn),
    .m_loadAddr (matvec_wrapped_m_loadAddr),
    .m_storeEn (matvec_wrapped_m_storeEn),
    .m_storeAddr (matvec_wrapped_m_storeAddr),
    .m_storeData (matvec_wrapped_m_storeData),
    .v_loadEn (matvec_wrapped_v_loadEn),
    .v_loadAddr (matvec_wrapped_v_loadAddr),
    .v_storeEn (matvec_wrapped_v_storeEn),
    .v_storeAddr (matvec_wrapped_v_storeAddr),
    .v_storeData (matvec_wrapped_v_storeData),
    .out_loadEn (matvec_wrapped_out_loadEn),
    .out_loadAddr (matvec_wrapped_out_loadAddr),
    .out_storeEn (matvec_wrapped_out_storeEn),
    .out_storeAddr (matvec_wrapped_out_storeAddr),
    .out_storeData (matvec_wrapped_out_storeData)
  );

endmodule
