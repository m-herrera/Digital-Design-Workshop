module vga_top(input clk, rst, rst_clk,
			   input logic[10:0] posx1, posy1, posx2, posy2, posx3, posy3, posx4, posy4, posx5, posy5, 
			   output logic hsync, vsync, blank, sync, vga_clk,
			   output logic[7:0] vga_r, vga_g, vga_b);

	logic clk_25;
	clk_divider Clk(clk, rst_clk, clk_25);


	assign vga_clk = clk_25;


	logic[10:0] pixelx, pixely;
	synchronizer Sync(clk_25, rst, pixelx, pixely, hsync, vsync, blank, sync);


	logic[23:0] out_color;
	sprite_renderer Rend(clk_25, rst, pixelx, pixely, posx1, posy1, posx2, posy2, posx3, posy3, posx4, posy4, posx5, posy5, out_color);//'d100, -'d32, 'd0, 'b1110011100, 'd300, 'd300, 'd300, 'd300, 'd300, 'd300,out_color);//

	assign vga_r = out_color[23:16];
	assign vga_g = out_color[15:8];
	assign vga_b = out_color[7:0];

endmodule
