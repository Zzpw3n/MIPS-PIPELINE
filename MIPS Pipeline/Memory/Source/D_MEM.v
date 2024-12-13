`timescale 1ns / 1ps
module D_MEM(
    input [31:0] address, write_data,
    output reg [31:0] read_data,
    input memwrite, memread,
    input clk, reset
    );
    
    reg [31:0] DMEM[0:255];
    
    integer i;
    always@(posedge clk)
    begin
        if(reset)
        begin
            read_data <= 0;
            for (i = 0; i < 32; i = i + 1)
            begin
                DMEM[i] = 0;
            end
        end    
        else
        begin
            if(memwrite && memread)
            begin
                DMEM[address] <= write_data;
            end
            else if (memwrite)
                DMEM[address] <= write_data;
            else if (memread)
                read_data <= DMEM[address];    
        end    
    end
endmodule
