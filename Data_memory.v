module Data_memory(Address,Write_Data,Write_Enable,clk,
Read_Data);


input [31:0] Address;
input [31:0] Write_Data;
input Write_Enable,clk;
output [31:0] Read_Data;

reg [31:0] Data_memory [0:63];


always @(posedge clk)
begin

if(Write_Enable)
begin

Data_memory[Address]<=Write_Data;

end

end

assign Read_Data=Data_memory[Address];

endmodule


