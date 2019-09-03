module negative_flag (input logic msb, 
					input logic is_arithmetic, 
					output logic is_negative);
		
	assign is_negative = msb & is_arithmetic;
						
endmodule 