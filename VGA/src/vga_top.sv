module vga_top(
	input logic clk, rst,
	output logic [7:0]vga_r, vga_g, vga_b,
	output logic blank, sync, hsync, vsync, vga_clk);
	
	
	logic clk_25;
	assign vga_clk = clk_25;
	
	
	logic[9:0] row;
	logic[9:0] column;
	logic[3:0] player_address;
	
	clock_divider Clk(clk, rst, 2'b10, clk_25);

	
	
	synchronizer #(9) Sync(clk_25, rst, 10'd96, 10'd2, 10'd793, 10'd525, column, row, hsync, vsync);
	
	renderer Rend(clk_25, rst, column, row, player_address, vga_r, vga_g, vga_b, blank, sync);
	
	

endmodule 