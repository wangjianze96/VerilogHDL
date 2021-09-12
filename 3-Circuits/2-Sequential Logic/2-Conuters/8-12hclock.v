module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    reg [2:0] enable;
    assign enable = { (ena && (mm == 8'h59) && (ss == 8'h59)), (ena && (ss == 8'h59)), ena };
    clock59 secc (clk, reset, enable[0], ss);
    clock59 minc (clk, reset, enable[1], mm);
    
    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            pm <= 0;
        end
        else begin
            if (enable[2]) begin
                if (hh == 8'h12) begin
                    hh <= 8'h01;
                end
                else if (hh == 8'h11) begin
                    hh <= 8'h12;
                    pm <= ~pm;
                end
                else begin
                    if (hh[3:0] == 4'h9) begin
                        hh[3:0] <= 0;
                        hh[7:4] <= hh[7:4] + 1;
                    end
                    else begin
                        hh[3:0] <= hh[3:0] + 1;
                    end
                end
            end
            else hh <= hh;
        end
    end

endmodule

module clock59(
    input clk, reset, enable,
    output [7:0] q
);
    
    always @(posedge clk) begin
        if (reset) q <= 0;
        else begin
            if (enable) begin
                if (q[3:0] == 4'h9) begin
                    if (q[7:4] == 4'h5) begin
                        q <= 0;
                    end
                    else begin
                        q[7:4] <= q[7:4] + 1;
                        q[3:0] <= 0;
                    end
                end
                else begin
                    q[3:0] <= q[3:0] + 1;
                end
            end
            else q <= q;
        end
    end
    
endmodule
