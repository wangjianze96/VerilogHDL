// Vector indices can be variable, as long as the synthesizer can figure out that the width of the bits being selected is constant. 
// In particular, selecting one bit out of a vector using a variable index will work.
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    assign out = in[sel];
    
endmodule
