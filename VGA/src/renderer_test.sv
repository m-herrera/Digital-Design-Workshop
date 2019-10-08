module renderer_test();

	logic clk, rst, blank, sync;
	logic[9:0] pixely, pixelx;
	logic[7:0] vga_r, vga_g, vga_b;
	logic[1:0] player;
	logic[3:0] player_address;
	

	renderer Rend(clk, rst, pixelx, pixely, player, player_address, vga_r, vga_g, vga_b, blank, sync);
	
	initial begin
		player = 2'b10; pixely = 10'd300; pixelx = 10'd300;
		
		#10 pixely = 10'd0; pixelx = 10'd0;
		
		#10 pixely = 10'd790; pixelx = 10'd520;
	
	end

endmodule 