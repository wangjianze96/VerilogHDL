module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);

    always @(posedge clk, posedge ar) begin
        q <= ar ? 0 : d;
    end
    
endmodule
