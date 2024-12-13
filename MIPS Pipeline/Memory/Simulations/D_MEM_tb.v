`timescale 1ns / 1ps
module D_MEM_tb(

    );
    
    reg clk, reset;
    reg [31:0] address, write_data;
    reg memwrite, memread;
    wire [31:0] read_data;
    
    D_MEM uut (
        .address(address),
        .write_data(write_data),
        .memwrite(memwrite),
        .memread(memread),
        .read_data(read_data),
        .clk(clk),
        .reset(reset)
    );
    
    always begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
       reset = 0;
       address = 32'h000000A; 
       memwrite = 1;
       write_data = 32'h001100;
       #10
       memwrite = 0;
       memread = 1; 
       #10
       memread = 0;
       memwrite = 1;
       address = 32'h000000B;
       write_data = 32'h001111;
       #10
       memwrite = 0;
       memread = 1;
       #10
       reset = 1;
       $finish;
    end
endmodule
