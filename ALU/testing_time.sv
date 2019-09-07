module testing_time #(parameter N=50)
	(input logic [N-1:0] a, b,
	input logic [3:0] ALUControl,
	input logic clock,
	output logic [N-1:0] out,
	output logic negative, zero, carry_out, overflow);
	
always@ (posedge clock)
begin
c=a;
d=b;
control=ALUControl;
end
arithmetic_logic_unit #(N) alit(c,d,control,out2,negative1, zero1, carry_out1, overflow1);
always@ (posedge ~clock)
begin
out= out2 ;
negative=negative1;
zero=zero1;
carry_out=carry_out1;
overflow=overflow1;
end

endmodule 