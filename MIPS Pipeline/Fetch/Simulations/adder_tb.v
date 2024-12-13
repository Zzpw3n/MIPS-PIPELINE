`timescale 1ns / 1ps
module adder_tb(
    );
    wire [31:0] Next_PC;
    reg [31:0] PC;
    
    Adder1 incr1 (
        .Next_PC(Next_PC),
        .PC(PC)
        );
    
    initial begin
        #10
        PC = 3;
        #10;
        PC = 15;
        #10
        PC = 54;
        #5;
    end
endmodule
