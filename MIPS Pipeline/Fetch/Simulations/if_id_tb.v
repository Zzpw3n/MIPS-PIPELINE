`timescale 1ns / 1ps
module if_id_tb;

    reg clk;
    reg [31:0] instr;
    reg [31:0] npc;
    wire [31:0] instrout;
    wire [31:0] npcout;
    
    Latch1 uut (
        .clk(clk),
        .instrout(instrout),
        .npcout(npcout),
        .instr(instr),
        .npc(npc)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
        instr = 32'h00000000;
        npc = 32'h00000000;
        
        #10 instr = 32'hA00000AA; npc = 32'h10000011;  
        #10 instr = 32'h20000022; npc = 32'h30000033;  
        #10 instr = 32'h40000044; npc = 32'h50000055;  
        #10 instr = 32'h60000066; npc = 32'h70000077;  

    end

    initial begin
        $monitor("Time = %0dns, clk = %b, instr = %h, npc = %h, instrout = %h, npcout = %h", $time, clk, instr, npc, instrout, npcout);
    end

endmodule