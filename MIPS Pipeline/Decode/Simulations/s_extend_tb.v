`timescale 1ns / 1ps
module s_extend_tb(
    );
    reg [15:0] nextend;
    wire [31:0] extend;
    
    s_extend DUT (
        .nextend(nextend),
        .extend(extend)
    );
    
    initial begin
        nextend = 0;
        #10
        nextend = 6'b110001;
        #10
        $finish;
    end
endmodule
