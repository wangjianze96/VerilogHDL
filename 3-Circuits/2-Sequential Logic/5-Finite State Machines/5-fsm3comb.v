module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        case (state)
            2'b00: begin
                next_state = in ? B : A;
                out = 0;
            end
            2'b01: begin
                next_state = in ? B : C;
                out = 0;
            end
            2'b10: begin
                next_state = in ? D : A;
                out = 0;
            end
            2'b11: begin
                next_state = in ? B : C;
                out = 1;
            end
        endcase
    end

    // Output logic:  out = f(state) for a Moore state machine

endmodule
