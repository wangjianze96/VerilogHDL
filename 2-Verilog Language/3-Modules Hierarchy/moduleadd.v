// You are given a module add16 that performs a 16-bit addition. 
// Instantiate two of them to create a 32-bit adder. 
// One add16 module computes the lower 16 bits of the addition result, 
// while the second add16 module computes the upper 16 bits of the result, 
// after receiving the carry-out from the first adder.
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cin, cout1, cout;
    add16 addlow ( a[15:0], b[15:0], cin, sum[15:0], cout1 );
    add16 addhigh ( a[31:16], b[31:16], cout1, sum[31:16], cout );
    
endmodule
