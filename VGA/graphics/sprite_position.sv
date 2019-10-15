module sprite_position(input logic x_increment, y_increment, rst,
					   output logic[9:0] posx, posy,
					   output logic[3:0] player_address);


	logic x_rst, y_rst;
	logic[1:0] x_count, y_count;
	
	assign x_rst = (rst || (x_count == 2'b10));
	assign y_rst = (rst || (y_count == 2'b10));
	
	counter #(2) posx_counter(x_increment, x_rst, 1'b1, x_count);
	counter #(2) posy_counter(y_increment, y_rst, 1'b1, y_count);
	
	
	assign posx = (10'd73 + x_count * 10'd210);
	assign posy = (10'd47 + y_count * 10'd158);
	
	
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