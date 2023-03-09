module RISC_V(clk,areset);

input clk,areset;

wire zero_flag,sign_flag;
wire [31:0] Instr,PC,ImmExt,SrcA,SrcC,SrcB,Result,ALUResult,Read_Data;
wire [2:0] ALUControl;
wire [7:0] Control_signals;



PC_calc_circuit pc_circuit(.clk(clk),.areset(areset),.load(Control_signals[0]),.PCSrc(Control_signals[1]),
.ImmExt(ImmExt),.program_counter(PC));


Instruction_memory ROM(.Read_Address(PC),.Read_Data(Instr));


Control_unit CU(.opcode(Instr[6:0]),.zero_flag(zero_flag),.sign_flag(sign_flag),.funct3(Instr[14:12]),.funct7(Instr[30]),
.ALUControl(ALUControl),.Control_signals(Control_signals));


Register_File RF0(.Read_Register1(Instr[19:15]),.Read_Register2(Instr[24:20]),.Write_Register(Instr[11:7]),
.Write_Data(Result),.Write_Enable(Control_signals[7]),.clk(clk),.areset(areset),
.Read_Data1(SrcA),.Read_Data2(SrcC));


Sign_Extend SE(.Instr(Instr[31:7]),.ImmSrc(Control_signals[6:5]),.ImmExt(ImmExt));

MUX_32 MUX0(.IN0(SrcC),.IN1(ImmExt),.sel(Control_signals[4]),.OUT(SrcB));


ALU_32_bit ALU0(.A(SrcA),.B(SrcB),.opcode(ALUControl),
.OUT(ALUResult),.zero_flag(zero_flag),.sign_flag(sign_flag));

Data_memory RAM(.Address(ALUResult>>2),.Write_Data(SrcC),.Write_Enable(Control_signals[3]),.clk(clk),
.Read_Data(Read_Data));


MUX_32 MUX1(.IN0(ALUResult),.IN1(Read_Data),.sel(Control_signals[2]),.OUT(Result));

endmodule
