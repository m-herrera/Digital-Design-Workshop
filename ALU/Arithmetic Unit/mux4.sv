module mux4#(parameter N=4)
				(input logic [N-1:0] a,b,c,d,
				input logic [1:0] select,
				output logic [N-1:0] out);
	always_comb
		case(select)
			0: 		out = a;
			1: 		out = b;
			2: 		out = c;
			3: 		out = d;
			default: out = 'z;
		endcase
endmodule	
	