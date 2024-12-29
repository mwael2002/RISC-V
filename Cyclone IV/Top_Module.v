module Top_Module(input clk,areset,output tx);

wire write_e,clk_cpu,clk_uart;
wire [31:0] data_transmit;

pll2 pll_dut(.inclk0(clk),.c0(clk_cpu),.c1(clk_uart));

RISC_V CPU(.clk(clk_cpu),.areset(areset),.write_e(write_e),.data_out(data_transmit));

uart_tx UART0(.clk(clk_uart),.areset(areset),.data(data_transmit[7:0]),.tx_serial(tx),.RE(write_e));


endmodule