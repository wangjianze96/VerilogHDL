module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    reg [2:0] state, nextstate;
    parameter [2:0] A=3'd0,		// s = 000 
    				BL=3'd1, 	// s = 001 and previous state is lower
    				BH=3'd2, 	// s = 001 and previous state is higher
    				CL=3'd3, 	// s = 011 and previous state is lower
    				CH=3'd4, 	// s = 011 and previous state is higher
    				D=3'd5;		// s = 111
    always @(*) begin
        case (state)
            A: nextstate = (s == 3'b001) ? BL : A ;
            BL: nextstate = (s == 3'b011) ? CL : ((s == 3'b000) ? A : BL) ;
            BH: nextstate = (s == 3'b011) ? CL : ((s == 3'b000) ? A : BH) ;
            CL: nextstate = (s == 3'b111) ? D : ((s == 3'b001) ? BH : CL) ;
            CH: nextstate = (s == 3'b111) ? D : ((s == 3'b001) ? BH : CH) ;
            D: nextstate = (s == 3'b111) ? D : CH;
            default: nextstate = 3'bxxx;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
        end
        else begin
            state <= nextstate;
        end
    end
    
    always @(*) begin
        case (state)
            A: {fr3, fr2, fr1, dfr} = 4'b1111;
            BL: {fr3, fr2, fr1, dfr} = 4'b0110;
            BH: {fr3, fr2, fr1, dfr} = 4'b0111;
            CL: {fr3, fr2, fr1, dfr} = 4'b0010;
            CH: {fr3, fr2, fr1, dfr} = 4'b0011;
            D: {fr3, fr2, fr1, dfr} = 4'b0000;
            default: {fr3, fr2, fr1, dfr} = 4'bxxxx;
        endcase
    end
    
endmodule

// Solution
module top_module (
	input clk,
	input reset,
	input [3:1] s,
	output reg fr3,
	output reg fr2,
	output reg fr1,
	output reg dfr
);


	// Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	// We have 6 states here.
	parameter A2=0, B1=1, B2=2, C1=3, C2=4, D1=5;
	reg [2:0] state, next;		// Make sure these are big enough to hold the state encodings.
	


    // Edge-triggered always block (DFFs) for state flip-flops. Synchronous reset.	
	always @(posedge clk) begin
		if (reset) state <= A2;
		else state <= next;
	end



    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
	always@(*) begin
		case (state)
			A2: next = s[1] ? B1 : A2;
			B1: next = s[2] ? C1 : (s[1] ? B1 : A2);
			B2: next = s[2] ? C1 : (s[1] ? B2 : A2);
			C1: next = s[3] ? D1 : (s[2] ? C1 : B2);
			C2: next = s[3] ? D1 : (s[2] ? C2 : B2);
			D1: next = s[3] ? D1 : C2;
			default: next = 'x;
		endcase
	end
	
	
	
	// Combinational output logic. In this problem, a procedural block (combinational always block) 
	// is more convenient. Be careful not to create a latch.
	always@(*) begin
		case (state)
			A2: {fr3, fr2, fr1, dfr} = 4'b1111;
			B1: {fr3, fr2, fr1, dfr} = 4'b0110;
			B2: {fr3, fr2, fr1, dfr} = 4'b0111;
			C1: {fr3, fr2, fr1, dfr} = 4'b0010;
			C2: {fr3, fr2, fr1, dfr} = 4'b0011;
			D1: {fr3, fr2, fr1, dfr} = 4'b0000;
			default: {fr3, fr2, fr1, dfr} = 'x;
		endcase
	end
	
endmodule
