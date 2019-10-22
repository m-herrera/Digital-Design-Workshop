module game_FSM(input clk, hrd_rst, start, select, timeout, busy, win, full,
				output logic gen_rand, toggle_player, w_e, rst_timer, rst,
				output logic[2:0] state);

	logic [2:0] next;

	always_ff @(posedge clk, posedge hrd_rst)
		if(hrd_rst) 
			state <= 'b0;
		else
			state <= next;

			
	always_comb
		case (state)
			3'd0	: next = start ? 'd1 : 'd0; 
			3'd1	: next = 'd2;
			3'd2	: begin if(timeout) next = 'd5; else if (select) next = 'd3; else next = 'd2; end
			3'd3	: next = busy ? 'd2 : 'd4;
			3'd4	: next = (win || full) ? 'd7 : 'd1;
			3'd5	: next = 'd6;
			3'd6	: next = busy ? 'd5 : 'd4;
			3'd7	: next = start ? 'd0 : 'd7;
			default : next = 'd0;
		endcase
		
		
	always_comb
		case(state)
			3'd0	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 1; end
			3'd1	: begin gen_rand = 0; toggle_player = 1; w_e = 0; rst_timer = 1; rst = 0; end
			3'd2	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; end
			3'd3	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; end
			3'd4	: begin gen_rand = 0; toggle_player = 0; w_e = 1; rst_timer = 0; rst = 0; end
			3'd5	: begin gen_rand = 1; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; end
			3'd6	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; end
			3'd7	: begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; end
			default : begin gen_rand = 0; toggle_player = 0; w_e = 0; rst_timer = 0; rst = 0; end
		endcase

endmodule
