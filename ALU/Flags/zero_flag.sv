module zero_flag #(parameter N = 4)
						(input logic[N-1:0] number, output logic is_zero);
													
	assign is_zero = number == {N {1'b0}};
	
endmodule 