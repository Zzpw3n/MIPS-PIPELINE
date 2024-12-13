`timescale 1ns / 1ps
module MEM_WB_tb(

    );
    reg [1:0] control_wb_in;
    reg [31:0] read_data_in, ALU_result_in;
    reg [4:0] write_reg_in;
    wire [1:0] mem_control_wb;
    wire [31:0] read_data, mem_ALU_result;
    wire [4:0] mem_write_reg;
    reg clk, reset;
    
    MEM_WB mem_wb (
        .control_wb_in(control_wb_in),
        .read_data_in(read_data_in),
        .ALU_result_in(ALU_result_in),
        .write_reg_in(write_reg_in),
        .mem_control_wb(mem_control_wb),
        .read_data(read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_write_reg(mem_write_reg),
        .clk(clk),
        .reset(reset)
    );
    
    always begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
       reset = 0;
       control_wb_in = 2'b00;
       read_data_in = 32'h0000011;
       ALU_result_in = 32'h0000011;
       write_reg_in = 5'b00110;
       #10
       control_wb_in = 2'b01;
       read_data_in = 32'h0000012;
       ALU_result_in = 32'h0000013;
       write_reg_in = 5'b00111;
       #10
       control_wb_in = 2'b11;
       read_data_in = 32'h0000015;
       ALU_result_in = 32'h0000020;
       write_reg_in = 5'b01111;
       #10
       reset = 1;
       $finish;
    end
endmodule