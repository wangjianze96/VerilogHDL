// Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. 
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    generate
        for ( i = 0; i < $bits(a); i++ ) begin : block_name // require a name for generate statement
            if (i == 0) begin
                add1 add100 ( a[i], b[i], cin, cout[i], sum[i]);
            end
            else begin
                add1 add100 ( a[i], b[i], cout[i-1], cout[i], sum[i]);
            end
        end
    endgenerate
    
endmodule

module add1 ( input a, input b, input cin, output cout, output sum );
    
    assign sum = a ^ b ^ cin;
    assign cout = a & b | a & cin | b & cin;
    
endmodule
