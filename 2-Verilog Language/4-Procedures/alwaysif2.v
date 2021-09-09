// Bug fix on latches
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated) begin
           	shut_off_computer = 1;
        end
        else begin
            shut_off_computer = 0;
        end
    end

    always @(*) begin
        if ( ~arrived & ~gas_tank_empty ) begin
            keep_driving = 1;
        end
        else begin
            keep_driving = 0;
        end
    end

endmodule
