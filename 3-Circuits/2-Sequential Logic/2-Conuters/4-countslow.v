module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        if (reset) q <= 0;
        else if (q == 9 && slowena) q <= 0;
        else if (~slowena) q <= q;
        else q <= q + 1;
    end
    
endmodule
