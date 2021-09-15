module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [2:0] sum;
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for(int i=0; i<256; i++) begin  // non-blocking assign, change immediately
                if(i == 0)  //left upper corner
                    sum = q[1] + q[16] + q[17] + q[240] + q[241] + q[15] + q[31] + q[255];
                else if(i == 15)    //right upper corner
                    sum = q[14] + q[16] + q[0] + q[240] + q[254] + q[30] + q[31] + q[255];
                else if(i == 240)   //left bottom corner
                    sum = q[0] + q[15] + q[239] + q[241] + q[1] + q[224] + q[225] + q[255];
                else if(i == 255)   //right bottom corner
                    sum = q[0] + q[15] + q[14] + q[224] + q[238] + q[240] + q[239] + q[254];
                else if(0<i & i<15) //upper bound
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i+239] + q[i+240] + q[i+241];
                else if(i%16 == 0)  //left bound
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i-16] + q[i-15] + q[i+31];
                else if(i%16 == 15) //right bound
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i-17] + q[i-16] + q[i-15] + q[i-31];
                else if(240<i & i<255)  //bottom bound
                    sum = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i-239] + q[i-240] + q[i-241];
                else //non-bound
                    sum = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i+15] + q[i+16] + q[i+17];
          		
                case(sum) //根据邻居数量判断次态
                    2:q[i] <= q[i];
                    3:q[i] <= 1;
                    default:q[i] <= 0;
                endcase
            end
        end
    end
    
endmodule
