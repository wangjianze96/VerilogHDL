// Priority Encoder
// For example, a 8-bit priority encoder given the input 8'b10010000 would output 3'd4, because bit[4] is first bit that is high.
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @(*) begin
        case (in)
            4'd1: pos = 2'd0;
            4'd2: pos = 2'd1;
            4'd3: pos = 2'd0;
            4'd4: pos = 2'd2;
            4'd5: pos = 2'd0;
            4'd6: pos = 2'd1;
            4'd7: pos = 2'd0;
            4'd8: pos = 2'd3;
            4'd9: pos = 2'd0;
            4'd10: pos = 2'd1;
            4'd11: pos = 2'd0;
            4'd12: pos = 2'd2;
            4'd13: pos = 2'd0;
            4'd14: pos = 2'd1;
            4'd15: pos = 2'd0;
            default: pos = 2'd0;
        endcase
    end
    
endmodule
