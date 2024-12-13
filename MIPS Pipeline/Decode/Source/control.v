`timescale 1ns / 1ps
module control (
	input wire [5:0] opcode,
	output reg [3:0] EX,
	output reg [2:0] M,
	output reg [1:0] WB
);

parameter RTYPE = 6'b000000;
parameter LW = 6'b100_011;
parameter SW = 6'b101_011;
parameter BEQ = 6'b000_100;
parameter NOP = 6'b100_000;

initial begin    //optional
	EX = 0;
	M = 0;
	WB = 0;
end

always @* begin
	case (opcode)
		RTYPE: begin //refer to fig on next page
			EX = 4'b1100;
			M = 3'b000;
			WB = 2'b10;
		end
		LW: begin
			EX = 4'b0001;
			M = 3'b010;
			WB = 2'b11;
		end
		SW: begin
			EX = 4'b0001;
			M = 3'b001;
			WB = 2'b0Z;
		end
		BEQ: begin
			EX = 4'b0010;
			M = 3'b100;
			WB = 2'b0Z;
		end
		NOP: begin //not in manual but helpful
			EX = 4'b0000;
			M = {3{1'b0}};
			WB = {2{1'b0}};
		end
	endcase
end
endmodule
