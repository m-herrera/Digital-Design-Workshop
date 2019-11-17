module timer #(B=30)(input logic clk, reset,
					 output logic timeout, 
					 output logic [4:0] count);
					 
	logic enable, sec_clk;	
	
	clk_divider #(26) Clk(clk, reset, sec_clk);
	
	assign timeout = (count >= 5'd24);
	assign enable = !timeout;
	
	counter_GL #(5) Time(sec_clk, reset, enable, count);

	
endmodule 