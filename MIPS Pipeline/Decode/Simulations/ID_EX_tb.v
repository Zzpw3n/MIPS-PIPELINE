`timescale 1ns / 1ps
module ID_EX_tb(
    );
    reg [1:0] ctlwb_out;
	reg [2:0] ctlm_out;
	reg [3:0] ctlex_out;
	reg [31:0] npc;
	reg [31:0] readdat1;
	reg [31:0] readdat2;
	reg [31:0] signext_out;
	reg [4:0] instr_2016;
	reg [4:0] instr_1511;
	
	wire [1:0] wb_ctlout;
	wire [2:0] m_ctlout;
	wire [3:0] ex_ctlout;
	wire [31:0] npcout;
	wire [31:0] rdata1out;
	wire [31:0] rdata2out;
	wire [31:0] s_extendout;
	wire [4:0] instrout_2016;
	wire [4:0] instrout_1511;
	reg clk, rst;
	
	ID_EX DUT (
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
	
	initial begin
	   clk = 1;
	   forever #5 clk = ~clk;
	end
	
	initial begin
	   rst = 0;
	   #10
	   ctlwb_out = 1;
	   ctlm_out = 1;
	   ctlex_out = 2;
	   npc = 10;
	   readdat1 = 15;
	   readdat2 = 20;
	   signext_out = 20;
	   instr_2016 = 2;
	   instr_1511 = 2;
	   rst = 0;
	   #10
	   rst = 1;
	   #10
	   ctlwb_out = 2;
	   ctlm_out = 2;
	   ctlex_out = 1;
	   npc = 5;
	   readdat1 = 10;
	   readdat2 = 25;
	   signext_out = 23;
	   instr_2016 = 1;
	   instr_1511 = 3;
	   rst = 0;
	   #10
	   rst = 0;
	   $finish;
	end
endmodule
