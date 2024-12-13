`timescale 1ns / 1ps
module ALU_CONTROL_tb(
    );
    reg [5:0] funct;
    reg [1:0] alu_op;
    wire [2:0] select;
    
    ALU_CONTROL uut (
        .funct(funct),
        .alu_op(alu_op),
        .select(select)
    );
    
    initial begin
        funct = 6'b000000;
        alu_op = 2'b00;
        #10
        alu_op = 2'b01;
        #10
        alu_op = 2'b10;
        funct = 6'b100000;
        #10
        funct = 6'b100010;
        #10
        funct = 6'b100100;
        #10
        funct = 6'b100101;
        #10
        funct = 6'b101010;
        #10
        $finish;
    end
endmodule
