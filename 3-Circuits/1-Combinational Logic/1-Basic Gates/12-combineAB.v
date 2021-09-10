module top_module (input x, input y, output z);

    wire a1, a2, b1, b2;
    simA A1 (x, y, a1);
    simB B1 (x, y, b1);
    simA A2 (x, y, a2);
    simB B2 (x, y, b2);
    assign z = (a1 | b1) ^ (a2 & b2);
    
endmodule

module simA (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module simB (input x, input y, output z);
    assign z = ~(x ^ y);
endmodule
