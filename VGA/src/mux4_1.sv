module mux4_1(input logic[2:0] input1, input2, input3, input4,
			  input logic[2:0] sel,
			  output logic[2:0] out);
			  
	always_comb
	case(sel)
		3'b001  : out = input4;
		3'b010  : out = input3;
		3'b100  : out = input2;
		default : out = input1;
	endcase
endmodule 