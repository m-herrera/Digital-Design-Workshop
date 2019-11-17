module position_test();

	logic clk, rst, move_b, timeout, rst_timer, gen_rand;
	logic[3:0] sel_pos, rand_pos, pos;
	
	
	move Mov(move_b, rst, sel_pos);
	
	
	// timeout 30s
	timer Time(clk, rst_timer, timeout);
	
	
	// generate_random if timeout
	random Rand(clk, rst, gen_rand, rand_pos);
	
	
	// selects random or selected 
	mux_2to1 Pos(sel_pos, rand_pos, timeout, pos);
	
	initial begin
		
		clk = 0; rst = 0; move_b = 0; rst_timer = 0;
		gen_rand = 0; 
		
		#10 rst = 1; rst_timer = 1;
		#10 rst = 0; rst_timer = 0;
		#30 gen_rand = 1;
		#10 timeout = 1;
		
	end
	
	
	always #5 clk = !clk;
	

endmodule 