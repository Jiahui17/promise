module kernel_2mm_wrapper(
  input [7:0] alpha,
  input  alpha_valid,
  input [7:0] beta,
  input  beta_valid,
  input [7:0] tmp_din0,
  input [7:0] tmp_din1,
  input [7:0] A_din0,
  input [7:0] A_din1,
  input [7:0] B_din0,
  input [7:0] B_din1,
  input [7:0] C_din0,
  input [7:0] C_din1,
  input [7:0] D_din0,
  input [7:0] D_din1,
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
  output  tmp_ce0,
  output  tmp_we0,
  output [6:0] tmp_address0,
  output [7:0] tmp_dout0,
  output  tmp_ce1,
  output  tmp_we1,
  output [6:0] tmp_address1,
  output [7:0] tmp_dout1,
  output  A_ce0,
  output  A_we0,
  output [6:0] A_address0,
  output [7:0] A_dout0,
  output  A_ce1,
  output  A_we1,
  output [6:0] A_address1,
  output [7:0] A_dout1,
  output  B_ce0,
  output  B_we0,
  output [6:0] B_address0,
  output [7:0] B_dout0,
  output  B_ce1,
  output  B_we1,
  output [6:0] B_address1,
  output [7:0] B_dout1,
  output  C_ce0,
  output  C_we0,
  output [6:0] C_address0,
  output [7:0] C_dout0,
  output  C_ce1,
  output  C_we1,
  output [6:0] C_address1,
  output [7:0] C_dout1,
  output  D_ce0,
  output  D_we0,
  output [6:0] D_address0,
  output [7:0] D_dout0,
  output  D_ce1,
  output  D_we1,
  output [6:0] D_address1,
  output [7:0] D_dout1
);
  wire  mem_to_bram_converter_A_ce0;
  wire  mem_to_bram_converter_A_we0;
  wire [6:0] mem_to_bram_converter_A_address0;
  wire [7:0] mem_to_bram_converter_A_dout0;
  wire  mem_to_bram_converter_A_ce1;
  wire  mem_to_bram_converter_A_we1;
  wire [6:0] mem_to_bram_converter_A_address1;
  wire [7:0] mem_to_bram_converter_A_dout1;
  wire [7:0] mem_to_bram_converter_A_loadData;
  wire  mem_to_bram_converter_C_ce0;
  wire  mem_to_bram_converter_C_we0;
  wire [6:0] mem_to_bram_converter_C_address0;
  wire [7:0] mem_to_bram_converter_C_dout0;
  wire  mem_to_bram_converter_C_ce1;
  wire  mem_to_bram_converter_C_we1;
  wire [6:0] mem_to_bram_converter_C_address1;
  wire [7:0] mem_to_bram_converter_C_dout1;
  wire [7:0] mem_to_bram_converter_C_loadData;
  wire  mem_to_bram_converter_B_ce0;
  wire  mem_to_bram_converter_B_we0;
  wire [6:0] mem_to_bram_converter_B_address0;
  wire [7:0] mem_to_bram_converter_B_dout0;
  wire  mem_to_bram_converter_B_ce1;
  wire  mem_to_bram_converter_B_we1;
  wire [6:0] mem_to_bram_converter_B_address1;
  wire [7:0] mem_to_bram_converter_B_dout1;
  wire [7:0] mem_to_bram_converter_B_loadData;
  wire  mem_to_bram_converter_tmp_ce0;
  wire  mem_to_bram_converter_tmp_we0;
  wire [6:0] mem_to_bram_converter_tmp_address0;
  wire [7:0] mem_to_bram_converter_tmp_dout0;
  wire  mem_to_bram_converter_tmp_ce1;
  wire  mem_to_bram_converter_tmp_we1;
  wire [6:0] mem_to_bram_converter_tmp_address1;
  wire [7:0] mem_to_bram_converter_tmp_dout1;
  wire [7:0] mem_to_bram_converter_tmp_loadData;
  wire  mem_to_bram_converter_D_ce0;
  wire  mem_to_bram_converter_D_we0;
  wire [6:0] mem_to_bram_converter_D_address0;
  wire [7:0] mem_to_bram_converter_D_dout0;
  wire  mem_to_bram_converter_D_ce1;
  wire  mem_to_bram_converter_D_we1;
  wire [6:0] mem_to_bram_converter_D_address1;
  wire [7:0] mem_to_bram_converter_D_dout1;
  wire [7:0] mem_to_bram_converter_D_loadData;
  wire  kernel_2mm_wrapped_tmp_end_valid;
  wire  kernel_2mm_wrapped_tmp_end_ready;
  wire  kernel_2mm_wrapped_A_end_valid;
  wire  kernel_2mm_wrapped_A_end_ready;
  wire  kernel_2mm_wrapped_B_end_valid;
  wire  kernel_2mm_wrapped_B_end_ready;
  wire  kernel_2mm_wrapped_C_end_valid;
  wire  kernel_2mm_wrapped_C_end_ready;
  wire  kernel_2mm_wrapped_D_end_valid;
  wire  kernel_2mm_wrapped_D_end_ready;
  wire  kernel_2mm_wrapped_end_valid;
  wire  kernel_2mm_wrapped_end_ready;
  wire  kernel_2mm_wrapped_tmp_loadEn;
  wire [6:0] kernel_2mm_wrapped_tmp_loadAddr;
  wire  kernel_2mm_wrapped_tmp_storeEn;
  wire [6:0] kernel_2mm_wrapped_tmp_storeAddr;
  wire [7:0] kernel_2mm_wrapped_tmp_storeData;
  wire  kernel_2mm_wrapped_A_loadEn;
  wire [6:0] kernel_2mm_wrapped_A_loadAddr;
  wire  kernel_2mm_wrapped_A_storeEn;
  wire [6:0] kernel_2mm_wrapped_A_storeAddr;
  wire [7:0] kernel_2mm_wrapped_A_storeData;
  wire  kernel_2mm_wrapped_B_loadEn;
  wire [6:0] kernel_2mm_wrapped_B_loadAddr;
  wire  kernel_2mm_wrapped_B_storeEn;
  wire [6:0] kernel_2mm_wrapped_B_storeAddr;
  wire [7:0] kernel_2mm_wrapped_B_storeData;
  wire  kernel_2mm_wrapped_C_loadEn;
  wire [6:0] kernel_2mm_wrapped_C_loadAddr;
  wire  kernel_2mm_wrapped_C_storeEn;
  wire [6:0] kernel_2mm_wrapped_C_storeAddr;
  wire [7:0] kernel_2mm_wrapped_C_storeData;
  wire  kernel_2mm_wrapped_D_loadEn;
  wire [6:0] kernel_2mm_wrapped_D_loadAddr;
  wire  kernel_2mm_wrapped_D_storeEn;
  wire [6:0] kernel_2mm_wrapped_D_storeAddr;
  wire [7:0] kernel_2mm_wrapped_D_storeData;

  assign tmp_end_valid = kernel_2mm_wrapped_tmp_end_valid;
  assign kernel_2mm_wrapped_tmp_end_ready = tmp_end_ready;
  assign A_end_valid = kernel_2mm_wrapped_A_end_valid;
  assign kernel_2mm_wrapped_A_end_ready = A_end_ready;
  assign B_end_valid = kernel_2mm_wrapped_B_end_valid;
  assign kernel_2mm_wrapped_B_end_ready = B_end_ready;
  assign C_end_valid = kernel_2mm_wrapped_C_end_valid;
  assign kernel_2mm_wrapped_C_end_ready = C_end_ready;
  assign D_end_valid = kernel_2mm_wrapped_D_end_valid;
  assign kernel_2mm_wrapped_D_end_ready = D_end_ready;
  assign end_valid = kernel_2mm_wrapped_end_valid;
  assign kernel_2mm_wrapped_end_ready = end_ready;
  assign tmp_ce0 = mem_to_bram_converter_tmp_ce0;
  assign tmp_we0 = mem_to_bram_converter_tmp_we0;
  assign tmp_address0 = mem_to_bram_converter_tmp_address0;
  assign tmp_dout0 = mem_to_bram_converter_tmp_dout0;
  assign tmp_ce1 = mem_to_bram_converter_tmp_ce1;
  assign tmp_we1 = mem_to_bram_converter_tmp_we1;
  assign tmp_address1 = mem_to_bram_converter_tmp_address1;
  assign tmp_dout1 = mem_to_bram_converter_tmp_dout1;
  assign A_ce0 = mem_to_bram_converter_A_ce0;
  assign A_we0 = mem_to_bram_converter_A_we0;
  assign A_address0 = mem_to_bram_converter_A_address0;
  assign A_dout0 = mem_to_bram_converter_A_dout0;
  assign A_ce1 = mem_to_bram_converter_A_ce1;
  assign A_we1 = mem_to_bram_converter_A_we1;
  assign A_address1 = mem_to_bram_converter_A_address1;
  assign A_dout1 = mem_to_bram_converter_A_dout1;
  assign B_ce0 = mem_to_bram_converter_B_ce0;
  assign B_we0 = mem_to_bram_converter_B_we0;
  assign B_address0 = mem_to_bram_converter_B_address0;
  assign B_dout0 = mem_to_bram_converter_B_dout0;
  assign B_ce1 = mem_to_bram_converter_B_ce1;
  assign B_we1 = mem_to_bram_converter_B_we1;
  assign B_address1 = mem_to_bram_converter_B_address1;
  assign B_dout1 = mem_to_bram_converter_B_dout1;
  assign C_ce0 = mem_to_bram_converter_C_ce0;
  assign C_we0 = mem_to_bram_converter_C_we0;
  assign C_address0 = mem_to_bram_converter_C_address0;
  assign C_dout0 = mem_to_bram_converter_C_dout0;
  assign C_ce1 = mem_to_bram_converter_C_ce1;
  assign C_we1 = mem_to_bram_converter_C_we1;
  assign C_address1 = mem_to_bram_converter_C_address1;
  assign C_dout1 = mem_to_bram_converter_C_dout1;
  assign D_ce0 = mem_to_bram_converter_D_ce0;
  assign D_we0 = mem_to_bram_converter_D_we0;
  assign D_address0 = mem_to_bram_converter_D_address0;
  assign D_dout0 = mem_to_bram_converter_D_dout0;
  assign D_ce1 = mem_to_bram_converter_D_ce1;
  assign D_we1 = mem_to_bram_converter_D_we1;
  assign D_address1 = mem_to_bram_converter_D_address1;
  assign D_dout1 = mem_to_bram_converter_D_dout1;

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_A(
    .loadEn (kernel_2mm_wrapped_A_loadEn),
    .loadAddr (kernel_2mm_wrapped_A_loadAddr),
    .storeEn (kernel_2mm_wrapped_A_storeEn),
    .storeAddr (kernel_2mm_wrapped_A_storeAddr),
    .storeData (kernel_2mm_wrapped_A_storeData),
    .din0 (A_din0),
    .din1 (A_din1),
    .ce0 (mem_to_bram_converter_A_ce0),
    .we0 (mem_to_bram_converter_A_we0),
    .address0 (mem_to_bram_converter_A_address0),
    .dout0 (mem_to_bram_converter_A_dout0),
    .ce1 (mem_to_bram_converter_A_ce1),
    .we1 (mem_to_bram_converter_A_we1),
    .address1 (mem_to_bram_converter_A_address1),
    .dout1 (mem_to_bram_converter_A_dout1),
    .loadData (mem_to_bram_converter_A_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_C(
    .loadEn (kernel_2mm_wrapped_C_loadEn),
    .loadAddr (kernel_2mm_wrapped_C_loadAddr),
    .storeEn (kernel_2mm_wrapped_C_storeEn),
    .storeAddr (kernel_2mm_wrapped_C_storeAddr),
    .storeData (kernel_2mm_wrapped_C_storeData),
    .din0 (C_din0),
    .din1 (C_din1),
    .ce0 (mem_to_bram_converter_C_ce0),
    .we0 (mem_to_bram_converter_C_we0),
    .address0 (mem_to_bram_converter_C_address0),
    .dout0 (mem_to_bram_converter_C_dout0),
    .ce1 (mem_to_bram_converter_C_ce1),
    .we1 (mem_to_bram_converter_C_we1),
    .address1 (mem_to_bram_converter_C_address1),
    .dout1 (mem_to_bram_converter_C_dout1),
    .loadData (mem_to_bram_converter_C_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_B(
    .loadEn (kernel_2mm_wrapped_B_loadEn),
    .loadAddr (kernel_2mm_wrapped_B_loadAddr),
    .storeEn (kernel_2mm_wrapped_B_storeEn),
    .storeAddr (kernel_2mm_wrapped_B_storeAddr),
    .storeData (kernel_2mm_wrapped_B_storeData),
    .din0 (B_din0),
    .din1 (B_din1),
    .ce0 (mem_to_bram_converter_B_ce0),
    .we0 (mem_to_bram_converter_B_we0),
    .address0 (mem_to_bram_converter_B_address0),
    .dout0 (mem_to_bram_converter_B_dout0),
    .ce1 (mem_to_bram_converter_B_ce1),
    .we1 (mem_to_bram_converter_B_we1),
    .address1 (mem_to_bram_converter_B_address1),
    .dout1 (mem_to_bram_converter_B_dout1),
    .loadData (mem_to_bram_converter_B_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_tmp(
    .loadEn (kernel_2mm_wrapped_tmp_loadEn),
    .loadAddr (kernel_2mm_wrapped_tmp_loadAddr),
    .storeEn (kernel_2mm_wrapped_tmp_storeEn),
    .storeAddr (kernel_2mm_wrapped_tmp_storeAddr),
    .storeData (kernel_2mm_wrapped_tmp_storeData),
    .din0 (tmp_din0),
    .din1 (tmp_din1),
    .ce0 (mem_to_bram_converter_tmp_ce0),
    .we0 (mem_to_bram_converter_tmp_we0),
    .address0 (mem_to_bram_converter_tmp_address0),
    .dout0 (mem_to_bram_converter_tmp_dout0),
    .ce1 (mem_to_bram_converter_tmp_ce1),
    .we1 (mem_to_bram_converter_tmp_we1),
    .address1 (mem_to_bram_converter_tmp_address1),
    .dout1 (mem_to_bram_converter_tmp_dout1),
    .loadData (mem_to_bram_converter_tmp_loadData)
  );

  mem_to_bram #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) mem_to_bram_converter_D(
    .loadEn (kernel_2mm_wrapped_D_loadEn),
    .loadAddr (kernel_2mm_wrapped_D_loadAddr),
    .storeEn (kernel_2mm_wrapped_D_storeEn),
    .storeAddr (kernel_2mm_wrapped_D_storeAddr),
    .storeData (kernel_2mm_wrapped_D_storeData),
    .din0 (D_din0),
    .din1 (D_din1),
    .ce0 (mem_to_bram_converter_D_ce0),
    .we0 (mem_to_bram_converter_D_we0),
    .address0 (mem_to_bram_converter_D_address0),
    .dout0 (mem_to_bram_converter_D_dout0),
    .ce1 (mem_to_bram_converter_D_ce1),
    .we1 (mem_to_bram_converter_D_we1),
    .address1 (mem_to_bram_converter_D_address1),
    .dout1 (mem_to_bram_converter_D_dout1),
    .loadData (mem_to_bram_converter_D_loadData)
  );

  kernel_2mm kernel_2mm_wrapped(
    .alpha (alpha),
    .alpha_valid (alpha_valid),
    .alpha_ready (alpha_ready),
    .beta (beta),
    .beta_valid (beta_valid),
    .beta_ready (beta_ready),
    .tmp_loadData (mem_to_bram_converter_tmp_loadData),
    .A_loadData (mem_to_bram_converter_A_loadData),
    .B_loadData (mem_to_bram_converter_B_loadData),
    .C_loadData (mem_to_bram_converter_C_loadData),
    .D_loadData (mem_to_bram_converter_D_loadData),
    .tmp_start_valid (tmp_start_valid),
    .tmp_start_ready (tmp_start_ready),
    .A_start_valid (A_start_valid),
    .A_start_ready (A_start_ready),
    .B_start_valid (B_start_valid),
    .B_start_ready (B_start_ready),
    .C_start_valid (C_start_valid),
    .C_start_ready (C_start_ready),
    .D_start_valid (D_start_valid),
    .D_start_ready (D_start_ready),
    .start_valid (start_valid),
    .start_ready (start_ready),
    .clk (clk),
    .rst (rst),
    .tmp_end_valid (kernel_2mm_wrapped_tmp_end_valid),
    .tmp_end_ready (kernel_2mm_wrapped_tmp_end_ready),
    .A_end_valid (kernel_2mm_wrapped_A_end_valid),
    .A_end_ready (kernel_2mm_wrapped_A_end_ready),
    .B_end_valid (kernel_2mm_wrapped_B_end_valid),
    .B_end_ready (kernel_2mm_wrapped_B_end_ready),
    .C_end_valid (kernel_2mm_wrapped_C_end_valid),
    .C_end_ready (kernel_2mm_wrapped_C_end_ready),
    .D_end_valid (kernel_2mm_wrapped_D_end_valid),
    .D_end_ready (kernel_2mm_wrapped_D_end_ready),
    .end_valid (kernel_2mm_wrapped_end_valid),
    .end_ready (kernel_2mm_wrapped_end_ready),
    .tmp_loadEn (kernel_2mm_wrapped_tmp_loadEn),
    .tmp_loadAddr (kernel_2mm_wrapped_tmp_loadAddr),
    .tmp_storeEn (kernel_2mm_wrapped_tmp_storeEn),
    .tmp_storeAddr (kernel_2mm_wrapped_tmp_storeAddr),
    .tmp_storeData (kernel_2mm_wrapped_tmp_storeData),
    .A_loadEn (kernel_2mm_wrapped_A_loadEn),
    .A_loadAddr (kernel_2mm_wrapped_A_loadAddr),
    .A_storeEn (kernel_2mm_wrapped_A_storeEn),
    .A_storeAddr (kernel_2mm_wrapped_A_storeAddr),
    .A_storeData (kernel_2mm_wrapped_A_storeData),
    .B_loadEn (kernel_2mm_wrapped_B_loadEn),
    .B_loadAddr (kernel_2mm_wrapped_B_loadAddr),
    .B_storeEn (kernel_2mm_wrapped_B_storeEn),
    .B_storeAddr (kernel_2mm_wrapped_B_storeAddr),
    .B_storeData (kernel_2mm_wrapped_B_storeData),
    .C_loadEn (kernel_2mm_wrapped_C_loadEn),
    .C_loadAddr (kernel_2mm_wrapped_C_loadAddr),
    .C_storeEn (kernel_2mm_wrapped_C_storeEn),
    .C_storeAddr (kernel_2mm_wrapped_C_storeAddr),
    .C_storeData (kernel_2mm_wrapped_C_storeData),
    .D_loadEn (kernel_2mm_wrapped_D_loadEn),
    .D_loadAddr (kernel_2mm_wrapped_D_loadAddr),
    .D_storeEn (kernel_2mm_wrapped_D_storeEn),
    .D_storeAddr (kernel_2mm_wrapped_D_storeAddr),
    .D_storeData (kernel_2mm_wrapped_D_storeData)
  );

endmodule
