module top_module( input in, output out );
    // wire in verilog is directional, signal flows only through one direction.
    // this practice is for "continuous assignment".
    // the ports of a module are also directional, like input and output.
    assign out = in;
  
endmodule
