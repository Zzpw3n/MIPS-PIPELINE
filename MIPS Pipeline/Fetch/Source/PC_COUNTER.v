`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 11:09:49 PM
// Design Name: 
// Module Name: PC_COUNTER
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


module PC_COUNTER(
    output reg [31:0] PC,
    input wire [31:0] npc,
    input clk
    );
    
    initial begin
        PC <= 0;
    end
    
    always @(posedge clk) begin
        PC <= npc;
    end
endmodule
