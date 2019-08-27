module counter_display_test();
	logic clk;
	logic reset;
	logic [6:0] segments;
	counter_display DUT(reset, clk, segments);

	initial begin
		#10 reset = 0; clk = 0;
	
	end
	
	always #10 clk = ~clk;
	
endmodule 