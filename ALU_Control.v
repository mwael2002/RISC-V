module ALU_Control(ALUop,op5,funct3,funct7,ALUControl);

input [1:0] ALUop;
input [2:0] funct3;
input op5,funct7;
output [2:0] ALUControl;

wire op5_funct7;
reg [2:0] sel_10,sel;

assign op5_funct7=funct7&op5;


always@(*)
begin

if(funct3==3'b000)
begin

   if(op5_funct7)
   begin

   sel_10=3'b010;

   end

   else
   begin

   sel_10=3'b000;

   end
   end

else if(funct3==3'b010 || funct3==3'b011)
begin

sel_10=3'b000;

end

else
begin

sel_10=funct3;

end
end


always@(*)
begin

case(ALUop)

2'b00:sel=0;
2'b01:sel=3'b010;
2'b10:sel=sel_10;
default:sel=0;
endcase
end

assign ALUControl=sel;

endmodule