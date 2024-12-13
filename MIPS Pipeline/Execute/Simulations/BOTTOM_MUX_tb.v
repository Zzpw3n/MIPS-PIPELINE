`timescale 1ns / 1ps
module BOTTOM_MUX_tb(
    );
    reg [4:0] b;
    reg [4:0] a;
    reg sel;
    wire [4:0] y;
    
    BOTTOM_MUX DUT (
        .b(b),
        .a(a),
        .sel(sel),
        .y(y)
    );
    
    initial begin
        a = 5'b00000;
        b = 5'b11111;
        sel = 0;
        #10
        sel = 1;
        #10
        $finish;
    end
endmodule
