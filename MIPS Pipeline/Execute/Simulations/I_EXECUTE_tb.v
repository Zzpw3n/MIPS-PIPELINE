`timescale 1ns / 1ps
module I_EXECUTE_tb(
    );
    reg [1:0] ctlwb_out;
    wire [1:0] wb_ctlout;
    reg [2:0] ctlm_out;
    wire [2:0] m_ctlout;
    reg [1:0] ALUop;
    reg RegDst;
    reg ALUSrc;
    reg [4:0] instrout_1511, instrout_2016;
    wire [4:0] five_bit_muxout;
    wire zero;
    wire [31:0] rdata2out, alu_result, add_result;
    reg [31:0] s_extendout, rdata1out, readdat2, npcout;
    reg clk, reset;
    
    I_EXECUTE uut (
        .ctlwb_out(ctlwb_out),
        .wb_ctlout(wb_ctlout),
        .ctlm_out(ctlm_out),
        .m_ctlout(m_ctlout),
        .ALUop(ALUop),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .instrout_1511(instrout_1511),
        .instrout_2016(instrout_2016),
        .five_bit_muxout(five_bit_muxout),
        .zero(zero),
        .rdata2out(rdata2out),
        .alu_result(alu_result),
        .add_result(add_result),
        .s_extendout(s_extendout),
        .rdata1out(rdata1out),
        .readdat2(readdat2),
        .npcout(npcout),
        .clk(clk),
        .reset(reset)
    );
    
    always begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        reset = 0;
        ctlwb_out = 2'b10;
        ctlm_out = 2'b01;
        ALUop = 2'b10;
        npcout = 32'b001100;
        s_extendout = 32'b10100000;
        readdat2 = 32'b1111;
        rdata1out = 32'b1010;
        instrout_1511 = 5'b11011;
        instrout_2016 = 5'b00100;
        RegDst = 0;
        ALUSrc = 0;
        #10
        RegDst = 1;
        #10
        ALUSrc = 1;
        #10
        ALUSrc = 0;
        s_extendout = 32'b10101010;
        rdata1out = 32'b0000;
        readdat2 = 32'b1111;
        #10
        $finish;
    end
endmodule
