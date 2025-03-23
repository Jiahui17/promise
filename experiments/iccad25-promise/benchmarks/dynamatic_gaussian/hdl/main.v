`timescale 1ns / 1ps


// An 1-slot buffer that stores the argument
module kernel_arg_buffer #(
  parameter DATA_TYPE = 32
)(
  clk,
  rst,
  kernel_state,
  ap_start,
  data_in,
  data_out,
  valid,
  ready
);
  input clk;
  input rst;
  input [DATA_TYPE-1:0]data_in;
  output [DATA_TYPE-1:0]data_out;
  output valid;
  input ready;
  input ap_start;
  input kernel_state;

  reg [DATA_TYPE-1:0]data_reg = 0;
  reg sent = 0;

  always @(posedge clk) begin
    if (rst) 
      data_reg <= 0;
    else begin
      if (ap_start && kernel_state == 0) 
        data_reg <= data_in;
    end
  end

  always @(posedge clk) begin
    if (rst || (ap_start && kernel_state == 0))
      sent <= 0;
    else begin
      if (valid && ready)
        sent <= 1;
    end
  end 

  assign valid = (!sent) && (kernel_state == 1);
  assign data_out = data_reg;
endmodule

module kernel_state_reg (
  clk,
  rst, 
  ap_start,
  ap_ready,
  kernel_state,
  all_finish,
  ap_done
);
  input clk;
  input rst;
  input ap_start;
  output ap_ready;
  output kernel_state;
  // All the output channels of the handshake kernel are valid
  input all_finish;
  output ap_done;

  reg kernel_state_reg = 0;

  assign kernel_state = kernel_state_reg;
  assign ap_done = all_finish && (kernel_state_reg == 1);
  assign ap_ready = (kernel_state == 0);

  always @(posedge clk) begin
    if (rst) begin
      kernel_state_reg <= 0;
    end else if (ap_start && kernel_state_reg == 0)
      kernel_state_reg <= 1;
    // ap_done will be high for one cycle (when all_finish and we are in the
    // running state). After that we return to the idle state
    else if (ap_done)
      kernel_state_reg <= 0;
  end
endmodule

module kernel_join #(
  parameter SIZE = 2
)(
  input [SIZE - 1 : 0] ins_valid,
  input outs_ready,

  output reg  [SIZE - 1 : 0] ins_ready = 0,
  output outs_valid
);
  // AND of all the bits in ins_valid vector
  assign outs_valid = &ins_valid;

  reg [SIZE - 1 : 0] singleValid = 0;
  integer i, j;

  always @(*)begin
    for (i = 0; i < SIZE; i = i + 1) begin
      singleValid[i] = 1;
      for (j = 0; j < SIZE; j = j + 1)
        if (i != j)
          singleValid[i] = singleValid[i] & ins_valid[j];
    end
    for (i = 0; i < SIZE; i = i + 1) begin
      ins_ready[i] = singleValid[i] & outs_ready;
    end
  end
endmodule


module main(rst,
  clk,
  ap_start,
  ap_ready,
  ap_done,
  c_loadAddr,
  c_loadEn,
  c_storeEn,
  c_storeAddr,
  c_storeData,
  c_loadData,
  a_loadAddr,
  a_loadEn,
  a_storeEn,
  a_storeAddr,
  a_storeData,
  a_loadData,
  out0
);
  input rst;
  input clk;
  input ap_start;
  output ap_ready;
  output ap_done;
  output [3:0] c_loadAddr;
  output c_loadEn;
  output c_storeEn;
  output [3:0] c_storeAddr;
  output [7:0] c_storeData;
  input [7:0] c_loadData;
  output [6:0] a_loadAddr;
  output a_loadEn;
  output a_storeEn;
  output [6:0] a_storeAddr;
  output [7:0] a_storeData;
  input [7:0] a_loadData;
  output [7:0] out0;
  wire kernel_state;
  wire all_finish;
  wire c_start_valid;
  wire c_start_ready;
  wire a_start_valid;
  wire a_start_ready;
  wire start_valid;
  wire start_ready;
  wire out0_valid;
  wire out0_ready;
  wire c_end_valid;
  wire c_end_ready;
  wire a_end_valid;
  wire a_end_ready;
  wire end_valid;
  wire end_ready;
  gaussian gaussian_inst (
    .clk(clk),
    .rst(rst),
    .c_loadEn(c_loadEn),
    .c_loadAddr(c_loadAddr),
    .c_loadData(c_loadData),
    .c_storeEn(c_storeEn),
    .c_storeAddr(c_storeAddr),
    .c_storeData(c_storeData),
    .a_loadEn(a_loadEn),
    .a_loadAddr(a_loadAddr),
    .a_loadData(a_loadData),
    .a_storeEn(a_storeEn),
    .a_storeAddr(a_storeAddr),
    .a_storeData(a_storeData),
    .c_start_valid(c_start_valid),
    .c_start_ready(c_start_ready),
    .a_start_valid(a_start_valid),
    .a_start_ready(a_start_ready),
    .start_valid(start_valid),
    .start_ready(start_ready),
    .out0(out0),
    .out0_valid(out0_valid),
    .out0_ready(out0_ready),
    .c_end_valid(c_end_valid),
    .c_end_ready(c_end_ready),
    .a_end_valid(a_end_valid),
    .a_end_ready(a_end_ready),
    .end_valid(end_valid),
    .end_ready(end_ready)
  );
  kernel_state_reg kernel_state_reg_inst (
    .clk(clk),
    .rst(rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .kernel_state(kernel_state),
    .all_finish(all_finish),
    .ap_done(ap_done)
  );
  kernel_arg_buffer #(1) c_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(c_start_valid),
    .ready(c_start_ready)
  );
  kernel_arg_buffer #(1) a_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(a_start_valid),
    .ready(a_start_ready)
  );
  kernel_arg_buffer #(1) start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(start_valid),
    .ready(start_ready)
  );
  kernel_join #(4) join_inst (
    .ins_valid({out0_valid, c_end_valid, a_end_valid, end_valid}),
    .ins_ready({out0_ready, c_end_ready, a_end_ready, end_ready}),
    .outs_valid(all_finish),
    .outs_ready(1'b1)
  );
endmodule
