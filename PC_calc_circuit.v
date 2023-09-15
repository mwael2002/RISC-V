module PC_calc_circuit(clk,areset,load,PCSrc,ImmExt,PC);

input clk,areset,load,PCSrc;
input [31:0] ImmExt;
output reg [31:0] PC;
wire [31:0] PC_Next,PC_Plus4,PC_Target;

MUX_32 MUX_PC(.IN0(PC_Plus4),.IN1(PC_Target),.sel(PCSrc),.OUT(PC_Next));

always@(posedge clk or negedge areset)
begin

if(!areset)
begin

PC<=32'b0;

end

else if(load)
begin

PC<=PC_Next;

end

end



assign PC_Target=PC+ImmExt;
assign PC_Plus4=PC+32'h00000004;

endmodule