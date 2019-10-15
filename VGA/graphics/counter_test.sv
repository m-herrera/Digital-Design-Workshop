module counter_test();



	logic clk, rst, enable;
	logic[1:0] count;
	
	counter #(2) DUT(clk, rst, enable, count);
	
	initial begin
		
		clk = 0; rst = 0; enable = 1;
		#10 rst = 1;
		#10 rst = 0;
		
	end
	
	always
		#10 clk <= !clk;

endmodule 