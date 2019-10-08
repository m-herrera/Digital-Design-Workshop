module synchronizer #(parameter N=7)
							(input logic clk, rst,
							input logic[N:0] hsync_pos, vsync_pos, line_size, frame_size,
							output logic[N:0] col, row,
							output logic hsync, vsync);

							
							
sync #(N) Hsync(clk, rst, hsync_pos, line_size, col, hsync);

sync #(N) Vsync(!hsync, rst, vsync_pos, frame_size, row, vsync);

endmodule

