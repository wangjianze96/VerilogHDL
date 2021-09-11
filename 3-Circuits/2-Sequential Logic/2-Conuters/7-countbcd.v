module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    onebcd bcd0 (clk, reset, 1'b1, q[3:0]);
    onebcd bcd1 (clk, reset, ena[1], q[7:4]);
    onebcd bcd2 (clk, reset, ena[2], q[11:8]);
    onebcd bcd3 (clk, reset, ena[3], q[15:12]);
    assign ena[1] = (q[3:0] == 4'b1001);
    assign ena[2] = (q[7:4] == 4'b1001) && (q[3:0] == 4'b1001);
    assign ena[3] = (q[11:8] == 4'b1001) && (q[7:4] == 4'b1001) && (q[3:0] == 4'b1001);
    
endmodule

module onebcd (
    input clk,
    input reset,
    input enable,
    output [3:0] Q
);
    
    always @(posedge clk) begin
        if (reset || (Q == 4'd9 && enable)) Q <= 0;
        else Q <= enable ? Q + 1 : Q;
    end
    
endmodule
