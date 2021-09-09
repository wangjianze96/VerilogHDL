// Create a module that implements an XNOR gate.
module top_module( 
    input a, 
    input b, 
    output out );

  // The bitwise-XOR operator is ^. There is no logical-XOR operator.
    assign out = ~(a ^ b);
    
endmodule
