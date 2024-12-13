`timescale 1ns / 1ps
module register (
	input [4:0] rs,
	input [4:0] rt,
	input [4:0] rd,
	input [31:0] writedata,
	input regwrite,
	output reg [31:0] A,
	output reg [31:0] B,
	input clk,
	input reset
);

reg [31:0] registers[0:31];
integer i;

always @* begin
	A = registers [rs];
	B = registers [rd];
	end

always @(posedge clk or reset) begin
	if(reset) begin
		for (i = 0; i<32; i = i+1)
			registers[i] = 0;
	end
	if (rd !=0 && regwrite)
		registers[rd] <= writedata;
	end

endmodule
