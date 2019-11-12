module arithmetic_shift#(parameter N=4)
				(input signed [N-1:0] a,
				input logic [N-1:0] shamnt,
				output signed [N-1:0] out);
	assign out = a >>> shamnt;
endmodule	
	
				