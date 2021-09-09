// A 32-bit vector can be viewed as containing 4 bytes (bits [31:24], [23:16], etc.). 
// Build a circuit that will reverse the byte ordering of the 4-byte word.
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
    assign { out[31:24], out[23:16], out[15:8], out[7:0] } = { in[7:0], in[15:8], in[23:16], in[31:24] };
    // Part-select can be used on both the left side and right side of an assignment.
endmodule
