// Declare vector: type [upper:lower] vector_name;
// implicit nets - may cause bugs
// Adding `default_nettype none would make the implicit nets error, which makes the bug more visible.
// Build a combinational circuit that splits an input half-word (16 bits, [15:0] ) into lower [7:0] and upper [15:8] bytes.
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    assign { out_hi, out_lo } = { in[15:8], in[7:0] };
    // Or: assign {out_hi, out_lo} = in;
    
endmodule
