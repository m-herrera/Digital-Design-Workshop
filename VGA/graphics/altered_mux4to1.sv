module altered_mux4to1(input sel1, sel2, sel3, sel4, sel5,
		   input[23:0] in1, in2, in3, in4, in5,
		   output logic[23:0] out);

	always_comb
		if(sel1)
			out = in5;
		else if (sel2)
			out = in1;
		else if (sel3)
			out = in2;
		else if (sel4)
			out = in3;
		else if (sel5)
			out = in4;
		else
			out = in5;

endmodule 