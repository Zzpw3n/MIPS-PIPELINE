`timescale 1ns / 1ps
module IF_FETCH_tb(

    );
    
    wire [31:0] IF_ID_instr;
    wire [31:0] IF_ID_npc;
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;
    
    I_FETCH dut (
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_npc(IF_ID_npc),
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC)
    );
    
    initial begin
        EX_MEM_PCSrc = 32'd532;
        EX_MEM_NPC = 32'd400;
        #20
        EX_MEM_PCSrc = 32'd0;
        EX_MEM_NPC = 32'd9999;
    end
    
    
endmodule
