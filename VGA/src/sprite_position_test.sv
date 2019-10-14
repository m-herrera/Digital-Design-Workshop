module sprite_position_test();


	logic x_increment, y_increment, rst;
	logic[9:0] posx, posy;
	logic[3:0] player_address;
	
	sprite_position DUT(x_increment, y_increment, rst, posx, posy, player_address);
	
	initial begin
		
		rst = 1; #10;
		rst = 0;
		x_increment = 1; #10;
		x_increment = 0; #10;
		x_increment = 1; #10;
		x_increment = 0; #10;
		x_increment = 1; #10;
		x_increment = 0; #10;
		x_increment = 1; #10;
		x_increment = 0; #10;
		y_increment = 1; #10;
		y_increment = 0; #10;
		y_increment = 1; #10;
		y_increment = 0; #10;
		y_increment = 1; #10;
		y_increment = 0; #10;
		y_increment = 1; #10;
		y_increment = 0; #10;
	end
	


endmodule 