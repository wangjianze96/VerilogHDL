module top_module (
    input clk,
    input d,
    output q
);

    reg [1:0] m;
    always @(posedge clk) begin
        m[0] <= d;
    end
    always @(negedge clk) begin
        m[1] <= d;
    end
    assign q = clk ? m[0] : m[1];
    
endmodule

// from solotion
module top_module (
    input clk,
    input d,
    output q
);

    reg [1:0] m;
    always @(posedge clk) begin
        m[0] <= d;
    end
    always @(negedge clk) begin
        m[1] <= d;
    end
    assign q = clk ? m[0] : m[1];
    
endmodule
