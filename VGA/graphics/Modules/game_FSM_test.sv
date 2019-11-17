module game_FSM_test();

	logic clk, hrd_rst, start, select, timeout, is_busy, win, full,
					gen_rand, toggle_player, w_e, rst_timer, rst;
	
	logic[2:0] state;
					
	game_FSM DUT(clk, hrd_rst, start, select, timeout, is_busy, win, full,
					gen_rand, toggle_player, w_e, rst_timer, rst, state);
	
	
	initial begin 
		
		clk = 0; hrd_rst = 0; start = 0; select = 0; timeout = 0;
		is_busy = 0; win = 0; full = 0;
		
		#30 start = 1;
		#10 start = 0;
		
		#30 select = 1;
		#10 select = 0;
		
		#10 is_busy = 1;
		#30 select = 1;
		#10 select = 0;
		
		
	end

	
	always #5 clk = !clk;
	
endmodule 