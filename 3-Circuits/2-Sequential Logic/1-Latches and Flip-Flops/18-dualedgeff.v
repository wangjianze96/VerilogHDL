module top_module (
    input clk,
    input d,
    output q
);

    reg [1:0] m;
    always @(posedge clk) begin
        m[0] <= d;
    end
    always @(negedge clk) begin
        m[1] <= d;
    end
    assign q = clk ? m[0] : m[1];
    
endmodule

// from solotion
module top_module(
	input clk,
	input d,
	output q);
	
	reg p, n;
	
	// A positive-edge triggered flip-flop
    always @(posedge clk)
        p <= d ^ n;
        
    // A negative-edge triggered flip-flop
    always @(negedge clk)
        n <= d ^ p;
    
    // Why does this work? 
    // After posedge clk, p changes to d^n. Thus q = (p^n) = (d^n^n) = d.
    // After negedge clk, n changes to p^n. Thus q = (p^n) = (p^p^n) = d.
    // At each (positive or negative) clock edge, p and n FFs alternately
    // load a value that will cancel out the other and cause the new value of d to remain.
    assign q = p ^ n;
    
    
	// Can't synthesize this.
	/*always @(posedge clk, negedge clk) begin
		q <= d;
	end*/
    
    
endmodule
