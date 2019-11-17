module sprite_address_gen #(parameter A=10'd63, B=10'd63, N1=11, N2=5, N3=5)
						   (input logic signed[10:0]pixelx, pixely, posx, posy,
						    output logic[N1:0] address,
						    output logic in_bounds);

	logic[9:0] idx, idy;
						  
	assign idx = pixelx - posx;
	assign idy = pixely - posy;
	
	assign address = {idy[N2:0], idx[N3:0]};

	
	assign in_bounds = (idx <= $signed(A) && pixelx >= posx && 
						idy <= $signed(B) && pixely >= posy);
	
endmodule 
