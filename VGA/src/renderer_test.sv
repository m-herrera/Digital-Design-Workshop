`timescale 10ns/10ns

module renderer_test();

	logic clk, rst, blank, sync;
	logic[7:0] vga_r, vga_g, vga_b;
	logic[3:0] player_address;
	logic[9:0] hsync_pos, line_size, vsync_pos, frame_size, col, row;
	
	synchronizer #(9) DUT(clk, rst, hsync_pos, vsync_pos, line_size, frame_size, col, row, hsync, vsync);

	renderer Rend(clk, rst, col, row, player_address, vga_r, vga_g, vga_b, blank, sync);
	
initial begin
clk = 0; rst = 0; hsync_pos = 'd95; line_size = 'd793; vsync_pos = 'd2; frame_size = 'd480;
#4 rst = 1;
#4 rst = 0;
	
end
	
always
#2 clk <= !clk;

endmodule 