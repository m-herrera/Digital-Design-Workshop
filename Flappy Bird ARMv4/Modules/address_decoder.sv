module address_decoder #(parameter N=32)(input logic write_enable,
													input logic[N-1:0] address, ps2_read, ram_read, vram_read, data_input,
													output logic ram_we, vram_we, ps2_read_ack,
													output logic[N-1:0] ram_address, vram_address, ram_data, vram_data, data_output);
													

always_comb
	case(write_enable)
	0:
		begin
			ram_we = 0;
			vram_we = 0;
			ps2_read_ack = 0;
			ram_data = 'z;
			vram_data = 'z;
			if(address <'h4000)
				begin
					ram_address = address / 4;
					data_output = ram_read;
					vram_address = 'z;
				end
			else if(address >= 'h4000 && address < 'h4004)
				begin
					ram_address = 'z;
					vram_address = 'z;
					data_output = ps2_read;
				end
			else if(address >= 'h4004 && address < 'h4100)
				begin
					ram_address = 'z;
					data_output = 'z;
					vram_address = (address - 'h4004) / 4;
					data_output = vram_read;
				end
			else
				begin
					ram_address = 'z;
					vram_address = 'z;
					data_output = 'z;
				end
		end
	1:
		begin
			data_output = 'z;
			if(address < 'h4000)
				begin
					ram_address = address / 4;
					ram_data = data_input;
					ram_we = 1;
					vram_address = 'z;
					vram_data = 'z;
					vram_we = 0;
					ps2_read_ack = 0;
					
				end
			else if(address >= 'h4000 && address < 'h4004)
				begin
					ram_address = 'z;
					ram_data = 'z;
					ram_we = 0;
					vram_address = 'z;
					vram_data = 'z;
					vram_we = 0;
					ps2_read_ack = 1;
				end
			else if(address >= 'h4004 && address < 'h4100)
				begin
					ram_address = 'z;
					ram_data = 'z;
					ram_we = 0;
					vram_address = (address - 'h4004) / 4;
					vram_data = data_input;
					vram_we = 1;
					ps2_read_ack = 0;
				end
			else
				begin
					ram_address = 'z;
					ram_data = 'z;
					ram_we = 0;
					vram_address = 'z;
					vram_data = 'z;
					vram_we = 0;
					ps2_read_ack = 0;
				end
		end
	endcase
endmodule