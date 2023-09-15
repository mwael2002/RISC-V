module Top_Module(clk_cpu,clk_uart,areset,TX);

input clk_cpu,clk_uart,areset;
output TX;

wire WE_RISC,RE_UART,WE_FIFO,RE_FIFO,clk_cpu,clk_uart,E,F;
wire [7:0] data_transmit,data_fifo_out;


RISC_V CPU(.clk(clk_cpu),.areset(areset),.WE(WE_RISC),.data_out(data_transmit));

	FIFO #(.FIFO_WIDTH(8),.FIFO_DEPTH(1024),.FIFO_ADDRESS_WIDTH(11))FIFO0(
		.din_a(data_transmit), //input [7:0] Data
		.clk_a(clk_cpu), //input WrClk
		.clk_b(clk_uart), //input RdClk
		.wen_a(WE_RISC), //input WrEn
		.ren_b(RE_UART), //input RdEn
		.dout_b(data_fifo_out), //output [7:0] Q
		.empty(E), //output Empty
		.full(F) //output Full
		,.rst(areset)
	);

uart_tx UART0(.clk(clk_uart),.areset(areset),.data(data_fifo_out),.tx_serial(TX),.RE(RE_UART));

assign WE_FIFO=WE_RISC&(~F);
assign RE_FIFO=RE_UART&(~E);

endmodule