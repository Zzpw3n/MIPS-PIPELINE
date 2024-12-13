`timescale 1ns / 1ps
module ALU_MAX(
    input [31:0] a, b, //input mux
    input [31:0] A,
    input [2:0] control,
    output reg zero,
    output reg [31:0] result,
    
    input wire sel
    );
    wire [31:0] y;
    
    Mux mux2 (
        .y(y),
        .a(a),
        .b(b),
        .sel(sel)
        );
        
    parameter [2:0] AND = 3'b000;
    parameter [2:0] OR = 3'b001;
    parameter [2:0] add = 3'b010;
    parameter [2:0] sub = 3'b110;
    parameter [2:0] slt = 3'b111;
    
    always@(*)
    begin
    zero = 1'b0;
        result = 32'b0;
        
        case(control)
            AND: begin 
                result = A & y;
                zero = 0;
            end
            OR: begin
                result = A | y;
                zero = 0;
            end
            add: begin 
                result = A + y;
                zero = 0;
            end    
            sub: begin
              result = A - y;
              zero = 0;
            end
            slt: begin
              result = (A < y) ? 32'b1 : 32'b0;
              zero = (A < y) ? 32'b1 : 32'b0;         
            end
         endcase   
    end
    
    
        
    
endmodule