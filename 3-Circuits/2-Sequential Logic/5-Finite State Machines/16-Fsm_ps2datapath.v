module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
	parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, nextstate;
    reg [23:0] data;
    // State transition logic (combinational)
    always @(*) begin
        case (state)
            A: nextstate = in[3] ? B : A;
            B: nextstate = C;
            C: nextstate = D;
            D: nextstate = in[3] ? B : A;
            default: nextstate = 0;
        endcase
    end
    
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) state <= A;
        else begin
            state <= nextstate;
        end
    end
 
    // Output logic
    assign done = (state == D);
    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
        if (reset) data <= 24'b0;
        else data <= {data[15:8], data[7:0], in};
    end
    
    assign out_bytes = done ? data : {24{1'bx}};

endmodule
