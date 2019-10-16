module renderer(input clk, rst,
				input logic [9:0] pixelx, pixely,
				input logic [3:0] sel_position,
				input logic [1:0] player,
				output logic [3:0] player_address,
				output logic [7:0]vga_r, vga_g, vga_b,
				output logic blank, sync);
	
	
	assign blank = (pixely <  480) && (pixelx < 640);
	
	assign sync = 1'b1;
	
	
	
	logic[23:0] background_color, line_color, sprite_color, selection_color, output_color;
	
	logic is_line_visible, is_sprite_visible, is_selection_visible;
	
	line_renderer Lines(pixelx, pixely, is_line_visible, line_color);
						
	sprite_renderer Sprite(clk, rst, pixelx, pixely, player, player_address, is_sprite_visible, sprite_color);
	
	cursor_renderer Cursor(pixelx, pixely, sel_position, is_selection_visible, selection_color);
	
	
	
	assign background_color = {8'd165, 8'd196, 8'd212};
	
	
	altered_mux4to1(is_selection_visible, is_sprite_visible, is_line_visible,
					selection_color, sprite_color, line_color, background_color,
					output_color);
			
	
	assign vga_r = output_color[23:16];
	assign vga_g = output_color[15:8 ];
	assign vga_b = output_color[ 7:0 ];
	
endmodule 