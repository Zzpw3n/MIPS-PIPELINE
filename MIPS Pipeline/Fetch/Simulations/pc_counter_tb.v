`timescale 1ns / 1ps
module pc_counter_tb;

    reg clk;
    reg [31:0] npc;
    wire [31:0] PC;
    
    PC_COUNTER uut(
        .PC(PC),
        .npc(npc),
        .clk(clk)
    );
    
    initial begin
        clk = 0; // initial value
        forever #5 clk = ~clk; // clock toggle to allow program to run
    end
    
    initial begin
        npc = 32'h00000000;
        
        #10 npc = 32'h00000004;
        #10 npc = 32'h00000008;
        #10 npc = 32'h0000000C;
        #10 npc = 32'h00000010;
    end
    
    initial begin
        $monitor("Time = %0d, clk = %b, npc = %h, PC = %h", $time, clk, npc, PC);
    end

endmodule