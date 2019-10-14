
module renderer(input clk, rst,
				input logic[9:0] pixelx, pixely,
				//input logic[1:0] player,
				output logic[3:0] player_address,
				output logic [7:0]vga_r, vga_g, vga_b,
				output logic blank, sync);

	assign sync = 1'b1;

	assign blank = (pixelx >= 10'd143 && 
					pixelx <= 10'd778 && 
					pixely >= 10'd035 && 
					pixely <= 10'd515);
					

	
	
	logic[2:0] background_color, line_color, sprite_color, output_color;
	
	assign background_color = 3'd0;
	assign line_color = 3'd5;
	
	
	logic line_visible, sprite_visible;
	//assign selection_visible = 1'b0;
	
	line_renderer Lines(pixelx, pixely, line_visible);
						
	sprite_renderer Sprite(clk, rst, pixelx, pixely, 2'b01, sprite_color, player_address, sprite_visible);
	
	
	always_comb
		if(line_visible)
			output_color = line_color;
		else 
			if (sprite_visible)
				output_color = sprite_color;
			else
				output_color = background_color;
			
	//mux4_1 Mux(background_color, line_color, sprite_color, 3'd0,
		//	   {line_visible, sprite_visible, 1'b0}, output_color);
	
	deco Deco(output_color, vga_r, vga_g, vga_b);
	
endmodule 