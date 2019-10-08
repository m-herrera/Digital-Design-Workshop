module game_state_memory(input logic clk, reset, we,
						 input logic[3:0] r_addr, w_addr,
						 input logic[1:0] data_in,
						 output logic[1:0] data_out);
						 
	logic[1:0] memory [8:0];
	
	always_comb
		data_out = memory[r_addr];
	
	always_ff @(posedge clk, posedge reset)
		begin
			if(reset) begin
				memory[0] <= '0;
				memory[1] <= '0;
				memory[2] <= '0;
				memory[3] <= '0;
				memory[4] <= '0;
				memory[5] <= '0;
				memory[6] <= '0;
				memory[7] <= '0;
				memory[8] <= '0;
				end
        else
		  		if(we)
					memory[w_addr] <= data_in;
				else
					memory[w_addr] <= memory[w_addr];
		end	
endmodule 