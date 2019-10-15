module sprite_renderer(input logic clk, rst,
					   input logic[9:0] pixelx, pixely,
					   input logic[1:0] player,
					   output logic[2:0] color,
					   output logic[3:0] player_address,
					   output logic is_visible);

	
	
	logic[9:0] posx, posy;
	logic x_done, y_done;
	
	sprite_position Pos(x_done, y_done, rst, posx, posy, player_address);

		
	logic in_bounds;
	logic[11:0] address;
	sprite_address_gen Address(pixelx, pixely, posx, posy, address, in_bounds, x_done, y_done);
	
	
	logic[2:0] sprite1_color;
	assign sprite1_color = 3'd6;
	//rom1 sprite2_rom(address, clk, sprite1_color);	
	
	
	always_comb
	
		case (player)
			2'd0 : color = 'd0;
			2'd1 : color = sprite1_color;
			2'd2 : color = sprite1_color;
			default : color = 'd0;
		endcase
	
	
	
	sprite_visible_logic Visible(in_bounds, color, is_visible);


endmodule 