// Full adder equations:
// sum = a ^ b ^ cin
// cout = a&b | a&cin | b&cin
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire coutm, cout;
    add16 addlow ( a[15:0], b[15:0], 0, sum[15:0], coutm );
    add16 addhigh ( a[31:16], b[31:16], coutm, sum[31:16], cout );
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	  assign sum = a ^ b ^ cin;
	  assign cout = a & b | a & cin | b & cin;

endmodule
