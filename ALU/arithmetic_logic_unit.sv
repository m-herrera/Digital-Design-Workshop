module arithmetic_logic_unit #(parameter N=4)
	(input logic [N-1:0] a, b,
	input logic [3:0] ALUControl,
	output logic [N-1:0] out,
	output logic negative, zero, carry_out, overflow);
	
	logic carryWire;
	logic [N-1:0] arithmetic_out, logic_out;
	
	arithmetic_unit #(N) Arithmetic(a, b, ALUControl[1:0], carryWire, arithmetic_out);
	logic_unit #(N) Logic(a, b, ALUControl[2:0], logic_out);
	mux2 #(N) MainMux(logic_out, arithmetic_out, ALUControl[3], out);
	negative_flag Negative(out[N-1], ALUControl[3], negative);
	zero_flag Zero(out, zero);
	carry_flag Carry(carryWire, ALUControl[2:0], carry_out);
	overflow_flag Overflow(a[N-1], b[N-1], out[N-1], ALUControl[2:0], overflow);

endmodule
