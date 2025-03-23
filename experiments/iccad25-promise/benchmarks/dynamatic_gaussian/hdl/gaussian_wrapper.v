module gaussian_wrapper(
  input [7:0] c_din0,
  input [7:0] c_din1,
  input [7:0] a_din0,
  input [7:0] a_din1,
  input  c_start_valid,
  input  a_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  c_end_ready,
  input  a_end_ready,
  input  end_ready,
  output  c_start_ready,
  output  a_start_ready,
  output  start_ready,
  output [7:0] out0,
  output  out0_valid,
  output  c_end_valid,
  output  a_end_valid,
  output  end_valid,
  output  c_ce0,
  output  c_we0,
  output [3:0] c_address0,
  output [7:0] c_dout0,
  output  c_ce1,
  output  c_we1,
  output [3:0] c_address1,
  output [7:0] c_dout1,
  output  a_ce0,
  output  a_we0,
  output [6:0] a_address0,
  output [7:0] a_dout0,
  output  a_ce1,
  output  a_we1,
  output [6:0] a_address1,
  output [7:0] a_dout1
);
  wire  mem_to_bram_converter_c_ce0;
  wire  mem_to_bram_converter_c_we0;
  wire [3:0] mem_to_bram_converter_c_address0;
  wire [7:0] mem_to_bram_converter_c_dout0;
  wire  mem_to_bram_converter_c_ce1;
  wire  mem_to_bram_converter_c_we1;
  wire [3:0] mem_to_bram_converter_c_address1;
  wire [7:0] mem_to_bram_converter_c_dout1;
  wire [7:0] mem_to_bram_converter_c_loadData;
  wire  mem_to_bram_converter_a_ce0;
  wire  mem_to_bram_converter_a_we0;
  wire [6:0] mem_to_bram_converter_a_address0;
  wire [7:0] mem_to_bram_converter_a_dout0;
  wire  mem_to_bram_converter_a_ce1;
  wire  mem_to_bram_converter_a_we1;
  wire [6:0] mem_to_bram_converter_a_address1;
  wire [7:0] mem_to_bram_converter_a_dout1;
  wire [7:0] mem_to_bram_converter_a_loadData;
  wire [7:0] gaussian_wrapped_out0;
  wire  gaussian_wrapped_out0_valid;
  wire  gaussian_wrapped_out0_ready;
  wire  gaussian_wrapped_c_end_valid;
  wire  gaussian_wrapped_c_end_ready;
  wire  gaussian_wrapped_a_end_valid;
  wire  gaussian_wrapped_a_end_ready;
  wire  gaussian_wrapped_end_valid;
  wire  gaussian_wrapped_end_ready;
  wire  gaussian_wrapped_c_loadEn;
  wire [3:0] gaussian_wrapped_c_loadAddr;
  wire  gaussian_wrapped_c_storeEn;
  wire [3:0] gaussian_wrapped_c_storeAddr;
  wire [7:0] gaussian_wrapped_c_storeData;
  wire  gaussian_wrapped_a_loadEn;
  wire [6:0] gaussian_wrapped_a_loadAddr;
  wire  gaussian_wrapped_a_storeEn;
  wire [6:0] gaussian_wrapped_a_storeAddr;
  wire [7:0] gaussian_wrapped_a_storeData;

  assign out0 = gaussian_wrapped_out0;
  assign out0_valid = gaussian_wrapped_out0_valid;
  assign gaussian_wrapped_out0_ready = out0_ready;
  assign c_end_valid = gaussian_wrapped_c_end_valid;
  assign gaussian_wrapped_c_end_ready = c_end_ready;
  assign a_end_valid = gaussian_wrapped_a_end_valid;
  assign gaussian_wrapped_a_end_ready = a_end_ready;
  assign end_valid = gaussian_wrapped_end_valid;
  assign gaussian_wrapped_end_ready = end_ready;
  assign c_ce0 = mem_to_bram_converter_c_ce0;
  assign c_we0 = mem_to_bram_converter_c_we0;
  assign c_address0 = mem_to_bram_converter_c_address0;
  assign c_dout0 = mem_to_bram_converter_c_dout0;
  assign c_ce1 = mem_to_bram_converter_c_ce1;
  assign c_we1 = mem_to_bram_converter_c_we1;
  assign c_address1 = mem_to_bram_converter_c_address1;
  assign c_dout1 = mem_to_bram_converter_c_dout1;
  assign a_ce0 = mem_to_bram_converter_a_ce0;
  assign a_we0 = mem_to_bram_converter_a_we0;
  assign a_address0 = mem_to_bram_converter_a_address0;
  assign a_dout0 = mem_to_bram_converter_a_dout0;
  assign a_ce1 = mem_to_bram_converter_a_ce1;
  assign a_we1 = mem_to_bram_converter_a_we1;
  assign a_address1 = mem_to_bram_converter_a_address1;
  assign a_dout1 = mem_to_bram_converter_a_dout1;

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(4)) mem_to_bram_converter_c(
    .loadEn (gaussian_wrapped_c_loadEn),
    .loadAddr (gaussian_wrapped_c_loadAddr),
    .storeEn (gaussian_wrapped_c_storeEn),
    .storeAddr (gaussian_wrapped_c_storeAddr),
    .storeData (gaussian_wrapped_c_storeData),
    .din0 (c_din0),
    .din1 (c_din1),
    .ce0 (mem_to_bram_converter_c_ce0),
    .we0 (mem_to_bram_converter_c_we0),
    .address0 (mem_to_bram_converter_c_address0),
    .dout0 (mem_to_bram_converter_c_dout0),
    .ce1 (mem_to_bram_converter_c_ce1),
    .we1 (mem_to_bram_converter_c_we1),
    .address1 (mem_to_bram_converter_c_address1),
    .dout1 (mem_to_bram_converter_c_dout1),
    .loadData (mem_to_bram_converter_c_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_a(
    .loadEn (gaussian_wrapped_a_loadEn),
    .loadAddr (gaussian_wrapped_a_loadAddr),
    .storeEn (gaussian_wrapped_a_storeEn),
    .storeAddr (gaussian_wrapped_a_storeAddr),
    .storeData (gaussian_wrapped_a_storeData),
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

  gaussian gaussian_wrapped(
    .c_loadData (mem_to_bram_converter_c_loadData),
    .a_loadData (mem_to_bram_converter_a_loadData),
    .c_start_valid (c_start_valid),
    .c_start_ready (c_start_ready),
    .a_start_valid (a_start_valid),
    .a_start_ready (a_start_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .out0 (gaussian_wrapped_out0),
    .out0_valid (gaussian_wrapped_out0_valid),
    .out0_ready (gaussian_wrapped_out0_ready),
    .c_end_valid (gaussian_wrapped_c_end_valid),
    .c_end_ready (gaussian_wrapped_c_end_ready),
    .a_end_valid (gaussian_wrapped_a_end_valid),
    .a_end_ready (gaussian_wrapped_a_end_ready),
    .end_valid (gaussian_wrapped_end_valid),
    .end_ready (gaussian_wrapped_end_ready),
    .c_loadEn (gaussian_wrapped_c_loadEn),
    .c_loadAddr (gaussian_wrapped_c_loadAddr),
    .c_storeEn (gaussian_wrapped_c_storeEn),
    .c_storeAddr (gaussian_wrapped_c_storeAddr),
    .c_storeData (gaussian_wrapped_c_storeData),
    .a_loadEn (gaussian_wrapped_a_loadEn),
    .a_loadAddr (gaussian_wrapped_a_loadAddr),
    .a_storeEn (gaussian_wrapped_a_storeEn),
    .a_storeAddr (gaussian_wrapped_a_storeAddr),
    .a_storeData (gaussian_wrapped_a_storeData)
  );

endmodule
