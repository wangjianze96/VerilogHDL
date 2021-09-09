module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] incout;
    genvar i;
    generate
        for ( i = 0; i < $bits(a)/4; i++ ) begin : bcd_ripple
            if (i == 0) begin
                bcd_fadd bdcd100 ( a[4*i+3:4*i], b[4*i+3:4*i], cin, incout[i], sum[4*i+3:4*i] );
            end
            else begin
                bcd_fadd bdcd100 ( a[4*i+3:4*i], b[4*i+3:4*i], incout[i-1], incout[i], sum[4*i+3:4*i] );
            end
        end
    endgenerate
    assign cout = incout[99];
    
endmodule
