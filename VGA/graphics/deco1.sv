module deco1(input logic[2:0] color_in, 
			output logic [7:0]vga_r, vga_g, vga_b);

	logic[23:0] color_out;
	
	assign vga_b = color_out[23:16];
	assign vga_g = color_out[15:8];
	assign vga_r = color_out[7:0];
	
	always_comb
		case(color_in)
			3'd0:color_out = 24'hffffff;
			3'd1:color_out = 24'h2098dc;
			3'd2:color_out = 24'h23cee5;
			3'd3:color_out = 24'h14b5e1;
			3'd4:color_out = 24'hffffff;
			3'd5:color_out = 24'h712e23;
			3'd6:color_out = 24'hdbb369;
			3'd7:color_out = 24'h205cd0;
			default : color_out = 24'h0;
		endcase


endmodule 