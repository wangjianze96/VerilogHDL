// small modules compose big modules
// this forms a hierarchy
// The hierarchy of modules is created by instantiating one module inside another.
// The module mod_a is provided for you — you must instantiate it.
module top_module ( input a, input b, output out );

    mod_a instance1 ( a, b, out );
    // mod_a instance1 ( .in1(a), .in2(b), .out(out) ); another method
    
endmodule
