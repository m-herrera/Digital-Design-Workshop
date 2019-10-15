module deco2(input logic[2:0] color_in, 
			output logic [7:0]vga_r, vga_g, vga_b);

	logic[23:0] color_out;
	
	assign vga_b = color_out[23:16];
	assign vga_g = color_out[15:8];
	assign vga_r = color_out[7:0];
	
	always_comb
		case(color_in)
			3'd0:color_out = 24'h000000;
			3'd1:color_out = 24'h030326;
			3'd2:color_out = 24'h0a0a46;
			3'd3:color_out = 24'h38383a;
			3'd4:color_out = 24'h2d2621;
			3'd5:color_out = 24'h000000;
			3'd6:color_out = 24'h241211;
			3'd7:color_out = 24'h645f57;
			default : color_out = 24'h0;
		endcase


endmodule