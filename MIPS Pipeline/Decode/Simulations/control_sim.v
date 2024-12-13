`timescale 1ns / 1ps
module control_sim(

    );
	reg [5:0] opcode;
	wire [3:0] EX;
	wire [2:0] M;
	wire [1:0] WB;
	control DUT (
	   .opcode(opcode),
	   .EX(EX),
	   .M(M),
	   .WB(WB)
	);
	
	initial begin;
	   #10
	   opcode = 6'b000000;
	   #10
	   opcode = 6'b100_011;
	   #10
	   opcode = 6'b101_011;
	   #10
	   opcode = 6'b000_100;
	   #10
	   opcode = 6'b100_000;
	   #10
	   $finish;
	end
	
endmodule
