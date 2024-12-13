`timescale 1ns / 1ps
module BOTTOM_MUX(
    input [4:0] b,
    input [4:0] a,
    input sel,
    output [4:0] y
    );
    assign y = sel ? a: b;
endmodule
