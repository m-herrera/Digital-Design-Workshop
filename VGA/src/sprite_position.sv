module sprite_position(input logic x_increment, y_increment, rst,
					   output logic[9:0] posx, posy,
					   output logic[3:0] player_address);


	logic x_rst, y_rst;
	logic[1:0] x_count, y_count;
	
	assign x_rst = (rst || (x_count == 2'b11));
	assign y_rst = (rst || (y_count == 2'b11));
	
	async_counter #(1)posx_counter(x_increment, x_rst, x_count);
	async_counter #(1)posy_counter(y_increment, y_rst, y_count);
	
	
	assign posx = (10'd200 + x_count * 10'd300);
	assign posy = (10'd100 + y_count * 10'd150);
	
	
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


endmodule 