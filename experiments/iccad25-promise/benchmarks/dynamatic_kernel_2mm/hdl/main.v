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
  tmp_loadAddr,
  tmp_loadEn,
  tmp_storeEn,
  tmp_storeAddr,
  tmp_storeData,
  tmp_loadData,
  A_loadAddr,
  A_loadEn,
  A_storeEn,
  A_storeAddr,
  A_storeData,
  A_loadData,
  B_loadAddr,
  B_loadEn,
  B_storeEn,
  B_storeAddr,
  B_storeData,
  B_loadData,
  C_loadAddr,
  C_loadEn,
  C_storeEn,
  C_storeAddr,
  C_storeData,
  C_loadData,
  D_loadAddr,
  D_loadEn,
  D_storeEn,
  D_storeAddr,
  D_storeData,
  D_loadData
);
  input rst;
  input clk;
  input ap_start;
  output ap_ready;
  output ap_done;
  input [7:0] alpha;
  input [7:0] beta;
  output [6:0] tmp_loadAddr;
  output tmp_loadEn;
  output tmp_storeEn;
  output [6:0] tmp_storeAddr;
  output [7:0] tmp_storeData;
  input [7:0] tmp_loadData;
  output [6:0] A_loadAddr;
  output A_loadEn;
  output A_storeEn;
  output [6:0] A_storeAddr;
  output [7:0] A_storeData;
  input [7:0] A_loadData;
  output [6:0] B_loadAddr;
  output B_loadEn;
  output B_storeEn;
  output [6:0] B_storeAddr;
  output [7:0] B_storeData;
  input [7:0] B_loadData;
  output [6:0] C_loadAddr;
  output C_loadEn;
  output C_storeEn;
  output [6:0] C_storeAddr;
  output [7:0] C_storeData;
  input [7:0] C_loadData;
  output [6:0] D_loadAddr;
  output D_loadEn;
  output D_storeEn;
  output [6:0] D_storeAddr;
  output [7:0] D_storeData;
  input [7:0] D_loadData;
  wire kernel_state;
  wire all_finish;
  wire [7:0] alpha_data_out;
  wire alpha_valid;
  wire alpha_ready;
  wire [7:0] beta_data_out;
  wire beta_valid;
  wire beta_ready;
  wire tmp_start_valid;
  wire tmp_start_ready;
  wire A_start_valid;
  wire A_start_ready;
  wire B_start_valid;
  wire B_start_ready;
  wire C_start_valid;
  wire C_start_ready;
  wire D_start_valid;
  wire D_start_ready;
  wire start_valid;
  wire start_ready;
  wire tmp_end_valid;
  wire tmp_end_ready;
  wire A_end_valid;
  wire A_end_ready;
  wire B_end_valid;
  wire B_end_ready;
  wire C_end_valid;
  wire C_end_ready;
  wire D_end_valid;
  wire D_end_ready;
  wire end_valid;
  wire end_ready;
  kernel_2mm kernel_2mm_inst (
    .clk(clk),
    .rst(rst),
    .alpha(alpha_data_out),
    .alpha_valid(alpha_valid),
    .alpha_ready(alpha_ready),
    .beta(beta_data_out),
    .beta_valid(beta_valid),
    .beta_ready(beta_ready),
    .tmp_loadEn(tmp_loadEn),
    .tmp_loadAddr(tmp_loadAddr),
    .tmp_loadData(tmp_loadData),
    .tmp_storeEn(tmp_storeEn),
    .tmp_storeAddr(tmp_storeAddr),
    .tmp_storeData(tmp_storeData),
    .A_loadEn(A_loadEn),
    .A_loadAddr(A_loadAddr),
    .A_loadData(A_loadData),
    .A_storeEn(A_storeEn),
    .A_storeAddr(A_storeAddr),
    .A_storeData(A_storeData),
    .B_loadEn(B_loadEn),
    .B_loadAddr(B_loadAddr),
    .B_loadData(B_loadData),
    .B_storeEn(B_storeEn),
    .B_storeAddr(B_storeAddr),
    .B_storeData(B_storeData),
    .C_loadEn(C_loadEn),
    .C_loadAddr(C_loadAddr),
    .C_loadData(C_loadData),
    .C_storeEn(C_storeEn),
    .C_storeAddr(C_storeAddr),
    .C_storeData(C_storeData),
    .D_loadEn(D_loadEn),
    .D_loadAddr(D_loadAddr),
    .D_loadData(D_loadData),
    .D_storeEn(D_storeEn),
    .D_storeAddr(D_storeAddr),
    .D_storeData(D_storeData),
    .tmp_start_valid(tmp_start_valid),
    .tmp_start_ready(tmp_start_ready),
    .A_start_valid(A_start_valid),
    .A_start_ready(A_start_ready),
    .B_start_valid(B_start_valid),
    .B_start_ready(B_start_ready),
    .C_start_valid(C_start_valid),
    .C_start_ready(C_start_ready),
    .D_start_valid(D_start_valid),
    .D_start_ready(D_start_ready),
    .start_valid(start_valid),
    .start_ready(start_ready),
    .tmp_end_valid(tmp_end_valid),
    .tmp_end_ready(tmp_end_ready),
    .A_end_valid(A_end_valid),
    .A_end_ready(A_end_ready),
    .B_end_valid(B_end_valid),
    .B_end_ready(B_end_ready),
    .C_end_valid(C_end_valid),
    .C_end_ready(C_end_ready),
    .D_end_valid(D_end_valid),
    .D_end_ready(D_end_ready),
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
  kernel_arg_buffer #(1) tmp_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(tmp_start_valid),
    .ready(tmp_start_ready)
  );
  kernel_arg_buffer #(1) A_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(A_start_valid),
    .ready(A_start_ready)
  );
  kernel_arg_buffer #(1) B_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(B_start_valid),
    .ready(B_start_ready)
  );
  kernel_arg_buffer #(1) C_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(C_start_valid),
    .ready(C_start_ready)
  );
  kernel_arg_buffer #(1) D_start_data_reg_inst (
    .clk(clk),
    .rst(rst),
    .kernel_state(kernel_state),
    .ap_start(ap_start),
    .data_in(1'b1),
    .data_out(),
    .valid(D_start_valid),
    .ready(D_start_ready)
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
  kernel_join #(6) join_inst (
    .ins_valid({tmp_end_valid, A_end_valid, B_end_valid, C_end_valid, D_end_valid, end_valid}),
    .ins_ready({tmp_end_ready, A_end_ready, B_end_ready, C_end_ready, D_end_ready, end_ready}),
    .outs_valid(all_finish),
    .outs_ready(1'b1)
  );
endmodule
