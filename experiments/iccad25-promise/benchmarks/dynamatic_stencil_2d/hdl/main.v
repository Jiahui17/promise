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
  orig_loadAddr,
  orig_loadEn,
  orig_storeEn,
  orig_storeAddr,
  orig_storeData,
  orig_loadData,
  filter_loadAddr,
  filter_loadEn,
  filter_storeEn,
  filter_storeAddr,
  filter_storeData,
  filter_loadData,
  sol_loadAddr,
  sol_loadEn,
  sol_storeEn,
  sol_storeAddr,
  sol_storeData,
  sol_loadData,
  out0
);
  input rst;
  input clk;
  input ap_start;
  output ap_ready;
  output ap_done;
  output [9:0] orig_loadAddr;
  output orig_loadEn;
  output orig_storeEn;
  output [9:0] orig_storeAddr;
  output [7:0] orig_storeData;
  input [7:0] orig_loadData;
  output [3:0] filter_loadAddr;
  output filter_loadEn;
  output filter_storeEn;
  output [3:0] filter_storeAddr;
  output [7:0] filter_storeData;
  input [7:0] filter_loadData;
  output [9:0] sol_loadAddr;
  output sol_loadEn;
  output sol_storeEn;
  output [9:0] sol_storeAddr;
  output [7:0] sol_storeData;
  input [7:0] sol_loadData;
  output [7:0] out0;
  wire kernel_state;
  wire all_finish;
  wire orig_start_valid;
  wire orig_start_ready;
  wire filter_start_valid;
  wire filter_start_ready;
  wire sol_start_valid;
  wire sol_start_ready;
  wire start_valid;
  wire start_ready;
  wire out0_valid;
  wire out0_ready;
  wire orig_end_valid;
  wire orig_end_ready;
  wire filter_end_valid;
  wire filter_end_ready;
  wire sol_end_valid;
  wire sol_end_ready;
  wire end_valid;
  wire end_ready;
  stencil_2d stencil_2d_inst (
    .clk(clk),
    .rst(rst),
    .orig_loadEn(orig_loadEn),
    .orig_loadAddr(orig_loadAddr),
    .orig_loadData(orig_loadData),
    .orig_storeEn(orig_storeEn),
    .orig_storeAddr(orig_storeAddr),
    .orig_storeData(orig_storeData),
    .filter_loadEn(filter_loadEn),
    .filter_loadAddr(filter_loadAddr),
    .filter_loadData(filter_loadData),
    .filter_storeEn(filter_storeEn),
    .filter_storeAddr(filter_storeAddr),
    .filter_storeData(filter_storeData),
    .sol_loadEn(sol_loadEn),
    .sol_loadAddr(sol_loadAddr),
    .sol_loadData(sol_loadData),
    .sol_storeEn(sol_storeEn),
    .sol_storeAddr(sol_storeAddr),
    .sol_storeData(sol_storeData),
    .orig_start_valid(orig_start_valid),
    .orig_start_ready(orig_start_ready),
    .filter_start_valid(filter_start_valid),
    .filter_start_ready(filter_start_ready),
    .sol_start_valid(sol_start_valid),
    .sol_start_ready(sol_start_ready),
    .start_valid(start_valid),
    .start_ready(start_ready),
    .out0(out0),
    .out0_valid(out0_valid),
    .out0_ready(out0_ready),
    .orig_end_valid(orig_end_valid),
    .orig_end_ready(orig_end_ready),
    .filter_end_valid(filter_end_valid),
    .filter_end_ready(filter_end_ready),
    .sol_end_valid(sol_end_valid),
    .sol_end_ready(sol_end_ready),
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
  kernel_arg_buffer #(1) orig_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(orig_start_valid),
    .ready(orig_start_ready)
  );
  kernel_arg_buffer #(1) filter_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(filter_start_valid),
    .ready(filter_start_ready)
  );
  kernel_arg_buffer #(1) sol_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(sol_start_valid),
    .ready(sol_start_ready)
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
  kernel_join #(5) join_inst (
    .ins_valid({out0_valid, orig_end_valid, filter_end_valid, sol_end_valid, end_valid}),
    .ins_ready({out0_ready, orig_end_ready, filter_end_ready, sol_end_ready, end_ready}),
    .outs_valid(all_finish),
    .outs_ready(1'b1)
  );
endmodule
