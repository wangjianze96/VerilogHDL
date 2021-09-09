// Concatenation replications
// example: {5{1'b1}} - 5'b11111
// example: {2{a,b,c}} - {a,b,c,a,b,c}
module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
    assign out = { {24{in[7]}}, in }; // remember to use {} for the replicated bits.

endmodule
