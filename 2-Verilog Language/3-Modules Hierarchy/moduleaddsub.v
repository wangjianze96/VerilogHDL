// An adder-subtractor can be built from an adder by optionally negating one of the inputs, 
// which is equivalent to inverting the input then adding 1. 
// https://hdlbits.01xz.net/wiki/File:Module_addsub.png
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cout, cout1;
    add16 addlow ( a[15:0], b[15:0] ^ {16{sub}}, sub, sum[15:0], cout );
    add16 addhigh ( a[31:16], b[31:16] ^ {16{sub}}, cout, sum[31:16], cout1 );
  // 32-bit XOR cannot directly write as b ^ sub, should be b ^ {32{sub}}
    
endmodule
