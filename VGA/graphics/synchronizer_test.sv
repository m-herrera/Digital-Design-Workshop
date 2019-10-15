module synchronizer_test();

	logic clk, rst, hsync, vsync;
	logic[9:0] pixelx, pixely;
	
	synchronizer DUT(clk, rst, pixelx, pixely, hsync, vsync);
	
	
	initial 
	begin 
		
		clk = 0; rst = 0;
		#5 rst = 1;
		#5 rst = 0;
	
	end
	
	always #10 clk <= !clk;
	
endmodule 