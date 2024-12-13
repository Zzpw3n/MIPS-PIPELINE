`timescale 1ns / 1ps
module memory_tb;
    
    reg clk;
    reg [31:0] addr;
    wire [31:0] data;
    
    Memory1 mem(
        .clk(clk),
        .data(data),
        .addr(addr)
        );
        
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        addr = 0;
        #10;
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 3;
        #10;
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 7;
        #10
        $display("Addr: %h, Data: %h", addr, data);
        
        addr = 8;
        #10
        $display("Addr: %h, Data: %h", addr, data);
    end

endmodule