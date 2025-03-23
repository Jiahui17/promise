module main(
  clk,
  rst,
  pi_1,
  po_1
);

input clk;
input rst;
input pi_1;
output po_1;

reg f1;
reg f2;
reg f3;
reg f4;
reg f5;
reg f6;
reg f7;

initial f1 = 1'b0;
initial f2 = 1'b0;
initial f3 = 1'b0;
initial f4 = 1'b0;
initial f5 = 1'b0;
initial f6 = 1'b0;
initial f7 = 1'b0;

wire [3-1:0] w1;
wire [3-1:0] w2;

wire masked_pi_1;

assign masked_pi_1 = pi_1 && (w1 < 5);
assign w2 = w1 - {3{f7}} + {3{masked_pi_1}};
assign w1[0] = f1;
assign w1[1] = f2;
assign w1[2] = f3;
assign po_1 = f7;

always @(posedge clk)
begin
  if (rst) begin
  f1 <= 1'b0;
  f2 <= 1'b0;
  f3 <= 1'b0;
  f4 <= 1'b0;
  f5 <= 1'b0;
  f6 <= 1'b0;
  f7 <= 1'b0;
  end else begin
  f1 <= w2[0];
  f2 <= w2[1];
  f3 <= w2[2];
  f4 <= masked_pi_1;
  f5 <= f4;
  f6 <= f5;
  f7 <= f6;
  end
end

endmodule
