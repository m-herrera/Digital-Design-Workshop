module arithmetic_logic_unit #(parameter N=8)
	(input logic [N-1:0] a, b,
	input logic [1:0] ALUControl,
	output logic [N-1:0] out,
	output logic negative, zero, carry_out, overflow);
	
	logic carryWire;
	logic [N-1:0] arithmetic_out, logic_out;
	
	arithmetic_unit #(N) Arithmetic(a, b, ALUControl[0], carryWire, arithmetic_out);
	logic_unit #(N) Logic(a, b, ALUControl[0], logic_out);
	mux2v2 #(N) MainMux(logic_out, arithmetic_out, ALUControl[1], out);
	negative_flag Negative(out[N-1], ~ALUControl[1], negative);
	zero_flag #(N) Zero(out, zero);
	carry_flag Carry(carryWire, ALUControl, carry_out);
	overflow_flag Overflow(a[N-1], b[N-1], out[N-1], ALUControl, overflow);

endmodule
