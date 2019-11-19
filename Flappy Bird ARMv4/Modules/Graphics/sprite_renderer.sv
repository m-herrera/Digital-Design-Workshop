module sprite_renderer(input logic clk, rst,
					   input logic[10:0] pixelx, pixely,
					   input logic[10:0] posx1, posy1, posx2, posy2, posx3, posy3, posx4, posy4, posx5, posy5, 
					   output logic[23:0] out_color);


	logic in_bounds, in_bounds2, in_bounds3, in_bounds4, in_bounds5;
	logic[11:0] address;
	logic[14:0] address2, address3, address4, address5, addressUP, addressDOWN;
	
	sprite_address_gen Address(pixelx, pixely, posx1, posy1, address, in_bounds);
	
	sprite_address_gen #(10'd128, 10'd256, 14, 7, 6) Address1(pixelx, pixely, posx2, posy2, address2, in_bounds2);
	sprite_address_gen #(10'd128, 10'd256, 14, 7, 6) Address2(pixelx, pixely, posx3, posy3, address3, in_bounds3);
	
	sprite_address_gen #(10'd128, 10'd256, 14, 7, 6) Address3(pixelx, pixely, posx4, posy4, address4, in_bounds4);
	sprite_address_gen #(10'd128, 10'd256, 14, 7, 6) Address4(pixelx, pixely, posx5, posy5, address5, in_bounds5);

	always_comb
	begin
		if (in_bounds2)
			addressUP = address2;
		else if (in_bounds3)
			addressUP = address3;
		else
			addressUP = 'd0;
		if (in_bounds4)
			addressDOWN = address4;
		else if (in_bounds5)
			addressDOWN = address5;
		else
			addressDOWN = 'd0;
	end
	
	logic[2:0] flappy_color, UPcolor, DOWNcolor;
//	assign flappy_color = 'd1;
//	assign UPcolor = 'd2;
//	assign DOWNcolor = 'd3;
	rom Sprite1_rom(address, clk, flappy_color);
	rom2 Sprite2_rom(addressUP, clk, UPcolor);
	rom3 Sprite3_rom(addressDOWN, clk, DOWNcolor);

	
	
	logic[23:0] flappy_full_color, UP_full_color, DOWN_full_color;
	
	deco1 Deco_sprite1(flappy_color, flappy_full_color);
	deco2 Deco_sprite2(UPcolor, UP_full_color);
	deco2 Deco_sprite3(DOWNcolor, DOWN_full_color);
	

	logic is_visible, is_visible2, is_visible3;
	sprite_visible_logic Visible(in_bounds, flappy_color, is_visible);
	sprite_visible_logic Visible2(in_bounds2 || in_bounds3, UPcolor, is_visible2);
	sprite_visible_logic Visible3(in_bounds4 || in_bounds5, DOWNcolor, is_visible3);
	

	
	always_comb
		if (is_visible)
			out_color = flappy_full_color;
		else if(is_visible2)
			out_color = UP_full_color;
		else if (is_visible3)
			out_color = DOWN_full_color;
		else
			out_color = 'h03fcdb;
		

endmodule
