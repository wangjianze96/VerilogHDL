// create a module that implements an AND gate
module top_module( 
    input a, 
    input b, 
    output out );

  // Verilog has separate bitwise-AND (&) and logical-AND (&&) operators.
    assign out = a & b;
    
endmodule
