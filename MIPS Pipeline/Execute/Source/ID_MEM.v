`timescale 1ns / 1ps
module ID_MEM(
    //inputs
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [31:0] adder_out, aluout, readdat2,
    input wire aluzero,
    input wire [4:0] muxout,
    //outputs
    output reg [1:0] wb_ctlout,
    output reg [2:0] m_ctlout,
    output reg [31:0] add_result, alu_result, rdata2out,
    output reg zero,
    output reg [4:0] five_bit_muxout,
    input clk, reset
    );
    
    initial begin
        wb_ctlout = 0;
        m_ctlout = 0;
        add_result = 0;
        alu_result = 0;
        rdata2out = 0;
        zero = 0;
        five_bit_muxout = 0;
    end
    
    always @(posedge clk || reset)
    begin
        if(reset)
        begin
            wb_ctlout <= 0;
            m_ctlout <= 0;
            add_result <= 0;
            alu_result <= 0;
            rdata2out <= 0;
            zero <= 0;
            five_bit_muxout <= 0;
        end
        else
        begin
            wb_ctlout <= ctlwb_out;
            m_ctlout <= ctlm_out;
            add_result <= adder_out;
            alu_result <= aluout;
            rdata2out <= readdat2;
            zero <= aluzero;
            five_bit_muxout <= muxout;
        end
    end
    
endmodule