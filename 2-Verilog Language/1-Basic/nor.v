// Create a module that implements a NOR gate.
module top_module( 
    input a, 
    input b, 
    output out );

  // Verilog has separate bitwise-OR (|) and logical-OR (||) operators.
    assign out = ~(a | b);
  
endmodule
