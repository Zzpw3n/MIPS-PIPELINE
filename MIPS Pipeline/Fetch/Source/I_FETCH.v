`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 11:11:38 PM
// Design Name: 
// Module Name: I_FETCH
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


module I_FETCH(
    input clk,
    //output for fetch
    output wire [31:0] IF_ID_instr,
    output wire [31:0] IF_ID_npc,
    //input for fetch
    input wire EX_MEM_PCSrc,
    input wire [31:0] EX_MEM_NPC
    );
    
    wire [31:0] PC;
    wire [31:0] dataout;
    wire [31:0] npc, npc_mux;
    
    Mux mux1 (
        .y(npc_mux),
        .a(EX_MEM_NPC),
        .b(NPC),
        .sel(EX_MEM_PCSrc)
        );
    
    PC_COUNTER pc_counter1 (
        .clk(clk),
        .PC(PC),
        .npc(npc_mux)
        );
    
    Memory1 memory1 (
        .clk(clk),
        .data(dataout),
        .addr(PC)
        );
    
    Latch1 if_id1 (
        .clk(clk),
        .instr(dataout),
        .npc(npc),
        .instrout(IF_ID_instr),
        .npcout(IF_ID_npc)
        );
    
    Adder1 incrementer1 (
        .Next_PC(npc),
        .PC(PC)
        );
    
    initial begin
        $display("Time\t PC\t npc\t dataout of MEM\t IF_ID_instr\t IF_ID_npc");
        $monitor("%0d\t %0d\t %0d\t $b\t %b\t %0d", $time, PC, npc, dataout, IF_ID_instr, IF_ID_npc);
        #24 $finish;
    end
endmodule
