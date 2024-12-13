`timescale 1ns / 1ps
module WB_MUX(
    output wire [31:0] wb_data,
    input wire [31:0] mem_read_data, mem_ALU_result,
    input wire memtoreg
    );
    
    Mux wb_mux (
    .a(mem_read_data),
    .b(mem_ALU_result),
    .y(wb_data),
    .sel(memtoreg)
    );
endmodule
