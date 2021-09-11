module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    reg [31:0] q;
    always @(posedge clk) begin
        q <= in;
        if (reset) out <= 0;
        else out <= out | q & ~in;
    end
    
endmodule
