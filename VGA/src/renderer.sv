
module renderer(input clk, rst,
				input [9:0] pixelx, pixely,
				//input logic[1:0] player,
				//output logic[3:0] player_address,
				output logic [7:0]vga_r, vga_g, vga_b,
				output logic blank, sync);

	assign sync = 1'b1;

	assign blank = (pixelx >= 10'd143 && 
					pixelx <= 10'd778 && 
					pixely >= 10'd035 && 
					pixely <= 10'd515);
					
	//assign vga_r = 8'd220;
	//assign vga_g = 8'd22;
	//assign vga_b = 8'd22;
	
	
	logic[2:0] background_color, line_color, sprite_color, selection_color, output_color;
	
	assign background_color = 3'd0;
	assign line_color = 3'd1;
	assign selection_color = 3'd1;
	assign sprite_color = 3'd1;
	
	
	logic line_visible, sprite_visible, selection_visible;
	assign selection_visible = 1'b0;
	assign sprite_visible = 1'b0;
	
	line_renderer Lines(pixelx, pixely, line_visible);
						
	/*
	sprite_renderer Sprite(clk, rst, pixelx, pixely, player, sprite_color,
							player_address, sprite_visible);
	*/					   
	mux4_1 Mux(background_color, line_color, sprite_color, selection_color,
			   {line_visible, sprite_visible, selection_visible}, output_color);
	
	deco Deco(output_color, vga_r, vga_g, vga_b);
	
endmodule 