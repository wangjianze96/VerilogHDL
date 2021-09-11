module top_module (
    input clk,
    input reset,            // Synchronous reset (active high)
    input [7:0] d,
    output [7:0] q
);

    always @(posedge clk) begin
        q <= {8{~reset}} & d;
    end
    
endmodule
