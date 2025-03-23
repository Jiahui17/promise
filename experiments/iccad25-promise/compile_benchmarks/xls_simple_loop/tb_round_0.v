`timescale 1ns/1ns
module tb;
reg [9:0] n; // input signal
reg [0:0] go; // input signal
reg [0:0] rst; // input signal
wire [9:0] result; // input signal
wire [0:0] result_valid; // output signal
reg clk = 0;
main dut(
.n(n),
.go(go),
.clk(clk),
.rst(rst),
.result(result),
.result_valid(result_valid)
);
always
	 #2 clk = ~clk;
initial begin
$dumpfile("./trace_round_0.vcd");
$dumpvars(0, tb.dut);
go <= 1;
n <= 900;
rst <= 1;
#4;
#4;
rst <= 0;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#400;
$finish;
end
endmodule
