module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter [2:0] left = 3'd0, right = 3'd1, fall_l = 3'd2, fall_r = 3'd3, dig_l = 3'd4, dig_r = 3'd5, splat = 3'd6;
    reg [2:0] state, nextstate;
    reg [7:0] count; // set a larger number otherwise it will overflow
    
    always @(*) begin
        case (state)
            left: nextstate = (~ground) ? fall_l : ( (dig) ? dig_l : ( (bump_left) ? right : left ) );
            right: nextstate = (~ground) ? fall_r : ( (dig) ? dig_r : ( (bump_right) ? left : right ) );
            fall_l: nextstate = (~ground) ? fall_l : ( (count > 19) ? splat : left );
            fall_r: nextstate = (~ground) ? fall_r : ( (count > 19) ? splat : right );
            dig_l: nextstate = (~ground) ? fall_l : dig_l;
            dig_r: nextstate = (~ground) ? fall_r : dig_r;
            splat: nextstate = splat;
            default: nextstate = 3'bxxx;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= left;
        else begin
            if (state == fall_l | state == fall_r) begin
                count <= count + 1;
                state <= nextstate;
            end
            else begin
                state <= nextstate;
                count <= 0;
            end
        end
    end
    
    assign walk_left = (state == left);
    assign walk_right = (state == right);
    assign aaah = (state == fall_l | state == fall_r);
    assign digging = (state == dig_l | state == dig_r);
    
endmodule
