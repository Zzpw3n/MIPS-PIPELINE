`timescale 1ns / 1ps
module PIPELINE_tb(
    );
    reg clk, reset;
    
    PIPELINE dut (
        .clk(clk),
        .reset(reset)
    );
    
    always begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 0;
        #20
        reset = 1;
        $finish;
    end
endmodule
