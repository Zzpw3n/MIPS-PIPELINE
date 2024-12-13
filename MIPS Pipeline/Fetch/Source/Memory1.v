`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 11:02:46 PM
// Design Name: 
// Module Name: Memory1
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


module Memory1(
    input clk,
    output reg [31:0] data,
    input wire [31:0] addr
    );
    reg [31:0] MEM[0:127];
    initial begin
    
    MEM[0] <= 'hA00000AA;
    MEM[1] <= 'h10000011;
    MEM[2] <= 'h20000022;
    MEM[3] <= 'h30000033;
    MEM[4] <= 'h40000044;
    MEM[5] <= 'h50000055;
    MEM[6] <= 'h60000066;
    MEM[7] <= 'h70000077;
    MEM[8] <= 'h80000088;
    MEM[9] <= 'h90000099;
    end
    
    always @(posedge clk) data <= MEM[addr];
    
    integer i;
    initial begin
        $readmemb("risc.txt", MEM);
        for (i=0; i<24; i = i+1)
            $display(MEM[i]);
        end
endmodule
