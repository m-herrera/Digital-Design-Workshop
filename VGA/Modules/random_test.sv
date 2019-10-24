`timescale 10ns/1ns


module random_test();

	// timeout 30s
	logic rst_timer, clk, timeout;
	logic[4:0] count;
	timer Time(clk, rst_timer, timeout, count);
	
	initial begin
	
		clk = 0; rst_timer = 0;
		#10 rst_timer = 1;
		#10 rst_timer = 0;
		
	end

	always #10 clk = !clk;
	
endmodule 