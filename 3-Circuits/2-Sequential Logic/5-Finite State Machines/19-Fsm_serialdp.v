module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    parameter start=0, bit1=1, bit2=2, bit3=3, bit4=4, bit5=5, bit6=6, bit7=7, bit8=8, stop=9, idle=10, WAIT=11, bit9=12;
    reg [3:0] state, nextstate;
    reg [7:0] data;
    reg odd, tempodd;
    reg oddreset;
    
    always @(*) begin
        case (state)
            start: nextstate = bit1;
            bit1: nextstate = bit2;
            bit2: nextstate = bit3;
            bit3: nextstate = bit4;
            bit4: nextstate = bit5;
            bit5: nextstate = bit6;
            bit6: nextstate = bit7;
            bit7: nextstate = bit8;
            bit8: nextstate = bit9;
            bit9: nextstate = in ? stop : WAIT;
            WAIT: nextstate = in ? idle : WAIT;
            stop: nextstate = in ? idle : start;
            idle: nextstate = in ? idle : start;
            default: nextstate = idle;
        endcase
    end
    
    parity oddcheck (clk, (reset | oddreset), in, tempodd);
    
    always @(posedge clk) begin
        if (reset) state <= idle;
        else begin
            state <= nextstate;
            if (nextstate == bit1 || nextstate == bit2 || nextstate == bit3 || nextstate == bit4 || nextstate == bit5 || nextstate == bit6 || nextstate == bit7 || nextstate == bit8) begin
                data <= {in, data[7], data[6], data[5], data[4], data[3], data[2], data[1]};
            end
            else data <= data;
        end
    end
    
    always @(posedge clk) begin
    	if(reset) odd <= 0;
    	else odd <= tempodd; 
    end

    //Only the IDLE-state and STOP-state are likely to enter the RECEIVE-state, 
    //so we need to reset the bits to avoid the previous result's affection.
    always @(posedge clk) begin
        case (nextstate)
			idle : oddreset <= 1;	
			stop : oddreset <= 1;
			default : oddreset <= 0;
		endcase
    end
    
    assign done = (state == stop) && odd;
    assign out_byte = done ? data : 8'bx;


    // New: Add parity checking.

endmodule
