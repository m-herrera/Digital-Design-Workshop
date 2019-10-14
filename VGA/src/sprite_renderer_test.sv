module sprite_renderer_test();
	
	logic clk, rst;
	logic[9:0] pixelx, pixely;
	logic[1:0] player;
	logic[2:0] color;
	logic[3:0] player_address;
	logic is_visible;
	
	sprite_renderer DUT(clk, rst, pixelx, pixely, player, color, player_address, is_visible);
	
	initial begin
	
		clk = 1; rst = 0; player = 'd1;
		#10 rst = 1;
		#10 rst = 0;
		
		pixelx = 'd210;
		pixely = 'd120;
		
		#50 pixelx = 'd300;
		pixely = 'd120;
		
		
		#50 pixelx = 'd450;
		pixely = 'd220;
		
		
	
	end

	
endmodule 