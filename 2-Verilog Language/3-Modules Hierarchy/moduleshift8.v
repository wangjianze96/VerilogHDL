// https://hdlbits.01xz.net/wiki/File:Module_shift8.png
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] q1, q2, q3;
    my_dff8 dq1 ( clk, d, q1 );
    my_dff8 dq2 ( clk, q1, q2 );
    my_dff8 dq3 ( clk, q2, q3 );
    always @(*) begin	// MUX
        case (sel)
            2'b00: q = d;
            2'b01: q = q1;
            2'b10: q = q2;
            2'b11: q = q3;
            default: q = 8'b00000000;
        endcase
    end
    
endmodule
