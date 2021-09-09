// You are given a module named mod_a that has 2 outputs and 4 inputs, 
// in that order. You must connect the 6 ports by position to your top-level module's ports 
// out1, out2, a, b, c, and d, in that order.
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a instance1 ( out1, out2, a, b, c, d );
    
endmodule
