module game_controller(input clk, hrd_rst, start, move_b, select, win, full,
						input logic [1:0] state,
						output logic rst, w_e,
						output logic[3:0] pos, 
						output logic [1:0] player);

	// selected position from button
	logic[3:0] sel_pos, rand_pos;
	move Mov(move_b, hrd_rst, sel_pos);
	
	
	// timeout 30s
	logic timeout, rst_timer;
	timer Time(clk, rst_timer, timeout);
	
	
	// generate_random if timeout
	logic gen_rand;
	random Rand(clk, rst, gen_rand, rand_pos);
	
	
	// selects random or selected 
	mux_2to1 Pos(sel_pos, rand_pos, timeout, pos);
	
	
	// current player
	logic toggle_player, cur_player;
	FF_T Ply(clk, rst, toggle_player, cur_player);
	
	
	assign player = {1'b0, cur_player} + 2'b1;
	
	
	// check board position availability 
	logic is_busy;
	busy Check(state, is_busy);

	
	game_FSM Game(clk, hrd_rst, start, select, timeout, is_busy, win, full,
					gen_rand, toggle_player, w_e, rst_timer, rst);
	
	

endmodule 