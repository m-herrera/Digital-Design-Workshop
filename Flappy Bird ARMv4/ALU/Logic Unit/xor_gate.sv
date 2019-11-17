module xor_gate #(parameter N=4)
	(input logic [N-1:0] a, b,
	output logic [N-1:0] z);
assign  z = a ^ b;
endmodule
