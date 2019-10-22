module tic_tac_top(input clk, hrd_rst, start, move, select, 
				   output logic hsync, vsync, blank, sync, vga_clk,
				   output logic[7:0] vga_r, vga_g, vga_b,
				   output logic light);

				   
				   
	logic rst, w_e;
	logic[3:0] pos;
	logic[1:0] cur_player, player;
	logic [1:0] state;
	game_controller Game(clk, hrd_rst, !start, !move, !select, win, full, state, rst, w_e, pos, cur_player);
	
				   
	// game state
	logic win, full;
	game_state_memory Mem(clk, rst, w_e, player_address, pos, pos, cur_player, player, state, win, full);
	
	// manages graphics
	logic[3:0] player_address;
	vga_top Graphics(clk, hrd_rst, pos, player, hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b, player_address);
	
	assign light = !select;

endmodule 