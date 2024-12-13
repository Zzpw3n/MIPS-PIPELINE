`timescale 1ns / 1ps
module MEM(
input [31:0] address, write_data,
    input m_ctlout, zero,
    input [4:0] write_reg_in,
    input [1:0] control_wb_in,
    input memwrite, memread,
    output [31:0] read_data, mem_ALU_result,
    output [1:0] mem_control_wb,
    output [4:0] mem_write_reg,
    output PCSrc,
    input clk, reset
    );
    
    wire [31:0] read_data_in;
    
    D_MEM data_mem (
        .address(address),
        .write_data(write_data),
        .read_data(read_data_in),
        .memwrite(memwrite),
        .memread(memread),
        .clk(clk),
        .reset(reset)      
    );
    
    MEM_WB mem_writeback (
        .control_wb_in(control_wb_in),
        .read_data_in(read_data_in),
        .ALU_result_in(address),
        .write_reg_in(write_reg_in),
        .mem_control_wb(mem_control_wb),
        .read_data(read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_write_reg(mem_write_reg),
        .clk(clk),
        .reset(reset)
    );
    
    assign PCSrc = m_ctlout & zero;
endmodule
