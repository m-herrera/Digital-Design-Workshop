module testing_time #(parameter N=64)
	(input logic [7:0] a, b,
	input logic [3:0] ALUControl,
	input logic clock,
	output logic [N-1:0] out,
	output logic negative, zero, carry_out, overflow);
	
logic [N-1:0] c, d, out1;
logic negative1, zero1, carry_out1, overflow1;
	
always@ (posedge clock)
begin
	c <= {(N/8){a}};
	d <= {(N/8){b}};
end

arithmetic_logic_unit #(N) alit(c,d,ALUControl,out1,negative1, zero1, carry_out1, overflow1);

always@ (negedge clock)
begin
	out <= out1;
	negative <= negative1;
	zero <= zero1;
	carry_out <= carry_out1;
	overflow <= overflow1;
end

endmodule 