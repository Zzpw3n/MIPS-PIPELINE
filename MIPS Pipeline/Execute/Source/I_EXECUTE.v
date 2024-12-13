`timescale 1ns / 1ps
module I_EXECUTE(
    input [1:0] ctlwb_out,
    output [1:0] wb_ctlout,
    input [2:0] ctlm_out,
    output [2:0] m_ctlout,
    
    input [1:0] ALUop, //decode
    input RegDst, //decode
    input ALUSrc, //decode
    input [4:0] instrout_1511, instrout_2016,
    
    output [4:0] five_bit_muxout,
    output zero,
    output [31:0] rdata2out, alu_result, add_result,
    
    input [31:0] s_extendout,
    input [31:0] rdata1out,
    input [31:0] readdat2,
    input [31:0] npcout,
    input clk, reset
    );
    
    // adder wires
    wire [31:0] adder_out;
    
    EXE_ADDER adder (
        .add_in1(npcout),
        .add_in2(s_extendout),
        .add_out(adder_out)
    );
    
    ALU_CONTROL alu_control (
        .funct(s_extendout[5:0]),
        .alu_op(ALUop),
        .select(sel)
    );
    
    // ALU wires
    wire [2:0] sel;
    wire aluzero;
    wire [31:0] aluout;
    
    ALU_MAX alu_mux (
        .a(rdata2out),
        .b(s_extendout),
        .A(rdata1out),
        .sel(ALUSrc),
        .zero(aluzero),
        .result(aluout),
        .control(sel)
    );
    
    // bottom mux wires
    wire [4:0] muxout;
    
    BOTTOM_MUX b_mux (
        .a(instrout_2016),
        .b(instrout_1511),
        .sel(RegDst),
        .y(muxout)
    );
    
    ID_MEM id_mem (
       .ctlwb_out(ctlwb_out),
       .ctlm_out(ctlm_out),
       .adder_out(adder_out),
       .aluout(aluout),
       .readdat2(readdat2),
       .aluzero(aluzero),
       .muxout(muxout),
       .wb_ctlout(wb_ctlout),
       .m_ctlout(m_ctlout),
       .add_result(add_result),
       .alu_result(alu_result),
       .rdata2out(rdata2out),
       .zero(zero),
       .five_bit_muxout(five_bit_muxout),
       .clk(clk),
       .reset(reset) 
    );
    
endmodule
