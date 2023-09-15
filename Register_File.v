module Register_File(Read_Register1,Read_Register2,Write_Register,Write_Data,Write_Enable,clk,
Read_Data1,Read_Data2,areset);


input [4:0] Read_Register1,Read_Register2,Write_Register;
input [31:0] Write_Data;
input Write_Enable,clk,areset;
output [31:0] Read_Data1,Read_Data2;
 
reg [31:0] RF [31:0];

integer i;

always @(posedge clk or negedge areset)
begin

	if (!areset)
	begin
				
	for (i = 0 ; i < 32 ; i = i + 1 )
					
		RF [i] <= 32'b0				;
				
		end


else if(Write_Enable) begin

RF[Write_Register]<=Write_Data;

end
end


assign Read_Data1=RF[Read_Register1];
assign Read_Data2=RF[Read_Register2];

endmodule