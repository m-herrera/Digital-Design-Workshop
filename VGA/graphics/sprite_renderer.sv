module sprite_renderer(input logic clk, rst,
					   input logic[9:0] pixelx, pixely,
					   input logic[1:0] player,
					   output logic[3:0] player_address,
					   output logic is_visible,
					   output logic[23:0] out_color);



	logic[9:0] posx, posy;

	sprite_position Pos(pixelx, pixely, posx, posy, player_address);


	logic in_bounds;
	logic[11:0] address;
	sprite_address_gen Address(pixelx, pixely, posx, posy, address, in_bounds);


	logic[2:0] sprite1_color, sprite2_color;
	rom1 Sprite1_rom(address, clk, sprite1_color);
	rom2 Sprite2_rom(address, clk, sprite2_color);
	
	logic[23:0] sprite1_full_color;
	logic[23:0] sprite2_full_color;

	
	deco1 Deco_sprite1(sprite1_color, sprite1_full_color);
	
	deco2 Deco_sprite2(sprite2_color, sprite2_full_color);
	
	logic[2:0] background_reference;
	
	always_comb

		case (player)
			2'b00 : begin out_color = 'd0; background_reference = 'd0; end
			2'b01 : begin out_color = sprite1_full_color; background_reference = sprite1_color; end
			2'b10 : begin out_color = sprite2_full_color; background_reference = sprite2_color; end
			default : begin out_color = 'd0; background_reference = 'd0; end
		endcase
	

	sprite_visible_logic Visible(in_bounds, background_reference, is_visible);


endmodule
