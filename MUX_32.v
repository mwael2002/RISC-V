module MUX_32(IN0,IN1,sel,OUT);

input [31:0] IN0,IN1;
input sel;
output [31:0] OUT;

assign OUT=(sel)?IN1:IN0;

endmodule 