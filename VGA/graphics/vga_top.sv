module vga_top(input clk, rst, menu, winner_s,
			   input logic [3:0] sel_position, pos1, pos2, pos3,
			   input logic[1:0] player, winner,
			   input logic [4:0] _time,
			   output logic hsync, vsync, blank, sync, vga_clk,
			   output logic[7:0] vga_r, vga_g, vga_b,
			   output logic[3:0] player_address);

	logic clk_25;
	clk_divider Clk(clk, rst, clk_25);


	assign vga_clk = clk_25;


	logic[9:0] pixelx, pixely;
	synchronizer Sync(clk_25, rst, pixelx, pixely, hsync, vsync);


	renderer Rend(clk_25, rst, menu, winner_s, pixelx, pixely, sel_position, pos1, pos2, pos3, player, winner, _time, player_address, vga_r, vga_g, vga_b, blank, sync);


endmodule
