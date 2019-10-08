module line_renderer(input logic[9:0] pixelx, pixely, 
					 output logic is_visible);
				 
	
	assign is_visible = ((pixelx >= 10'd352 && pixelx <= 10'd356) || 
						 (pixelx >= 10'd561 && pixelx <= 10'd565) ||
						 (pixely >= 10'd193 && pixely <= 10'd196) ||
						 (pixely >= 10'd354 && pixely <= 10'd356));
	
endmodule 