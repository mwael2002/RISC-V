module Control_decoder(opcode,zero_flag,sign_flag,funct3,Control_signals,ALUop);

input [6:0] opcode;
input zero_flag,sign_flag;
input [2:0] funct3 ;
output [7:0] Control_signals;
output [1:0] ALUop;

wire beq,bnq,blt,PCSrc;
reg required_branch;
reg [9:0] decoder_output;


always@(*)
begin

case(opcode)

7'b0000011:decoder_output=10'b1001010001;
7'b0100011:decoder_output=10'b0011100001;
7'b0110011:decoder_output=10'b1000000101;
7'b0010011:decoder_output=10'b1001000101;
7'b1100011:decoder_output=10'b0100001011;
default:   decoder_output=10'b0000000000;
endcase
end



assign beq=zero_flag;
assign bnq=(~zero_flag);
assign blt=sign_flag;

always@(*)
begin

case(funct3)

3'b000:required_branch=beq;
3'b001:required_branch=bnq;
3'b100:required_branch=blt;
default:required_branch=0;

endcase
end

assign PCSrc=decoder_output[3]&required_branch;

assign Control_signals={decoder_output[9:4],PCSrc,decoder_output[0]};
assign ALUop=decoder_output[2:1];

endmodule


