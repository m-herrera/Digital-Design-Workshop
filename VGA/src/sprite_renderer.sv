module sprite_renderer(input logic clk, rst,
					   input logic[9:0] pixelx, pixely,
					   input logic[1:0] player,
					   output logic[2:0] color,
					   output logic[3:0] player_address,
					   output logic is_visible);

	
	
	logic x_rst, y_rst, x_done, y_done;
	logic[1:0] x_count, y_count;
	
	assign x_rst = (rst || (x_count == 2'b11));
	assign y_rst = (rst || (y_count == 2'b11));
	
	counter #(2)posx_counter(x_done, x_rst, 1'b1, x_count);
	counter #(2)posy_counter(y_done, y_rst, 1'b1, y_count);
	
	logic[9:0] posx, posy;
	
	assign posx = (10'd200 + x_count * 10'd200);
	assign posy = (10'd100 + y_count * 10'd100);
	
	
	
	logic in_bounds;
	logic[11:0] address;
	
	sprite_address_gen Address(pixelx, pixely, posx, posy, address, in_bounds, x_done, y_done);
	
	always_comb
		case({y_count,x_count})
			4'b0000 : player_address = 4'd0;
			4'b0001 : player_address = 4'd1;
			4'b0010 : player_address = 4'd2;
			4'b0100 : player_address = 4'd3;
			4'b0101 : player_address = 4'd4;
			4'b0110 : player_address = 4'd5;
			4'b1000 : player_address = 4'd6;
			4'b1001 : player_address = 4'd7;
			4'b1010 : player_address = 4'd8;
			default : player_address = 4'd0;
			
		endcase
	
	logic[2:0] sprite1_color, sprite2_color;

	rom1 sprite1_rom(.address (address),
				     .clock (clk),
				     .q (sprite1_color));	
				   
	rom1 sprite2_rom(.address (address),
				     .clock (clk),
				     .q (sprite2_color));	
	
	
	always_comb
	
		case (player)
			2'd0 : color = 'd0;
			2'd1 : color = sprite1_color;
			2'd2 : color = sprite2_color;
			default : color = 'd0;
		endcase
	
	
	
	sprite_visible_logic Visible(in_bounds, color, is_visible);


endmodule 