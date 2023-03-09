module Sign_Extend(Instr,ImmSrc,ImmExt);

input [31:7] Instr;
input [1:0] ImmSrc;
output [31:0] ImmExt;
reg [31:0]  Extend;

always@(*)
begin

case(ImmSrc)


2'b00: Extend={{20{Instr[31]}}, Instr[31:20]};
2'b01: Extend={{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
2'b10: Extend={{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8],{1{1'b0}}};
default: Extend=0;

endcase
end


assign ImmExt=Extend;



endmodule