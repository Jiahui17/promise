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
  alpha,
  beta,
  u1_loadAddr,
  u1_loadEn,
  u1_storeEn,
  u1_storeAddr,
  u1_storeData,
  u1_loadData,
  v1_loadAddr,
  v1_loadEn,
  v1_storeEn,
  v1_storeAddr,
  v1_storeData,
  v1_loadData,
  u2_loadAddr,
  u2_loadEn,
  u2_storeEn,
  u2_storeAddr,
  u2_storeData,
  u2_loadData,
  v2_loadAddr,
  v2_loadEn,
  v2_storeEn,
  v2_storeAddr,
  v2_storeData,
  v2_loadData,
  y_loadAddr,
  y_loadEn,
  y_storeEn,
  y_storeAddr,
  y_storeData,
  y_loadData,
  z_loadAddr,
  z_loadEn,
  z_storeEn,
  z_storeAddr,
  z_storeData,
  z_loadData,
  a_loadAddr,
  a_loadEn,
  a_storeEn,
  a_storeAddr,
  a_storeData,
  a_loadData,
  w_loadAddr,
  w_loadEn,
  w_storeEn,
  w_storeAddr,
  w_storeData,
  w_loadData,
  x_loadAddr,
  x_loadEn,
  x_storeEn,
  x_storeAddr,
  x_storeData,
  x_loadData
);
  input rst;
  input clk;
  input ap_start;
  output ap_ready;
  output ap_done;
  input [7:0] alpha;
  input [7:0] beta;
  output [3:0] u1_loadAddr;
  output u1_loadEn;
  output u1_storeEn;
  output [3:0] u1_storeAddr;
  output [7:0] u1_storeData;
  input [7:0] u1_loadData;
  output [3:0] v1_loadAddr;
  output v1_loadEn;
  output v1_storeEn;
  output [3:0] v1_storeAddr;
  output [7:0] v1_storeData;
  input [7:0] v1_loadData;
  output [3:0] u2_loadAddr;
  output u2_loadEn;
  output u2_storeEn;
  output [3:0] u2_storeAddr;
  output [7:0] u2_storeData;
  input [7:0] u2_loadData;
  output [3:0] v2_loadAddr;
  output v2_loadEn;
  output v2_storeEn;
  output [3:0] v2_storeAddr;
  output [7:0] v2_storeData;
  input [7:0] v2_loadData;
  output [3:0] y_loadAddr;
  output y_loadEn;
  output y_storeEn;
  output [3:0] y_storeAddr;
  output [7:0] y_storeData;
  input [7:0] y_loadData;
  output [3:0] z_loadAddr;
  output z_loadEn;
  output z_storeEn;
  output [3:0] z_storeAddr;
  output [7:0] z_storeData;
  input [7:0] z_loadData;
  output [6:0] a_loadAddr;
  output a_loadEn;
  output a_storeEn;
  output [6:0] a_storeAddr;
  output [7:0] a_storeData;
  input [7:0] a_loadData;
  output [3:0] w_loadAddr;
  output w_loadEn;
  output w_storeEn;
  output [3:0] w_storeAddr;
  output [7:0] w_storeData;
  input [7:0] w_loadData;
  output [3:0] x_loadAddr;
  output x_loadEn;
  output x_storeEn;
  output [3:0] x_storeAddr;
  output [7:0] x_storeData;
  input [7:0] x_loadData;
  wire kernel_state;
  wire all_finish;
  wire [7:0] alpha_data_out;
  wire alpha_valid;
  wire alpha_ready;
  wire [7:0] beta_data_out;
  wire beta_valid;
  wire beta_ready;
  wire u1_start_valid;
  wire u1_start_ready;
  wire v1_start_valid;
  wire v1_start_ready;
  wire u2_start_valid;
  wire u2_start_ready;
  wire v2_start_valid;
  wire v2_start_ready;
  wire y_start_valid;
  wire y_start_ready;
  wire z_start_valid;
  wire z_start_ready;
  wire a_start_valid;
  wire a_start_ready;
  wire w_start_valid;
  wire w_start_ready;
  wire x_start_valid;
  wire x_start_ready;
  wire start_valid;
  wire start_ready;
  wire u1_end_valid;
  wire u1_end_ready;
  wire v1_end_valid;
  wire v1_end_ready;
  wire u2_end_valid;
  wire u2_end_ready;
  wire v2_end_valid;
  wire v2_end_ready;
  wire y_end_valid;
  wire y_end_ready;
  wire z_end_valid;
  wire z_end_ready;
  wire a_end_valid;
  wire a_end_ready;
  wire w_end_valid;
  wire w_end_ready;
  wire x_end_valid;
  wire x_end_ready;
  wire end_valid;
  wire end_ready;
  gemver gemver_inst (
    .clk(clk),
    .rst(rst),
    .alpha(alpha_data_out),
    .alpha_valid(alpha_valid),
    .alpha_ready(alpha_ready),
    .beta(beta_data_out),
    .beta_valid(beta_valid),
    .beta_ready(beta_ready),
    .u1_loadEn(u1_loadEn),
    .u1_loadAddr(u1_loadAddr),
    .u1_loadData(u1_loadData),
    .u1_storeEn(u1_storeEn),
    .u1_storeAddr(u1_storeAddr),
    .u1_storeData(u1_storeData),
    .v1_loadEn(v1_loadEn),
    .v1_loadAddr(v1_loadAddr),
    .v1_loadData(v1_loadData),
    .v1_storeEn(v1_storeEn),
    .v1_storeAddr(v1_storeAddr),
    .v1_storeData(v1_storeData),
    .u2_loadEn(u2_loadEn),
    .u2_loadAddr(u2_loadAddr),
    .u2_loadData(u2_loadData),
    .u2_storeEn(u2_storeEn),
    .u2_storeAddr(u2_storeAddr),
    .u2_storeData(u2_storeData),
    .v2_loadEn(v2_loadEn),
    .v2_loadAddr(v2_loadAddr),
    .v2_loadData(v2_loadData),
    .v2_storeEn(v2_storeEn),
    .v2_storeAddr(v2_storeAddr),
    .v2_storeData(v2_storeData),
    .y_loadEn(y_loadEn),
    .y_loadAddr(y_loadAddr),
    .y_loadData(y_loadData),
    .y_storeEn(y_storeEn),
    .y_storeAddr(y_storeAddr),
    .y_storeData(y_storeData),
    .z_loadEn(z_loadEn),
    .z_loadAddr(z_loadAddr),
    .z_loadData(z_loadData),
    .z_storeEn(z_storeEn),
    .z_storeAddr(z_storeAddr),
    .z_storeData(z_storeData),
    .a_loadEn(a_loadEn),
    .a_loadAddr(a_loadAddr),
    .a_loadData(a_loadData),
    .a_storeEn(a_storeEn),
    .a_storeAddr(a_storeAddr),
    .a_storeData(a_storeData),
    .w_loadEn(w_loadEn),
    .w_loadAddr(w_loadAddr),
    .w_loadData(w_loadData),
    .w_storeEn(w_storeEn),
    .w_storeAddr(w_storeAddr),
    .w_storeData(w_storeData),
    .x_loadEn(x_loadEn),
    .x_loadAddr(x_loadAddr),
    .x_loadData(x_loadData),
    .x_storeEn(x_storeEn),
    .x_storeAddr(x_storeAddr),
    .x_storeData(x_storeData),
    .u1_start_valid(u1_start_valid),
    .u1_start_ready(u1_start_ready),
    .v1_start_valid(v1_start_valid),
    .v1_start_ready(v1_start_ready),
    .u2_start_valid(u2_start_valid),
    .u2_start_ready(u2_start_ready),
    .v2_start_valid(v2_start_valid),
    .v2_start_ready(v2_start_ready),
    .y_start_valid(y_start_valid),
    .y_start_ready(y_start_ready),
    .z_start_valid(z_start_valid),
    .z_start_ready(z_start_ready),
    .a_start_valid(a_start_valid),
    .a_start_ready(a_start_ready),
    .w_start_valid(w_start_valid),
    .w_start_ready(w_start_ready),
    .x_start_valid(x_start_valid),
    .x_start_ready(x_start_ready),
    .start_valid(start_valid),
    .start_ready(start_ready),
    .u1_end_valid(u1_end_valid),
    .u1_end_ready(u1_end_ready),
    .v1_end_valid(v1_end_valid),
    .v1_end_ready(v1_end_ready),
    .u2_end_valid(u2_end_valid),
    .u2_end_ready(u2_end_ready),
    .v2_end_valid(v2_end_valid),
    .v2_end_ready(v2_end_ready),
    .y_end_valid(y_end_valid),
    .y_end_ready(y_end_ready),
    .z_end_valid(z_end_valid),
    .z_end_ready(z_end_ready),
    .a_end_valid(a_end_valid),
    .a_end_ready(a_end_ready),
    .w_end_valid(w_end_valid),
    .w_end_ready(w_end_ready),
    .x_end_valid(x_end_valid),
    .x_end_ready(x_end_ready),
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
  kernel_arg_buffer #(8) alpha_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(alpha),
    .data_out(alpha_data_out),
    .valid(alpha_valid),
    .ready(alpha_ready)
  );
  kernel_arg_buffer #(8) beta_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(beta),
    .data_out(beta_data_out),
    .valid(beta_valid),
    .ready(beta_ready)
  );
  kernel_arg_buffer #(1) u1_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(u1_start_valid),
    .ready(u1_start_ready)
  );
  kernel_arg_buffer #(1) v1_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(v1_start_valid),
    .ready(v1_start_ready)
  );
  kernel_arg_buffer #(1) u2_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(u2_start_valid),
    .ready(u2_start_ready)
  );
  kernel_arg_buffer #(1) v2_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(v2_start_valid),
    .ready(v2_start_ready)
  );
  kernel_arg_buffer #(1) y_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(y_start_valid),
    .ready(y_start_ready)
  );
  kernel_arg_buffer #(1) z_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(z_start_valid),
    .ready(z_start_ready)
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
  kernel_arg_buffer #(1) w_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(w_start_valid),
    .ready(w_start_ready)
  );
  kernel_arg_buffer #(1) x_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(x_start_valid),
    .ready(x_start_ready)
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
  kernel_join #(10) join_inst (
    .ins_valid({u1_end_valid, v1_end_valid, u2_end_valid, v2_end_valid, y_end_valid, z_end_valid, a_end_valid, w_end_valid, x_end_valid, end_valid}),
    .ins_ready({u1_end_ready, v1_end_ready, u2_end_ready, v2_end_ready, y_end_ready, z_end_ready, a_end_ready, w_end_ready, x_end_ready, end_ready}),
    .outs_valid(all_finish),
    .outs_ready(1'b1)
  );
endmodule
