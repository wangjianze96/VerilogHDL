module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    // State transition logic
    parameter A=0, B=1, C=2, D=3;
    reg [3:0] state, next_state;
    
    assign next_state[A] = state[A]&(~in) | state[C]&(~in);
    assign next_state[B] = state[A]&(in) | state[B]&(in) | state[D]&(in);
    assign next_state[C] = state[B]&(~in) | state[D]&(~in);
    assign next_state[D] = state[C]&(in);

    // State flip-flops with asynchronous reset
    always @(posedge clk, posedge areset) begin
        if (areset) state = 4'b0001;
        else state <= next_state;
    end

    // Output logic
    assign out = state[D];

endmodule

// Solution
module top_module (
	input clk,
	input in,
	input areset,
	output out
);

	// Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	parameter A=0, B=1, C=2, D=3;
	reg [1:0] state;		// Make sure state and next are big enough to hold the state encodings.
	reg [1:0] next;
    



    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
    always@(*) begin
		case (state)
			A: next = in ? B : A;
			B: next = in ? B : C;
			C: next = in ? D : A;
			D: next = in ? B : C;
		endcase
    end



    // Edge-triggered always block (DFFs) for state flip-flops. Asynchronous reset.
    always @(posedge clk, posedge areset) begin
		if (areset) state <= A;
        else state <= next;
	end
		

		
	// Combinational output logic. In this problem, an assign statement is the simplest.		
	assign out = (state==D);
	
endmodule
