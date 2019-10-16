module test();

	logic[3:0] player_address;
	logic[9:0] posx, posy;
	logic[9:0] pixelx, pixely;
	logic x_done, y_done, rst,clk;
	
	sprite_position Pos(x_done, y_done, rst, posx, posy, player_address);

		
	logic in_bounds;
	logic[11:0] address;
	sprite_address_gen Address(pixelx, pixely, posx, posy, address, in_bounds, x_done, y_done);
	
	async_counter #(10)x(clk,rst ||(pixelx == 800),pixelx);
	async_counter #(10)y((pixelx == 800),rst,pixely); 
	
	
	
	initial begin 
		
		clk = 0;
		rst = 0;
		#10 rst = 1;
		#10 rst = 0;

		
	end
	
	always #10 clk = !clk;
endmodule 