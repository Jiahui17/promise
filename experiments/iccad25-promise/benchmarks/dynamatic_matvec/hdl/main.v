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
  m_loadAddr,
  m_loadEn,
  m_storeEn,
  m_storeAddr,
  m_storeData,
  m_loadData,
  v_loadAddr,
  v_loadEn,
  v_storeEn,
  v_storeAddr,
  v_storeData,
  v_loadData,
  out_loadAddr,
  out_loadEn,
  out_storeEn,
  out_storeAddr,
  out_storeData,
  out_loadData,
  out0
);
  input rst;
  input clk;
  input ap_start;
  output ap_ready;
  output ap_done;
  output [6:0] m_loadAddr;
  output m_loadEn;
  output m_storeEn;
  output [6:0] m_storeAddr;
  output [7:0] m_storeData;
  input [7:0] m_loadData;
  output [3:0] v_loadAddr;
  output v_loadEn;
  output v_storeEn;
  output [3:0] v_storeAddr;
  output [7:0] v_storeData;
  input [7:0] v_loadData;
  output [3:0] out_loadAddr;
  output out_loadEn;
  output out_storeEn;
  output [3:0] out_storeAddr;
  output [7:0] out_storeData;
  input [7:0] out_loadData;
  output [7:0] out0;
  wire kernel_state;
  wire all_finish;
  wire m_start_valid;
  wire m_start_ready;
  wire v_start_valid;
  wire v_start_ready;
  wire out_start_valid;
  wire out_start_ready;
  wire start_valid;
  wire start_ready;
  wire out0_valid;
  wire out0_ready;
  wire m_end_valid;
  wire m_end_ready;
  wire v_end_valid;
  wire v_end_ready;
  wire out_end_valid;
  wire out_end_ready;
  wire end_valid;
  wire end_ready;
  matvec matvec_inst (
    .clk(clk),
    .rst(rst),
    .m_loadEn(m_loadEn),
    .m_loadAddr(m_loadAddr),
    .m_loadData(m_loadData),
    .m_storeEn(m_storeEn),
    .m_storeAddr(m_storeAddr),
    .m_storeData(m_storeData),
    .v_loadEn(v_loadEn),
    .v_loadAddr(v_loadAddr),
    .v_loadData(v_loadData),
    .v_storeEn(v_storeEn),
    .v_storeAddr(v_storeAddr),
    .v_storeData(v_storeData),
    .out_loadEn(out_loadEn),
    .out_loadAddr(out_loadAddr),
    .out_loadData(out_loadData),
    .out_storeEn(out_storeEn),
    .out_storeAddr(out_storeAddr),
    .out_storeData(out_storeData),
    .m_start_valid(m_start_valid),
    .m_start_ready(m_start_ready),
    .v_start_valid(v_start_valid),
    .v_start_ready(v_start_ready),
    .out_start_valid(out_start_valid),
    .out_start_ready(out_start_ready),
    .start_valid(start_valid),
    .start_ready(start_ready),
    .out0(out0),
    .out0_valid(out0_valid),
    .out0_ready(out0_ready),
    .m_end_valid(m_end_valid),
    .m_end_ready(m_end_ready),
    .v_end_valid(v_end_valid),
    .v_end_ready(v_end_ready),
    .out_end_valid(out_end_valid),
    .out_end_ready(out_end_ready),
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
  kernel_arg_buffer #(1) m_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(m_start_valid),
    .ready(m_start_ready)
  );
  kernel_arg_buffer #(1) v_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(v_start_valid),
    .ready(v_start_ready)
  );
  kernel_arg_buffer #(1) out_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(out_start_valid),
    .ready(out_start_ready)
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
    .ins_valid({out0_valid, m_end_valid, v_end_valid, out_end_valid, end_valid}),
    .ins_ready({out0_ready, m_end_ready, v_end_ready, out_end_ready, end_ready}),
    .outs_valid(all_finish),
    .outs_ready(1'b1)
  );
endmodule
