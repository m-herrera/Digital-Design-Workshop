module sprite_address_gen_test();

	logic[9:0] pixelx, pixely, posx, posy;
	
	logic[11:0] address;
	
	logic in_bounds, x_done, y_done;

	
	sprite_address_gen DUT(pixelx, pixely, posx, posy, address, in_bounds, x_done, y_done);
	
	initial begin
	
		pixelx = 0;
		pixely = 0;
		posx = 100;
		posy = 100;
	

		#10; pixelx = 120; pixely = 120;
		
		#10; pixelx = 200; pixely = 200;
		 
		
	end

endmodule 