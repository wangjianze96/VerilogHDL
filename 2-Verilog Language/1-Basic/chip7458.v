// The 7458 is a chip with four AND gates and two OR gates.
// https://hdlbits.01xz.net/wiki/File:7458.png
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire and1, and2, and3, and4;
    assign and1 = p1a & p1c & p1b;
    assign and2 = p1f & p1e & p1d;
    assign and3 = p2a & p2b;
    assign and4 = p2c & p2d;
    assign { p2y, p1y } = { and3 | and4, and1 | and2 };
    
endmodule
