module Register_File(Read_Register1,Read_Register2,Write_Register,Write_Data,Write_Enable,clk,
Read_Data1,Read_Data2);


input [4:0] Read_Register1,Read_Register2,Write_Register;
input [31:0] Write_Data;
input Write_Enable,clk;
output [31:0] Read_Data1,Read_Data2;
 
reg [31:0] RF [0:31];


integer counter;

always @(posedge clk)
begin

if(Write_Enable)
RF[Write_Register]<=Write_Data;

end


assign Read_Data1=RF[Read_Register1];
assign Read_Data2=RF[Read_Register2];

endmodule
