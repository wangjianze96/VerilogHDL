module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter [1:0] LEFT = 2'b00, RIGHT = 2'b01, FALL_L = 2'b10, FALL_R = 2'b11;
    reg [1:0] state, nextstate;
    
    always @(*) begin
        case (state)
            LEFT: nextstate = (~ground) ? FALL_L : (bump_left ? RIGHT : LEFT);
            RIGHT: nextstate = (~ground) ? FALL_R : (bump_right ? LEFT : RIGHT);
            FALL_L: nextstate = (~ground) ? FALL_L : LEFT;
            FALL_R: nextstate = (~ground) ? FALL_R : RIGHT;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else state <= nextstate;
    end
    
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_L | state == FALL_R);
    
endmodule
