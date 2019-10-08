module clock_divider_test();

logic in_clk, out_clk, reset;
logic[1:0] conversion;

clock_divider DUT(in_clk, reset, conversion, out_clk);

	initial begin
		in_clk = 0; reset = 1; conversion = 2'b10;
		#10 reset = 0;
		#100 conversion = 2'b11;
	end
	
	always 
		#5 in_clk = ~in_clk; 
endmodule 