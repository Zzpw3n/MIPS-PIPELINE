`timescale 1ns / 1ps
module EXE_ADDER_tb(

    );
    reg [31:0] add_in1;
    reg [31:0] add_in2;
    wire [31:0] add_out;
    
    EXE_ADDER DUT (
        .add_in1(add_in1),
        .add_in2(add_in2),
        .add_out(add_out)
    );
    
    initial begin
        add_in1 = 10;
        add_in2 = 20;
        #10
        add_in1 = 15;
        add_in2 = 25;
        #10
        add_in1 = 4;
        add_in2 = 2;
        #10
        add_in1 = 41;
        add_in2 = 26;
        #10
        $finish;
    end
endmodule
