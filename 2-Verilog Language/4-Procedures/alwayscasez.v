// Priority encoder with casez
// There is also a similar casex that treats both x and z as don't-care. I don't see much purpose to using it over casez.
// The digit ? is a synonym for z. so 2'bz0 is the same as 2'b?0
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );

    always @(*) begin
        casez (in)
            8'bzzzzzzz1: pos = 3'd0;
            8'bzzzzzz1z: pos = 3'd1;
            8'bzzzzz1zz: pos = 3'd2;
            8'bzzzz1zzz: pos = 3'd3;
            8'bzzz1zzzz: pos = 3'd4;
            8'bzz1zzzzz: pos = 3'd5;
            8'bz1zzzzzz: pos = 3'd6;
            8'b1zzzzzzz: pos = 3'd7;
            default: pos = 3'd0;
        endcase
    end
    
endmodule
