module top_module (
    input clk,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        q <= (reset || q == 10) ? 1 : q + 1;
    end
    
endmodule
