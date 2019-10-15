module game_state_memory(input logic clk, reset, we,
						 input logic[3:0] r_addr, w_addr,r_addr2,
						 input logic[1:0] data_in,
						 output logic[1:0] data_out,data_out2,output logic win);
						 
	logic[1:0] memory [8:0];
	
	always_comb
	begin
		data_out = memory[r_addr];
		data_out2= memory[r_addr2];
		if( (memory[0] == 'b01 & memory[1] == 'b01 & memory[2] == 'b01) ||
		(memory[0] == 'b10 & memory[1] == 'b10 & memory[2] == 'b10) ||
		(memory[3] == 'b01 & memory[4] == 'b01 & memory[5] == 'b01) ||
		(memory[3] == 'b10 & memory[4] == 'b10 & memory[5] == 'b10) ||
		(memory[6] == 'b01 & memory[7] == 'b01 & memory[8] == 'b01) ||
		(memory[6] == 'b10 & memory[7] == 'b10 & memory[8] == 'b10) ||
		(memory[0] == 'b01 & memory[4] == 'b01 & memory[8] == 'b01) ||
		(memory[0] == 'b10 & memory[4] == 'b10 & memory[8] == 'b10) ||
		(memory[2] == 'b01 & memory[4] == 'b01 & memory[6] == 'b01) ||
		(memory[2] == 'b10 & memory[4] == 'b10 & memory[6] == 'b10) )
		win<=1;
		else
		win<=0;
		end
	
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