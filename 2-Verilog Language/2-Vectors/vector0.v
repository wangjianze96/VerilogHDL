// Vectors are used to group related signals using one name to make it more convenient to manipulate.
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration

    assign outv = vec;
    assign { o2, o1, o0 } = { vec[2], vec[1], vec[0] }; // // Part-select one bit out of the vector.
    
endmodule
