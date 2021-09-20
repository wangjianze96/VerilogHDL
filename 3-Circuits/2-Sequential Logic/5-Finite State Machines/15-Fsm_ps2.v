module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, nextstate;
    // State transition logic (combinational)
    always @(*) begin
        case (state)
            A: nextstate = in[3] ? B : A;
            B: nextstate = C;
            C: nextstate = D;
            D: nextstate = in[3] ? B : A;
        endcase
    end
    
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= nextstate;
    end
 
    // Output logic
    assign done = (state == D);

endmodule
