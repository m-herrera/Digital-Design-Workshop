module sprite_address_gen(input logic [9:0]pixelx, pixely, posx, posy,
						  output logic[11:0] address,
						  output logic in_bounds);

	logic[9:0] idx, idy;
						  
	assign idx = pixelx - posx;
	assign idy = pixely - posy;
	
	assign address = {idy[5:0], idx[5:0]};

	
	assign in_bounds = ($signed(idx) <= $signed(10'd63) && pixelx >= posx && 
						$signed(idy) <= $signed(10'd63) && pixely >= posy);
	
endmodule 
