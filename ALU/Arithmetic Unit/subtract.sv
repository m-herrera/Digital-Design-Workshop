module subtract #(parameter N=4)
					(input logic[N-1:0] a, b,
					output logic[N-1:0] s,
					output logic cout);
	adder #(N) Adder(a, ~b, 1, s, cout);
endmodule