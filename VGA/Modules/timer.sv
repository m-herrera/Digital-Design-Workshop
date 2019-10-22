module timer #(B=30)(input logic clk, reset,
					 output logic timeout);
					 
	logic enable, sec_clk;
	logic [4:0] count;
	
	
	clk_divider #(27) Clk(clk, 1'b0, sec_clk);
	
	assign timeout = (count >= B);
	assign enable = !timeout;
	
	counter_GL #(5) Time(sec_clk, reset, enable, count);

	
endmodule 