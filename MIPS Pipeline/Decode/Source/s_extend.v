`timescale 1ns / 1ps
module s_extend (
	input [15:0] nextend,
	output reg [31:0] extend
);
always @* begin
	//replicate signed bit 16 times
	extend = {{16{nextend[15],
			nextend}}};
		end
endmodule
