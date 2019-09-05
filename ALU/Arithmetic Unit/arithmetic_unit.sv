module arithmetic_unit #(parameter N=4)
	(input logic [N-1:0] a, b,
	input logic [1:0] select,
	output logic cout,
	output logic [N-1:0] out);

	logic [N-1:0] sum_out, subtract_out, shift_out;
	logic sum_cout, subtract_cout;
	
	adder #(N) Adder(a, b, 0, sum_out, sum_cout);
	subtract #(N) Subtract(a, b, subtract_out, subtract_cout);
	arithmetic_shift #(N) Shifter(a, b, shift_out);
	mux4 #(N) Mux(sum_out, subtract_out, shift_out, 'z, select, out);
	mux4 #(N) CarryMux(sum_cout, subtract_cout, 'z, 'z, select, cout);
	
endmodule