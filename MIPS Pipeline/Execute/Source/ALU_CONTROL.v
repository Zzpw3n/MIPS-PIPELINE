`timescale 1ns / 1ps
module ALU_CONTROL(
    input [5:0] funct,
    input [1:0] alu_op,
    output reg [2:0] select
    );
    
    parameter [1:0] lw = 2'b00;
    parameter [1:0] sw = 2'b00;
    parameter [1:0] beq = 2'b01;
    parameter [1:0] RTYPE = 2'b10;
    parameter [5:0] add = 6'b100000;
    parameter [5:0] subtract = 6'b100010;
    parameter [5:0] AND = 6'b100100;
    parameter [5:0] OR = 6'b100101;
    parameter [5:0] slt = 6'b101010;
    
    always @(*)
    begin
        //select <= 3'b000;
        case(alu_op)
            lw: select = 3'b010;
            sw: select = 3'b010;
            beq: select = 3'b110;
            RTYPE: begin
                case(funct)
                    add: select = 3'b010;  
                    subtract: select = 3'b110;
                    AND: select = 3'b000;
                    OR: select = 3'b001;
                    slt: select = 3'b111;
                endcase
            end
            default: select <= 3'b000;
        endcase
     end   
endmodule
    
