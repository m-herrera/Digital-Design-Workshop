module FF_T(input clk, rst, toggle,
			output logic state);

	always_ff @(posedge clk)
		if (rst)
			state <= 0;
		else if (toggle)
			state <= !state;
		else
			state <= state;

endmodule 