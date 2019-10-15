module line_renderer(input[9:0] pixelx, pixely, 
					 output logic is_visible);
				 
	
	assign is_visible = ((pixely >= 10'd158 && pixely <= 10'd160) || 
						 (pixely >= 10'd318 && pixely <= 10'd320) ||
						 (pixelx >= 10'd211 && pixelx <= 10'd213) ||
						 (pixelx >= 10'd424 && pixelx <= 10'd426));
	
endmodule 