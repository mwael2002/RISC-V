module Instruction_memory(Read_Address,Read_Data);


input [31:0] Read_Address;
output [31:0] Read_Data;


reg [31:0] IM [0:63];

initial begin
  $readmemh("Fibonacci_program.txt",IM) ;
end
  
  assign Read_Data = IM[Read_Address[31:2]];

endmodule



