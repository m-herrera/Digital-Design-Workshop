module address_decoder_test();

logic write_enable, vsync, ram_we, vram_we, ps2_read_ack, vsync_read_ack;
logic[31:0] address, ps2_read, ram_read, vram_read, data_input;
logic[31:0] ram_address, vram_address, ram_data, vram_data, data_output;
												
											
address_decoder DUT(write_enable, vsync, address, ps2_read, ram_read, vram_read, 
data_input, ram_we, vram_we, ps2_read_ack, vsync_read_ack, ram_address, vram_address, ram_data, vram_data, data_output);


initial begin
	write_enable = 0; address = 32'h4; ps2_read = 32'h666; ram_read = 32'h999; data_input = 32'hF; vram_read = 32'h24A; vsync = 1;
	
	#10 address = 32'h4004;
	#10 write_enable = 1;
	#10 address = 32'h400C;
	#10 write_enable = 0;
	#10 address = 32'h4000;
	#10 write_enable = 1;
	#10 address = 32'h0004;
	#10 write_enable = 0;
	#10 address = 32'h4100;
	#10 write_enable = 1;
	#10 write_enable = 0;
	
end
endmodule
										