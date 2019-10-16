module altered_mux4to1(input sel1, sel2, sel3,
		   input[23:0] in1, in2, in3, in4,
		   output logic[23:0] out);

	always_comb
		if (sel1)
			out = in1;
		else if (sel2)
			out = in2;
		else if (sel3)
			out = in3;
		else
			out = in4;

endmodule 