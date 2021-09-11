module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        q <= (reset | q == 4'd9) ? 0 : q + 1;
    end
    
endmodule
