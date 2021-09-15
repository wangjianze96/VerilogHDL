module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    wire q1, q2, q3;
    always @(posedge clk) begin
        if (~resetn) begin
            q1 <= 0;
            q2 <= 0;
            q3 <= 0;
            out <= 0;
        end
        else begin
            q1 <= in;
            q2 <= q1;
            q3 <= q2;
            out <= q3;
        end
    end
    
endmodule

// Solution
module top_module (
	input clk,
	input resetn,
	input in,
	output out
);

	reg [3:0] sr;
	
	// Create a shift register named sr. It shifts in "in".
	always @(posedge clk) begin
		if (~resetn)		// Synchronous active-low reset
			sr <= 0;
		else 
			sr <= {sr[2:0], in};
	end
	
	assign out = sr[3];		// Output the final bit (sr[3])

endmodule
