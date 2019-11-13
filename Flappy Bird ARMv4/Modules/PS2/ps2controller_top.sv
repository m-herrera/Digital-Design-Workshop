module ps2controller_top(input logic rst, PS2_CLK, PS2_DAT,
								output logic[7:0] received_data,
								output logic received);

logic clk, send, start_enable, count_enable, count_rst;
logic[7:0] command, data;
logic[3:0] count;

	ps2controller DUT(clk, rst, send, command, received, start_enable, count_enable, count_rst, received_data, data, PS2_CLK, PS2_DAT, count);
	
	
assign clk = 0; 
assign send = 0;
assign command = '0;
endmodule