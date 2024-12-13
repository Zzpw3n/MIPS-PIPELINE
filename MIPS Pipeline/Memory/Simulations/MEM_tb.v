`timescale 1ns / 1ps
module MEM_tb(
    );
    reg [31:0] address, write_data; // DMEM
    reg m_ctlout, zero; // AND Gate
    reg [4:0] write_reg_in; // 5 bit mux
    reg [1:0] control_wb_in;
    reg memwrite, memread; // DMEM
    wire [31:0] read_data, mem_ALU_result;
    wire [1:0] mem_control_wb;
    wire [4:0] mem_write_reg;
    wire PCSrc;
    reg clk, reset;
    
    MEM uut (
        .address(address),
        .write_data(write_data),
        .m_ctlout(m_ctlout),
        .zero(zero),
        .write_reg_in(write_reg_in),
        .control_wb_in(control_wb_in),
        .memwrite(memwrite),
        .memread(memread),
        .read_data(read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_control_wb(mem_control_wb),
        .mem_write_reg(mem_write_reg),
        .PCSrc(PCSrc),
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
        control_wb_in = 2'b00;
        write_reg_in = 5'b00110;
        m_ctlout = 1;
        zero = 0;
        #10
        memwrite = 0;
        memread = 1;
        zero = 1;
        #10
        memread = 0;
        memwrite = 1;
        address = 32'h000000B;
        write_data = 32'h001111;
        control_wb_in = 2'b01; 
        write_reg_in = 5'b00111;
        #10
        memwrite = 0;
        memread = 1;
        m_ctlout = 0;
        #10
        reset = 1;
        $finish;
    end
endmodule
