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
  a_loadAddr,
  a_loadEn,
  a_storeEn,
  a_storeAddr,
  a_storeData,
  a_loadData,
  s_loadAddr,
  s_loadEn,
  s_storeEn,
  s_storeAddr,
  s_storeData,
  s_loadData,
  q_loadAddr,
  q_loadEn,
  q_storeEn,
  q_storeAddr,
  q_storeData,
  q_loadData,
  p_loadAddr,
  p_loadEn,
  p_storeEn,
  p_storeAddr,
  p_storeData,
  p_loadData,
  r_loadAddr,
  r_loadEn,
  r_storeEn,
  r_storeAddr,
  r_storeData,
  r_loadData,
  out0
);
  input rst;
  input clk;
  input ap_start;
  output ap_ready;
  output ap_done;
  output [6:0] a_loadAddr;
  output a_loadEn;
  output a_storeEn;
  output [6:0] a_storeAddr;
  output [7:0] a_storeData;
  input [7:0] a_loadData;
  output [3:0] s_loadAddr;
  output s_loadEn;
  output s_storeEn;
  output [3:0] s_storeAddr;
  output [7:0] s_storeData;
  input [7:0] s_loadData;
  output [3:0] q_loadAddr;
  output q_loadEn;
  output q_storeEn;
  output [3:0] q_storeAddr;
  output [7:0] q_storeData;
  input [7:0] q_loadData;
  output [3:0] p_loadAddr;
  output p_loadEn;
  output p_storeEn;
  output [3:0] p_storeAddr;
  output [7:0] p_storeData;
  input [7:0] p_loadData;
  output [3:0] r_loadAddr;
  output r_loadEn;
  output r_storeEn;
  output [3:0] r_storeAddr;
  output [7:0] r_storeData;
  input [7:0] r_loadData;
  output [7:0] out0;
  wire kernel_state;
  wire all_finish;
  wire a_start_valid;
  wire a_start_ready;
  wire s_start_valid;
  wire s_start_ready;
  wire q_start_valid;
  wire q_start_ready;
  wire p_start_valid;
  wire p_start_ready;
  wire r_start_valid;
  wire r_start_ready;
  wire start_valid;
  wire start_ready;
  wire out0_valid;
  wire out0_ready;
  wire a_end_valid;
  wire a_end_ready;
  wire s_end_valid;
  wire s_end_ready;
  wire q_end_valid;
  wire q_end_ready;
  wire p_end_valid;
  wire p_end_ready;
  wire r_end_valid;
  wire r_end_ready;
  wire end_valid;
  wire end_ready;
  bicg bicg_inst (
    .clk(clk),
    .rst(rst),
    .a_loadEn(a_loadEn),
    .a_loadAddr(a_loadAddr),
    .a_loadData(a_loadData),
    .a_storeEn(a_storeEn),
    .a_storeAddr(a_storeAddr),
    .a_storeData(a_storeData),
    .s_loadEn(s_loadEn),
    .s_loadAddr(s_loadAddr),
    .s_loadData(s_loadData),
    .s_storeEn(s_storeEn),
    .s_storeAddr(s_storeAddr),
    .s_storeData(s_storeData),
    .q_loadEn(q_loadEn),
    .q_loadAddr(q_loadAddr),
    .q_loadData(q_loadData),
    .q_storeEn(q_storeEn),
    .q_storeAddr(q_storeAddr),
    .q_storeData(q_storeData),
    .p_loadEn(p_loadEn),
    .p_loadAddr(p_loadAddr),
    .p_loadData(p_loadData),
    .p_storeEn(p_storeEn),
    .p_storeAddr(p_storeAddr),
    .p_storeData(p_storeData),
    .r_loadEn(r_loadEn),
    .r_loadAddr(r_loadAddr),
    .r_loadData(r_loadData),
    .r_storeEn(r_storeEn),
    .r_storeAddr(r_storeAddr),
    .r_storeData(r_storeData),
    .a_start_valid(a_start_valid),
    .a_start_ready(a_start_ready),
    .s_start_valid(s_start_valid),
    .s_start_ready(s_start_ready),
    .q_start_valid(q_start_valid),
    .q_start_ready(q_start_ready),
    .p_start_valid(p_start_valid),
    .p_start_ready(p_start_ready),
    .r_start_valid(r_start_valid),
    .r_start_ready(r_start_ready),
    .start_valid(start_valid),
    .start_ready(start_ready),
    .out0(out0),
    .out0_valid(out0_valid),
    .out0_ready(out0_ready),
    .a_end_valid(a_end_valid),
    .a_end_ready(a_end_ready),
    .s_end_valid(s_end_valid),
    .s_end_ready(s_end_ready),
    .q_end_valid(q_end_valid),
    .q_end_ready(q_end_ready),
    .p_end_valid(p_end_valid),
    .p_end_ready(p_end_ready),
    .r_end_valid(r_end_valid),
    .r_end_ready(r_end_ready),
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
  kernel_arg_buffer #(1) s_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(s_start_valid),
    .ready(s_start_ready)
  );
  kernel_arg_buffer #(1) q_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(q_start_valid),
    .ready(q_start_ready)
  );
  kernel_arg_buffer #(1) p_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(p_start_valid),
    .ready(p_start_ready)
  );
  kernel_arg_buffer #(1) r_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(r_start_valid),
    .ready(r_start_ready)
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
  kernel_join #(7) join_inst (
    .ins_valid({out0_valid, a_end_valid, s_end_valid, q_end_valid, p_end_valid, r_end_valid, end_valid}),
    .ins_ready({out0_ready, a_end_ready, s_end_ready, q_end_ready, p_end_ready, r_end_ready, end_ready}),
    .outs_valid(all_finish),
    .outs_ready(1'b1)
  );
endmodule
