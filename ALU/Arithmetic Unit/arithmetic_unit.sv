module arithmetic_unit #(parameter N=4)
	(input logic [N-1:0] a, b,
	input logic  select,
	output logic cout,
	output logic [N-1:0] out);

	logic [N-1:0] sum_out, subtract_out;
	logic sum_cout, subtract_cout;
	
	adder #(N) Adder(a, b, '0, sum_out, sum_cout);
	subtract #(N) Subtract(a, b, subtract_out, subtract_cout);
	mux2 #(N) Mux(sum_out, subtract_out, select, out);
	mux2 #(1) CarryMux(sum_cout, subtract_cout, select, cout);
	
endmodule