module renderer(input clk, rst, menu, winner_s,
				input logic [9:0] pixelx, pixely,
				input logic [3:0] sel_position, pos1, pos2, pos3,
				input logic [1:0] player, winner,
				input logic [4:0] _time,
				output logic [3:0] player_address,
				output logic [7:0]vga_r, vga_g, vga_b,
				output logic blank, sync);
	
	
	assign blank = (pixely <  480) && (pixelx < 640);
	
	assign sync = 1'b1;
	
	
	
	logic[23:0] background_color, line_color, sprite_color, selection_color, time_color, output_color;
	
	logic is_line_visible, is_sprite_visible, is_selection_visible, is_winner_visible, is_time_visible;
	
	line_renderer Lines(pixelx, pixely, is_line_visible, line_color);
					
	logic[3:0] address;
	logic[1:0] render_player;
	
	assign address = player_address;
	always_comb
		if(address == 4'd4 && winner_s)
			render_player = winner;
		else if (winner_s)
			render_player = 2'b11;
		else
			render_player = player;
	
	sprite_renderer Sprite(clk, rst, pixelx, pixely, render_player, player_address, is_sprite_visible, sprite_color);
	
	cursor_renderer Cursor(pixelx, pixely, sel_position, is_selection_visible, selection_color);
	
	winner_background Winner(pixelx, pixely, pos1, pos2, pos3, is_winner_visible);

	time_renderer Time(pixelx, pixely, _time, is_time_visible);
	
	
	assign time_color = {8'd230, 8'd160, 8'd20}; 
	
	always_comb
		if (is_winner_visible && !winner_s)
			background_color = {8'd165, 8'd245, 8'd180};
		else
			background_color = {8'd165, 8'd196, 8'd212};
			
			
	altered_mux4to1 Mux(menu, is_selection_visible, is_sprite_visible, is_time_visible, is_line_visible,
					selection_color, sprite_color, time_color, line_color, background_color,
					output_color);
			
	
	assign vga_r = output_color[23:16];
	assign vga_g = output_color[15:8 ];
	assign vga_b = output_color[ 7:0 ];
	
endmodule 