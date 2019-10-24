module timer #(B=30)(input logic clk, reset,
					 output logic timeout);
					 
	logic enable, sec_clk;
	logic [4:0] count;
	
	
	clk_divider #(25) Clk(clk, reset, sec_clk);
	
	assign timeout = (count >= 5'd30);
	assign enable = !timeout;
	
	counter_GL #(5) Time(sec_clk, reset, enable, count);

	
endmodule 