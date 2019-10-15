module sprite_visible_logic(input logic in_bounds,
							input logic[2:0] color,
							output logic visible);
							
	
	logic is_background;
	assign is_background = (color == 3'b000);
	
	assign visible = (!is_background && in_bounds);


endmodule 