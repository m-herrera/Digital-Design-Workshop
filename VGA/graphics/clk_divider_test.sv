module clk_divider_test();


	logic clk_in, clk_out, rst;
	
	clk_divider DUT(clk_in, rst, clk_out);
	
	
	initial begin
		
		clk_in = 0; rst = 0;
		#5 rst = 1;
		#5 rst = 0;
		
	end
	
	always
		#10 clk_in <= !clk_in;
	
endmodule  