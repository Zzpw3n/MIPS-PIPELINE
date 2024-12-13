`timescale 1ns / 1ps
module I_DECODE(
    input [31:0] IF_ID_instr, IF_ID_NPC,
    input [31:0] writedata,
    input [4:0] rd,
    input regwrite,
    
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [3:0] ex_ctlout,
    output [31:0] npcout, rdata1out, rdata2out, s_extendout,
    output [4:0] instrout_1511, instrout_2016,
    input clk, 
    input reset
    );
    
    wire [1:0] WB;
    wire [2:0] M;
    wire [3:0] EX;
    wire [31:0] A, B;
    wire [31:0] IF_ID_instr_ext;
    
    control control (
        .opcode(IF_ID_instr[25:21]),
        .EX(EX),
        .M(M),
        .WB(WB)
    );
    
    register register (
        .rs(IF_ID_instr[25:21]),
        .rt(rt),
        .rd(IF_ID_instr[20:16]),
        .writedata(writedata),
        .regwrite(regwrite),
        .A(A),
        .B(B),
        .clk(clk),
        .reset(reset)
    );
    
    s_extend s_extend (
        .nextend(IF_ID_instr[15:0]),
        .extend(IF_ID_instr_ext[31:0])
    );
    
    ID_EX ID_EX (
        .ctlwb_out(WB),
        .ctlm_out(M),
        .ctlex_out(EX),
        .npc(IF_ID_NPC),
        .readdat1(A),
        .readdat2(B),
        .signext_out(IF_ID_instr_ext[31:0]),
        .instr_2016(IF_ID_instr_ext[15:11]),
        .instr_1511(IF_ID_instr_ext[20:16]),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_2016(instrout_2016),
        .instrout_1511(instrout_1511),
        .clk(clk),
        .reset(reset)
    );
    
endmodule
