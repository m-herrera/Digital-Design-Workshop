module vga_top(input clk, rst, 
			   output logic hsync, vsync, blank, sync, vga_clk,
			   output logic[7:0] vga_r, vga_g, vga_b);
			
	logic clk_25;
	clk_divider Clk(clk, rst, clk_25);

	
	assign vga_clk = clk_25;

	
	logic[9:0] pixelx, pixely;
	synchronizer Sync(clk_25, rst, pixelx, pixely, hsync, vsync);
	
	
	logic[3:0] player_address;
	renderer Rend(clk_25, rst, pixelx, pixely, player_address, vga_r, vga_g, vga_b, blank);
	
	assign sync = 1'b1;
			
endmodule 