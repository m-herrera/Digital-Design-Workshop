module sprite_address_gen(input logic [9:0]pixelx, pixely, posx, posy,
						  output logic[11:0] address,
						  output logic in_bounds, x_done, y_done);

	logic[9:0] idx, idy;
						  
	assign idx = pixelx - posx;
	assign idy = pixely - posy;
	
	assign address = {idy[5:0], idx[5:0]};
	
	assign x_done = idx > 10'd63;
	assign y_done = idy > 10'd63;
	
	assign in_bounds = (idx >= 10'd0 &&
						idy >= 10'd0 &&
						!x_done &&
						!y_done);
	
endmodule 
