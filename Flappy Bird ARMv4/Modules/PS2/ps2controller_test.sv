module ps2controller_test();

logic clk, rst, send, received, PS2_CLK, PS2_DAT, start_enable, count_enable, count_rst;
logic[7:0] command, received_data, data;
logic[3:0] count;

	ps2controller DUT(clk, rst, send, command, received, start_enable, count_enable, count_rst, received_data, data, PS2_CLK, PS2_DAT, count);
	
	
	initial 
	begin 
		
		clk = 0; rst = 0; PS2_CLK = 0; PS2_DAT = 1; send = 0; command = '0;
		
		#10 rst = 1;
		#30 rst = 0;
		
		#15 PS2_DAT <= 0;//Inicio
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 1;//Paridad
		#20 PS2_DAT <= 1;//Final
		
		#25 PS2_DAT <= 0;//Inicio
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 1;
		#20 PS2_DAT <= 0;//Paridad
		#20 PS2_DAT <= 1;//Final
		
	
	end
	
	always #10 clk <= !clk;
	always #10 PS2_CLK <= !PS2_CLK;
endmodule