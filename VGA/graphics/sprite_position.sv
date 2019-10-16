module sprite_position(input logic[9:0] pixelx, pixely, 
					   output logic[9:0] posx, posy,
					   output logic[3:0] player_address);
	
	
	logic[1:0] x_index, y_index;
	
	always_comb
	begin
		if(pixelx <= 210)
			x_index = 2'b00;
		else if(pixelx <= 423)
			x_index = 2'b01;
		else
			x_index = 2'b10;
		
		if(pixely <= 157)
			y_index = 2'b00;
		else if(pixely <= 317)
			y_index = 2'b01;
		else
			y_index = 2'b10;
	
	end
	
	always_comb
		case({y_index,x_index})
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
		
	assign posx = (10'd73 + x_index * 10'd210);
	assign posy = (10'd47 + y_index * 10'd158);


endmodule 