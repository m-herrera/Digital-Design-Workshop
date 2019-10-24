module game_state_memory(input logic clk, reset, we,
						 input logic[3:0] addr1, addr2,
						 input logic[1:0] data_in,
						 output logic[1:0] data_out, data_out2,
						 output logic win, full);
						 
	logic[1:0] memory [8:0];
	
			
	always_ff @(posedge clk, posedge reset)
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
        else if(we)
		begin
			memory[addr2] = data_in;
			
			win = (  //horizontal
					(memory[0] == 'b01 & memory[1] == 'b01 & memory[2] == 'b01) ||
					(memory[0] == 'b10 & memory[1] == 'b10 & memory[2] == 'b10) ||
					(memory[3] == 'b01 & memory[4] == 'b01 & memory[5] == 'b01) ||
					(memory[3] == 'b10 & memory[4] == 'b10 & memory[5] == 'b10) ||
					(memory[6] == 'b01 & memory[7] == 'b01 & memory[8] == 'b01) ||
					(memory[6] == 'b10 & memory[7] == 'b10 & memory[8] == 'b10) ||
					//vertical
					(memory[0] == 'b01 & memory[3] == 'b01 & memory[6] == 'b01) ||
					(memory[0] == 'b10 & memory[3] == 'b10 & memory[6] == 'b10) ||
					(memory[1] == 'b01 & memory[4] == 'b01 & memory[7] == 'b01) ||
					(memory[1] == 'b10 & memory[4] == 'b10 & memory[7] == 'b10) ||
					(memory[2] == 'b01 & memory[5] == 'b01 & memory[8] == 'b01) ||
					(memory[2] == 'b10 & memory[5] == 'b10 & memory[8] == 'b10) ||
					//diagonal
					(memory[0] == 'b01 & memory[4] == 'b01 & memory[8] == 'b01) ||
					(memory[0] == 'b10 & memory[4] == 'b10 & memory[8] == 'b10) ||
					(memory[2] == 'b01 & memory[4] == 'b01 & memory[6] == 'b01) ||
					(memory[2] == 'b10 & memory[4] == 'b10 & memory[6] == 'b10) );
			
			full = ( memory[0] != 'b0 && 
					memory[1] != 'b0 &&
					memory[2] != 'b0 &&
					memory[3] != 'b0 &&
					memory[4] != 'b0 &&
					memory[5] != 'b0 &&
					memory[7] != 'b0 &&
					memory[8] != 'b0);
		end
		else
		begin
			data_out <= memory[addr1];
			data_out2 <= memory[addr2];
			
			win = (  //horizontal
					(memory[0] == 'b01 & memory[1] == 'b01 & memory[2] == 'b01) ||
					(memory[0] == 'b10 & memory[1] == 'b10 & memory[2] == 'b10) ||
					(memory[3] == 'b01 & memory[4] == 'b01 & memory[5] == 'b01) ||
					(memory[3] == 'b10 & memory[4] == 'b10 & memory[5] == 'b10) ||
					(memory[6] == 'b01 & memory[7] == 'b01 & memory[8] == 'b01) ||
					(memory[6] == 'b10 & memory[7] == 'b10 & memory[8] == 'b10) ||
					//vertical
					(memory[0] == 'b01 & memory[3] == 'b01 & memory[6] == 'b01) ||
					(memory[0] == 'b10 & memory[3] == 'b10 & memory[6] == 'b10) ||
					(memory[1] == 'b01 & memory[4] == 'b01 & memory[7] == 'b01) ||
					(memory[1] == 'b10 & memory[4] == 'b10 & memory[7] == 'b10) ||
					(memory[2] == 'b01 & memory[5] == 'b01 & memory[8] == 'b01) ||
					(memory[2] == 'b10 & memory[5] == 'b10 & memory[8] == 'b10) ||
					//diagonal
					(memory[0] == 'b01 & memory[4] == 'b01 & memory[8] == 'b01) ||
					(memory[0] == 'b10 & memory[4] == 'b10 & memory[8] == 'b10) ||
					(memory[2] == 'b01 & memory[4] == 'b01 & memory[6] == 'b01) ||
					(memory[2] == 'b10 & memory[4] == 'b10 & memory[6] == 'b10) );
			
			full = ( memory[0] != 'b0 && 
					memory[1] != 'b0 &&
					memory[2] != 'b0 &&
					memory[3] != 'b0 &&
					memory[4] != 'b0 &&
					memory[5] != 'b0 &&
					memory[7] != 'b0 &&
					memory[8] != 'b0);
			
		end
			
	
endmodule 