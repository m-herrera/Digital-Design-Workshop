module tic_tac_top(input clk, hrd_rst, start, move, select, show_winner,
				   output logic hsync, vsync, blank, sync, vga_clk,
				   output logic[7:0] vga_r, vga_g, vga_b,
				   output logic light);

				   
				   
	logic rst, w_e, winner_s;
	logic[3:0] pos, pos1, pos2, pos3;
	logic[1:0] cur_player, player;
	logic [1:0] state;
	game_controller Game(vga_clk, hrd_rst, !start || hrd_rst, !move, !select, !show_winner, win, full, state, rst, w_e, winner_s, pos, cur_player);
	
				   
	// game state
	logic win, full, mem_rst;
	logic[1:0] winner;
	assign mem_rst = rst;
	game_state_memory Mem(clk, mem_rst, w_e, player_address, pos, cur_player, player, state, winner, pos1, pos2, pos3, win, full);
	
	// manages graphics
	logic[3:0] player_address;
	vga_top Graphics(clk, hrd_rst, rst, winner_s, pos, pos1, pos2, pos3, player, winner, hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b, player_address);
	
	assign light = win;

endmodule 