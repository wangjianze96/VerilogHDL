module top_module( 
    input a,b,c,
    output w,x,y,z );
    // in this practice, the assign statements discribe the connections between things.
    // concatenation operator { signal1, signal2, signal3, ... } would be useful here.
    assign w = a;
    assign { x, y } = { b, b };
    assign z = c;
    
endmodule
