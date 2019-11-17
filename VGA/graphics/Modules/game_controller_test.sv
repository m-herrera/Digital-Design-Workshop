module game_controller_test();
	
	logic clk, hrd_rst, start, move, select, win, full, rst, w_e;
	logic[3:0] pos;
	logic[1:0] cur_player, player;
	logic [1:0] state;
	
	
	
	// selected position from button
	logic[3:0] sel_pos, rand_pos;
	logic timeout, rst_timer;
	logic gen_rand;
	logic toggle_player;
	logic is_busy;

	move Mov(move, hrd_rst, sel_pos);
	
	
	timer Time(clk, rst_timer, timeout);
	
	random Rand(clk, rst, gen_rand, rand_pos);
	
	mux_2to1 Pos(sel_pos, rand_pos, timeout, pos);
	
		
	FF_T Ply(clk, rst, toggle_player, cur_player);
	
	
	assign player = {1'b0, cur_player} + 2'b1;
	
	
	busy Check(state, is_busy);

	
	game_FSM Game(clk, hrd_rst, start, select, timeout, is_busy, win, full,
					gen_rand, toggle_player, w_e, rst_timer, rst);
	
	
	
	initial begin
		win = 0; full = 0; hrd_rst = 0; start = 0; move = 0; select = 0; clk = 0;
		state = 'b0;
		#10 hrd_rst = 1;
		#10 hrd_rst = 0;
		
		#10 start = 1;
		#10 start = 0;
		
		#10 move = 1;
		#10 move = 0;
		#10 move = 1;
		#10 move = 0;
		
		#10 select = 1;
		#10 select = 0;
	
	end
	
	
	always #5 clk = !clk;

endmodule 