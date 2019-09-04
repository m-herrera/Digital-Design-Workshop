module mux2 
	#(parameter N)
		(input logic[N-1:0] num1,
		input logic[N-1:0] num2,
		input logic select,
		output logic[N-1:0] out);
	
	assign out = select ? num1 : num2;
	
		
endmodule 