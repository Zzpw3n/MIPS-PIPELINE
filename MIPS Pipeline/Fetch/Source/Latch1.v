`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 11:00:28 PM
// Design Name: 
// Module Name: Latch1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Latch1(
    input wire clk,
    output reg [31:0] instrout,
        npcout,
    input wire [31:0] instr,
                        npc
    );
    initial begin
        instrout <= 0;
        npcout <= 0;
    end
    
    always @(posedge clk) begin
        instrout <= instr;
        npcout <= npc;
    end
endmodule
