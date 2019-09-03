module zero_flag #(parameter bits = 4)
						(input logic[bits-1:0] number, output logic is_zero);
													
	assign is_zero = number == {bits {1'b0}};
	
endmodule 