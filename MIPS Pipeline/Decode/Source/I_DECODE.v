`timescale 1ns / 1ps
module I_DECODE(
    input clk, rst,
    input wire [5:0] opcode,
    input wire [4:0] rs,
	input wire [4:0] rt,
	input wire [4:0] rd,
	input wire [31:0] writedata,
	input wire regwrite,
	input wire [15:0] nextend,
	input wire [1:0] ctlwb_out,
	input wire [2:0] ctlm_out,
	input wire [3:0] ctlex_out,
	input wire [31:0] npc,
	input wire [31:0] readdat1,
	input wire [31:0] readdat2,
	input wire [31:0] signext_out,
	input wire [4:0] instr_2016,
	input wire [4:0] instr_1511,
	
	output reg [3:0] EX,
	output reg [2:0] M,
	output reg [1:0] WB,
	output reg [31:0] A,
	output reg [31:0] B,
	output reg [31:0] extend,
	output reg [1:0] wb_ctlout,
	output reg [2:0] m_ctlout,
	output reg [3:0] ex_ctlout,
	output reg [31:0] npcout,
	output reg [31:0] rdata1out,
	output reg [31:0] rdata2out,
	output reg [31:0] s_extendout,
	output reg [4:0] instrout_2016,
	output reg [4:0] instrout_1511
    );
    
    control control (
        .opcode(opcode),
        .EX(EX),
        .M(M),
        .WB(WB)
    );
    
    register register (
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .writedata(writedata),
        .regwrite(regwrite),
        .A(A),
        .B(B),
        .clk(clk),
        .rst(rst)
    );
    
    s_extend s_extend (
        .nextend(nextend),
        .extend(extend)
    );
    
    ID_EX ID_EX (
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .ctlex_out(ctlex_out),
        .npc(npc),
        .readdat1(readdat1),
        .readdat2(readdat2),
        .signext_out(signext_out),
        .instr_2016(instr_2016),
        .instr_1511(instr_1511),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_2016(instrout_2016),
        .instrout_1511(instrout_1511)
    );
    
endmodule
