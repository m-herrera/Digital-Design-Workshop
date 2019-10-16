module vga_top(input clk, rst, 
			   output logic hsync, vsync, blank, sync, vga_clk,
			   output logic[7:0] vga_r, vga_g, vga_b);

	logic clk_25;
	clk_divider Clk(clk, rst, clk_25);


	assign vga_clk = clk_25;


	logic[9:0] pixelx, pixely;
	synchronizer Sync(clk_25, rst, pixelx, pixely, hsync, vsync);


	logic[3:0] player_address;
	logic[1:0] player;
	always_comb
		case(player_address)
			4'b0000: player = 2'b00;
			4'b0001: player = 2'b01;
			4'b0010: player = 2'b10;
			4'b0011: player = 2'b10;
			4'b0100: player = 2'b10;
			4'b0101: player = 2'b01;
			4'b0110: player = 2'b10;
			4'b0111: player = 2'b01;
			4'b0000: player = 2'b10;
			default: player = 2'b00;
		endcase

	renderer Rend(clk_25, rst, pixelx, pixely, 4'd3, player, player_address, vga_r, vga_g, vga_b, blank, sync);


endmodule
