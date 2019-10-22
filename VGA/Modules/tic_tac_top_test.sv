module tic_tac_top_test();

	
	logic clk, hrd_rst, start, move, select;
	
	logic rst, w_e;
	logic[3:0] pos;
	logic[1:0] cur_player, player;
	logic [1:0] state;
	
				   
	// game state
	logic win, full;
	logic[3:0] player_address;
	
	
	game_controller Game(clk, hrd_rst, start, move, select, win, full, state, rst, w_e, pos, cur_player);
	game_state_memory Mem(clk, rst, w_e, player_address, pos, pos, cur_player, player, state, win, full);
		
	initial begin
		
		clk = 0; hrd_rst = 0; start  = 0; move = 0; select = 0;
		player_address = 2'b10;
		#10 hrd_rst = 1;
		#10 hrd_rst = 0;
		#10 start = 1;
		#10 start = 0;
		#10 select = 1;
		#10 select = 0;
		
	end
	
	
	always #5 clk = !clk;
	
endmodule 