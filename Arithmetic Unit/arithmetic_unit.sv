module arithmetic_unit#(parameter N=4)
							(input logic [N-1:0] a, b,
							input logic [1:0] select,
							output logic [N-1:0] out);
							
adder #(N) Adder