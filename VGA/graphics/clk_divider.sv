module clk_divider #(parameter N=2)(input in_clk, rst, output logic out_clk);

	logic[N-1:0] count;
	
	counter #(N) Counter(in_clk, rst, 1'b1, count);
	
	assign out_clk = count[N-2];
	
	
endmodule 