// Build a circuit that has two 3-bit inputs that computes:
// the bitwise-OR of the two vectors, 
// the logical-OR of the two vectors, 
// and the inverse (NOT) of both vectors (inverse of b in the upper half of out_not).
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
    assign out_not = { ~b, ~a };
    
endmodule
