module winner_background(input[9:0] pixelx, pixely, 
						 input[3:0] pos1, pos2, pos3, 
						 output logic is_visible);

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
			4'b0000 : if (pos1 == 4'd0 || pos2 == 4'd0 || pos3 == 4'd0) is_visible = 1'b1; else is_visible = 1'b0;
			4'b0001 : if (pos1 == 4'd1 || pos2 == 4'd1 || pos3 == 4'd1) is_visible = 1'b1; else is_visible = 1'b0;
			4'b0010 : if (pos1 == 4'd2 || pos2 == 4'd2 || pos3 == 4'd2) is_visible = 1'b1; else is_visible = 1'b0;
			4'b0100 : if (pos1 == 4'd3 || pos2 == 4'd3 || pos3 == 4'd3) is_visible = 1'b1; else is_visible = 1'b0;
			4'b0101 : if (pos1 == 4'd4 || pos2 == 4'd4 || pos3 == 4'd4) is_visible = 1'b1; else is_visible = 1'b0;
			4'b0110 : if (pos1 == 4'd5 || pos2 == 4'd5 || pos3 == 4'd5) is_visible = 1'b1; else is_visible = 1'b0;
			4'b1000 : if (pos1 == 4'd6 || pos2 == 4'd6 || pos3 == 4'd6) is_visible = 1'b1; else is_visible = 1'b0;
			4'b1001 : if (pos1 == 4'd7 || pos2 == 4'd7 || pos3 == 4'd7) is_visible = 1'b1; else is_visible = 1'b0;
			4'b1010 : if (pos1 == 4'd8 || pos2 == 4'd8 || pos3 == 4'd8) is_visible = 1'b1; else is_visible = 1'b0;
			default : is_visible = 1'b0;
			
		endcase
		

endmodule 