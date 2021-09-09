// Build a combinational circuit with four inputs, in[3:0].
// out_and: output of a 4-input AND gate.
// out_or: output of a 4-input OR gate.
// out_xor: output of a 4-input XOR gate.
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = in[3] & in[2] & in[1] & in[0];
    assign out_or = in[3] | in[2] | in[1] | in[0];
    assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];
    
endmodule
