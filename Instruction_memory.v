module Instruction_memory(Read_Address,Read_Data);


input [31:0] Read_Address;
output [31:0] Read_Data;


reg [31:0] IM [0:63];

initial $readmemh("Fibonacci_program.txt",IM) ;

assign Read_Data = IM[Read_Address >> 2'd2];

endmodule



