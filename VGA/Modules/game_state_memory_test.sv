module game_state_memory_test();

	logic clk, rst, w_e, win, full;
	
	logic[3:0] player_address, pos;
	logic[1:0] cur_player, player, state;
	
	game_state_memory DUT(clk, rst, w_e, player_address, pos, pos, cur_player, player, state, win, full);

	
	initial begin
		clk = 0; rst = 0; w_e = 0;
		cur_player = 2'b10;
		#10 rst = 1;
		#10 rst = 0;
		
		player_address = 4'd2;
		pos = 4'd1;
		#20 w_e = 1;
		#20 w_e = 0;
		#30 player_address = 4'd1;
		
	
		
	
	end
	
	
	always #5 clk <= !clk;
	
endmodule 