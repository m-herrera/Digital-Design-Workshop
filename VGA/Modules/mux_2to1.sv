module mux_2to1 #(parameter N=4)
		(input [N-1:0] data1, data2,
		 input sel,
		 output logic[N-1:0] data_out);


always_comb
	if(sel)
		data_out = data2;
	else
		data_out = data1;

endmodule
