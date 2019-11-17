module vga_top_test();

	logic clk, rst, rst_clk, hsync, vsync, blank, sync, vga_clk;
	logic[7:0] vga_r, vga_g, vga_b; 

	
	vga_top DUT(clk, rst, rst_clk, hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b);
	
	initial begin
		
		clk = 0; rst = 0; rst_clk = 0;
		#5;
		rst_clk = 1; #15;
		rst_clk = 0;
		#5;
		rst = 1; #15;
		rst = 0;
		
	end
	
	always #5 clk = !clk;  
	
endmodule 