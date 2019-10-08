`timescale 10ns/10ns

module synchronizer_test();

logic clk, rst, hsync, vsync;
logic[9:0] hsync_pos, line_size, vsync_pos, frame_size, col, row;

synchronizer #(9) DUT(clk, rst, hsync_pos, vsync_pos, line_size, frame_size, col, row, hsync, vsync);


initial begin
clk = 0; rst = 0; hsync_pos = 'd96; line_size = 'd800; vsync_pos = 'd2; frame_size = 'd480; 
#8 rst = 1;
#8 rst = 0;
end

always
	#4 clk <= !clk;
  
endmodule
