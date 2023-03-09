module ALU_32_bit(A,B,opcode,
OUT,zero_flag,sign_flag);

input  [31:0] A,B;
input  [2:0] opcode;
output [31:0] OUT;

output zero_flag,sign_flag;

reg [32:0] R;

always @(*)
begin
case(opcode)
3'b000:R=A+B;
3'b001:R=A<<B;
3'b010:R=A-B;
3'b100:R=A^B;
3'b101:R=A>>B;
3'b110:R=A|B;
3'b111:R=A&B;
default:R=3'b000;

endcase
end

assign OUT=R;
assign zero_flag=~(|R);
assign sign_flag=R[32];

endmodule