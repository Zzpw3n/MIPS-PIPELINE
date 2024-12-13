`timescale 1ns / 1ps
module register_tb(
    );
    reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [31:0] writedata;
	reg regwrite;
	wire [31:0] A;
	wire [31:0] B;
	reg clk;
	reg rst;
	register DUT (
	   .rs(rs),
	   .rt(rt),
	   .rd(rd),
	   .writedata(writedata),
	   .regwrite(regwrite),
	   .A(A),
	   .B(B),
	   .clk(clk),
	   .rst(rst)
	);
	
	initial begin
	   clk = 1;
	   forever #5 clk = ~clk;
	end
	
	initial begin
	   rs = 0;
	   rt = 0;
	   rd = 0;
	   writedata = 0;
	   rst = 0;
	   regwrite = 0;
	   #10
	   rs = 3;
	   rt = 4;
	   rd = 4;
	   writedata = 100;
	   rst = 1;
	   regwrite = 1;
	   #10
	   regwrite = 0;
	   #10
	   regwrite = 1;
	   writedata = 400;
	   rs = 2;
	   rt = 3;
	   rd = 3;
	   #10
	   regwrite = 0;
	   #10
	   regwrite = 1;
	   writedata = 600;
	   rs = 1;
	   rt = 0;
	   rd = 1;
	   #10
	   regwrite = 0;
	   #10
	   regwrite = 1;
	   writedata = 50;
	   rs = 4;
	   rt = 2;
	   rd = 3;
	   #10
	   regwrite = 0;
	   #10
	   regwrite = 1;
	   writedata = 382;
	   rs = 5;
	   rt = 2;
	   rd = 0;
	   
	   $finish;
	end
endmodule
