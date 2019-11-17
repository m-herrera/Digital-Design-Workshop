module ps2controller_test();

logic rst, read_ack, received, PS2_CLK, PS2_DAT;
logic[7:0] received_data;

	ps2controller DUT(rst, read_ack, PS2_CLK, PS2_DAT, received, received_data);
	
	
	initial 
	begin 
		
		rst = 0; PS2_CLK = 0; PS2_DAT = 1; read_ack = 0;
		
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
		
		#30 read_ack = 1;
		#20 read_ack = 0;
		
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
endmodule