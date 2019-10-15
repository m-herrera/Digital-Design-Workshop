module clk_divider(input in_clk, rst, output logic out_clk);

	logic[1:0] count;
	
	counter #(2) Counter(in_clk, rst, 1'b1, count);
	
	assign out_clk = count[0];
	
	
endmodule 