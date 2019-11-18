module iomemory(input logic PS2_CLK, PS2_DAT, clk, rst, write_enable,
					input logic[31:0] address, data_input,
					output logic[31:0] data_output,
					output logic[9:0][31:0] vram_output);

logic ps2_read_ack, vram_we, ram_we;
logic[7:0] received_data;
logic[31:0] ps2_read, ram_read, vram_read, ram_data, vram_data, ram_address, vram_address;
								
assign ps2_read = {'0, received_data};

	
address_decoder AddrDecoder(write_enable, address, ps2_read, ram_read, vram_read, 
data_input, ram_we, vram_we, ps2_read_ack, ram_address, vram_address, ram_data, vram_data, data_output);
				
ps2controller Keyboard(.rst(rst), .read_ack(ps2_read_ack), .PS2_CLK(PS2_CLK), .PS2_DAT(PS2_DAT), .received(), .received_data(received_data));

vram Video(clk, rst, vram_we, vram_address, vram_data, vram_read, vram_output);

ram Memory(clk, rst, ram_we, ram_address, ram_data, ram_read);

endmodule