module subtract #(parameter N=4)
					(input logic[N-1:0] a, b,
					output logic[N-1:0] s,
					output logic cout);
	adderv2 #(N) adderv2(a, ~b, 1'b1, s, cout);
endmodule