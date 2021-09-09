// Declaring a wire for internal connection.
// Create a circuits as https://hdlbits.01xz.net/wiki/File:Wiredecl2.png
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

    wire and1, and2, or3;
    
    assign and1 = a & b;
    assign and2 = c & d;
    assign or3 = and1 | and2;
    assign { out, out_n } = { or3, ~or3 };
    
endmodule
