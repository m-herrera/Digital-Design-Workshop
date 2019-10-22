module cursor_renderer(input [9:0] pixelx, pixely, 
					   input [3:0] sel_position,
					   output logic is_visible,
					   output [23:0] RGB);

					   	
	logic posx_1, posx_2, posx_3, posy_1, posy_2, posy_3;
	
	assign posx_1 = (pixelx >= 10'd073 && pixelx <= 10'd137);
	assign posx_2 = (pixelx >= 10'd283 && pixelx <= 10'd347);
	assign posx_3 = (pixelx >= 10'd493 && pixelx <= 10'd557);
	
	assign posy_1 = (pixely >= 10'd126 && pixely <= 10'd128);
	assign posy_2 = (pixely >= 10'd284 && pixely <= 10'd286);
	assign posy_3 = (pixely >= 10'd442 && pixely <= 10'd444);
	
	always_comb
		case(sel_position)
			4'd0    : is_visible = posx_1 && posy_1;
			4'd1    : is_visible = posx_2 && posy_1;
			4'd2    : is_visible = posx_3 && posy_1;
			4'd3    : is_visible = posx_1 && posy_2;
			4'd4    : is_visible = posx_2 && posy_2;
			4'd5    : is_visible = posx_3 && posy_2;
			4'd6    : is_visible = posx_1 && posy_3;
			4'd7    : is_visible = posx_2 && posy_3;
			4'd8    : is_visible = posx_3 && posy_3;
			default : is_visible = 1'b0;
		endcase
	
	
	assign RGB = {8'd132, 8'd240, 8'd198};
	
endmodule  