module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    always @(posedge clk) begin
        Q <= j & ~Q | ~k & Q;
    end
    
endmodule
