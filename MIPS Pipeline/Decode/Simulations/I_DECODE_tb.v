`timescale 1ns / 1ps
module I_DECODE_tb(
    
    );
    //inputs
    //reg [31:0] IR;
    reg [31:0] IF_ID_instr, IF_ID_NPC;
    reg regwrite;
    reg [4:0] rd;
    reg [31:0] writedata;
    reg rst, clk;
    //outputs
    wire [31:0] npcout;
    wire [31:0] rdata1out;
	wire [31:0] rdata2out;
	wire [31:0] s_extendout;
	wire [4:0] instrout_2016;
	wire [4:0] instrout_1511;
	wire [3:0] wb_ctlout;
	wire [2:0] m_ctlout;
	wire [1:0] ex_ctlout;
    
    I_DECODE DUT (
        .IF_ID_instr(IF_ID_instr),
        .IF_ID_NPC(IF_ID_NPC),
        .writedata(writedata),
        .rd(rd),
        .regwrite(regwrite),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016),
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst = 0;
        IF_ID_instr = 32'h36E8B6C;
        IF_ID_NPC = 32'h000ABC;
        rd = 5'b11011;
        writedata = 32'b1100; 
        regwrite = 0;
        #10
        regwrite = 1;
        #10
        regwrite = 0;
        rd = 5'b01110;
        writedata = 32'b1110;
        #10
        regwrite = 0;
         IF_ID_instr = 32'h8F6E8B6C; // testing control opcode: lw
        #10
         IF_ID_instr = 32'hAF6E8B6C; // sw
        #10
         IF_ID_instr=  32'h136E8B6C; // beq
        #50
        $finish;
    end
endmodule
