module iomemory_test();

	logic PS2_CLK, PS2_DAT, clk, rst, write_enable;
	logic[31:0] address, data_input;
	logic[31:0] data_output;
	logic[9:0][31:0] vram_output;

	iomemory DUT(PS2_CLK, PS2_DAT, clk, rst, write_enable, address, data_input, data_output, vram_output);

	initial begin
		clk = 0; rst = 0; PS2_CLK = 0; PS2_DAT = 1; data_input = 'h25; write_enable = 0; address = 'h0008;
	
		#10 rst = 1;
		#30 rst = 0;
	
		#10 write_enable = 1;
		#20 write_enable = 0;
		#40 address = 32'h4004; data_input = 'h54;
		#10 write_enable = 1;
		#10 write_enable = 0;
		
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
		
		#30 address = 32'h4000;
		#20 write_enable = 1;
		#20 write_enable = 0;
		
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


	always #10 PS2_CLK <= !PS2_CLK;
	always #5 clk <= !clk;
	
endmodule