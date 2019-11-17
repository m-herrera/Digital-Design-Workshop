module game_FSM(input clk, hrd_rst, start, select, show_winner, timeout, busy, win, full,
				output logic gen_rand, toggle_player, w_e, rst_timer, rst, winner);

	logic [3:0] state, next;

	always_ff @(posedge clk, posedge hrd_rst)
		if(hrd_rst) 
			state <= 'b0;
		else
			state <= next;

			
	always_comb
		case (state)
			4'd0	: next = start ? 4'd1 : 4'd0; 
			4'd1	: next = 4'd2;
			4'd2	: begin if(timeout) next = 4'd5; else if (select) next = 4'd3; else next = 4'd2; end
			4'd3	: next = busy ? 4'd2 : 4'd4;
			4'd4	: next = 4'd7;
			4'd5	: next = 4'd6;
			4'd6	: next = busy ? 4'd2 : 4'd4;
			4'd7	: begin if (show_winner && win) next = 4'd8; else if (start) next = 4'd0; else if (win || full) next = 4'd7; else next = 4'b1; end
			4'd8	: next = start ? 4'd0 : 4'd8; 
			default : next = 4'd0;
		endcase
		
		
	always_comb
		case(state)
			4'd0	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 1; winner = 0;end
			4'd1	: begin gen_rand = 0; toggle_player = 1; w_e = 0; rst_timer = 1; rst = 0; winner = 0;end
			4'd2	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; winner = 0;end
			4'd3	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; winner = 0;end
			4'd4	: begin gen_rand = 0; toggle_player = 0; w_e = 1; rst_timer = 0; rst = 0; winner = 0;end
			4'd5	: begin gen_rand = 1; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; winner = 0;end
			4'd6	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; winner = 0;end
			4'd7	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; winner = 0;end
			4'd8	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; winner = 1;end
			default : begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 1; winner = 0;end
		endcase

endmodule
