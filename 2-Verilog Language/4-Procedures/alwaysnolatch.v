// Simply having a default case is not enough. 
// You must assign a value to all four outputs in all four cases and the default case. 
// This can involve a lot of unnecessary typing. 
// One easy way around this is to assign a "default value" to the outputs before the case statement
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 

    always @(*) begin
        up = 0; down = 0; right = 0; left = 0;
        case (scancode)
            16'he06b: left = 1;
            16'he072: down = 1;
            16'he074: right = 1;
            16'he075: up = 1;
        endcase
    end
    
endmodule
