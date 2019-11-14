module address_decoder_test();

logic write_enable, ram_we, vram_we;
logic[31:0] address, ps2_read, ram_read, vram_read, data_input;
logic[31:0] ram_address, vram_address, ram_data, vram_data, data_output;
												
											
address_decoder DUT(write_enable, address, ps2_read, ram_read, vram_read, 
data_input, ram_we, vram_we, ram_address, vram_address, ram_data, vram_data, data_output);


initial begin
	write_enable = 0; address = 32'h4; ps2_read = 32'h666; ram_read = 32'h999; data_input = 32'hF; vram_read = 32'h24A;
	
	#10 address = 32'h4004;
	#10 write_enable = 1;
	#10 address = 32'h400C;
	#10 write_enable = 0;
	#10 address = 32'h4000;
	#10 write_enable = 1;
	
end
endmodule
										