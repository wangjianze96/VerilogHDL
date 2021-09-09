// carry-select adder
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout, cout1, cout2;
    wire [15:0] sum1, sum2;
    add16 addlow ( a[15:0], b[15:0], 0, sum[15:0], cout );
    add16 addhigh0 ( a[31:16], b[31:16], 0, sum1, cout1 );
    add16 addhigh1 ( a[31:16], b[31:16], 1, sum2, cout2 );
    always @(*) begin
        case (cout)
            0: sum[31:16] = sum1;
            1: sum[31:16] = sum2;
        endcase
    end
    
endmodule
