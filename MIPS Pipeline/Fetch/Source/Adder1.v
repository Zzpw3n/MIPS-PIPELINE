`timescale 1ns / 1ps
module Adder1(
    input [31:0] PC,
    output [31:0] Next_PC
    );
    assign Next_PC = PC + 1;
endmodule
