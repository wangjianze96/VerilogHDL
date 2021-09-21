module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    parameter start=0, bit1=1, bit2=2, bit3=3, bit4=4, bit5=5, bit6=6, bit7=7, bit8=8, stop=9, idle=10, WAIT=11;
    reg [3:0] state, nextstate;
    reg [7:0] data;
    
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
            bit8: nextstate = in ? stop : WAIT;
            WAIT: nextstate = in ? idle : WAIT;
            stop: nextstate = in ? idle : start;
            idle: nextstate = in ? idle : start;
            default: nextstate = idle;
        endcase
    end
    
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
    
    assign done = (state == stop);
    assign out_byte = done ? data : 8'bx;

    // New: Datapath to latch input bits.

endmodule
