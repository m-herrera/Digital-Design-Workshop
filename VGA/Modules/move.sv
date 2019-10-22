module move #( parameter N=4,B=9) 
									(input logic clk, rst,
									output logic [N-1:0] posicion);
		logic reset;
		assign reset = (posicion == B || rst);

		counter_GL #(N) Pos(clk, reset, 1'b1, posicion);

endmodule 