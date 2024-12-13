`timescale 1ns / 1ps
module ALU_MAX_tb(
    );
    reg [31:0] a, b;
    reg [31:0] A;
    reg sel;
    wire zero;
    wire [31:0] result;
    reg [2:0] control;
    
    ALU_MAX uut (
        .a(a),
        .b(b),
        .A(A),
        .sel(sel),
        .zero(zero),
        .result(result),
        .control(control)
    );
    
    initial begin
        a = 32'b1100;
        b = 32'b0011;
        A = 32'b1100;
        sel = 0;
        control = 3'b000;
        #10
        sel = 1;
        #10
        control = 3'b001;
        sel = 0;
        #10
        sel = 1;
        control = 3'b010;
        #10
        control = 3'b110;
        #10
        A = 32'b0000;
        sel = 0;
        control = 3'b111;
        #10
        sel = 1;
        #10
        $finish;
    end
endmodule
