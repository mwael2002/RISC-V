module Control_unit(opcode,zero_flag,sign_flag,funct3,funct7,
ALUControl,Control_signals);

input [6:0] opcode;
input zero_flag,sign_flag,funct7;
input [2:0] funct3 ;

output [2:0] ALUControl;
output [7:0] Control_signals;

wire [1:0] ALUop;

Control_decoder Control_decoder_0(.opcode(opcode),.zero_flag(zero_flag),.sign_flag(sign_flag),.funct3(funct3),
.Control_signals(Control_signals),.ALUop(ALUop));

ALU_Control ALU_Control_0(.ALUop(ALUop),.op5(opcode[5]),.funct3(funct3),.funct7(funct7),.ALUControl(ALUControl));     

endmodule
