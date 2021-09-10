module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    // simple way: assign sum = x + y;
    wire [2:0] cout;
    fa fa1 (x[0], y[0], 0, cout[0], sum[0]);
    fa fa2 (x[1], y[1], cout[0], cout[1], sum[1]);
    fa fa3 (x[2], y[2], cout[1], cout[2], sum[2]);
    fa fa4 (x[3], y[3], cout[2], sum[4], sum[3]);
    
endmodule

module fa (
    input a, b, cin,
    output cout, sum
);
    
    assign sum = a ^ b ^ cin;
    assign cout = a & b | a & cin | b & cin;
    
endmodule
