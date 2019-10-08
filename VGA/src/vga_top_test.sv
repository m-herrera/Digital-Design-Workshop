`timescale 10ns/10ns

module vga_top_test();
	
	
	logic clk, rst, blank, sync, hsync, vsync;
	logic [7:0]vga_r, vga_g, vga_b;

	
	vga_top DUT(clk, rst, vga_r, vga_g, vga_b, blank, sync, hsync, vsync);
	
	initial begin
		clk = 0; rst = 1;
		#2 rst = 0;
	end
	
	always
		#1 clk = !clk;

endmodule 