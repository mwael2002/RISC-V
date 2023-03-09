module Register_File(Read_Register1,Read_Register2,Write_Register,Write_Data,Write_Enable,clk,areset,
Read_Data1,Read_Data2);


input [4:0] Read_Register1,Read_Register2,Write_Register;
input [31:0] Write_Data;
input Write_Enable,clk,areset;
output [31:0] Read_Data1,Read_Data2;
 
reg [31:0] RF [0:31];


integer counter;

always @(posedge clk or negedge areset)
begin

if(!areset)
begin
for(counter=0;counter<32;counter=counter+1)
begin

RF[counter]<=0;

end
end
else if(Write_Enable)
begin
if(Write_Register!=0)
begin
RF[Write_Register]<=Write_Data;
end
end

end


assign Read_Data1=RF[Read_Register1];
assign Read_Data2=RF[Read_Register2];

endmodule