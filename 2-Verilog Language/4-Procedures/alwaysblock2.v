// Combinational: always @(*)
// Clocked: always @(posedge clk)
// Build an XOR gate three ways, using an assign statement, 
// a combinational always block, and a clocked always block. 
// Note that the clocked always block produces a different circuit from the other two: There is a flip-flop so the output is delayed.
// In a combinational always block, use blocking assignments. 
// In a clocked always block, use non-blocking assignments.
// https://hdlbits.01xz.net/wiki/File:Alwaysff.png
// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    assign out_assign = a ^ b;
    always @(*) out_always_comb = a ^ b;
    always @(posedge clk) out_always_ff <= a ^ b;
    
endmodule
