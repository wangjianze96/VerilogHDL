// The syntax for code inside a procedural block is different from code that is outside.
// Combinational: always @(*)
// Clocked: always @(posedge clk)
// in combinational block, '(*)' is a sensitivity list.
// 
// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    
    assign out_assign = a & b;
    always @(*) out_alwaysblock = a & b;

endmodule
