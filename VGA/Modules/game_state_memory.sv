module game_state_memory(input logic clk, reset, we,
						 input logic[3:0] addr1, addr2,
						 input logic[1:0] data_in,
						 output logic[1:0] data_out, data_out2,
						 output logic[3:0] pos1, pos2, pos3,
						 output logic win, full);
						 
	logic[1:0] memory [8:0];
	
	logic[1:0] winner;
	
	assign win = winner == 2'b01 || winner == 2'b10;
	
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
			
			if(memory[0] == 'b01 & memory[1] == 'b01 & memory[2] == 'b01)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd1;
				pos3 = 4'd2;
				winner = 'b01;
			end
				
			else if(memory[0] == 'b10 & memory[1] == 'b10 & memory[2] == 'b10)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd1;
				pos3 = 4'd2;
				winner = 'b10;
			end
			else if(memory[3] == 'b01 & memory[4] == 'b01 & memory[5] == 'b01)
			begin 
				pos1 = 4'd3;
				pos2 = 4'd4;
				pos3 = 4'd5;
				winner = 'b01;
			end
			else if(memory[3] == 'b10 & memory[4] == 'b10 & memory[5] == 'b10)
			begin 
				pos1 = 4'd3;
				pos2 = 4'd4;
				pos3 = 4'd5;
				winner = 'b10;
			end
			else if(memory[6] == 'b01 & memory[7] == 'b01 & memory[8] == 'b01)
			begin 
				pos1 = 4'd6;
				pos2 = 4'd7;
				pos3 = 4'd8;
				winner = 'b01;
			end
			else if(memory[6] == 'b10 & memory[7] == 'b10 & memory[8] == 'b10)
			begin 
				pos1 = 4'd6;
				pos2 = 4'd7;
				pos3 = 4'd8;
				winner = 'b10;
			end
			else if(memory[0] == 'b01 & memory[3] == 'b01 & memory[6] == 'b01)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd3;
				pos3 = 4'd6;
				winner = 'b01;
			end
			else if(memory[0] == 'b10 & memory[3] == 'b10 & memory[6] == 'b10)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd3;
				pos3 = 4'd6;
				winner = 'b10;
			end
			else if(memory[1] == 'b01 & memory[4] == 'b01 & memory[7] == 'b01)
			begin 
				pos1 = 4'd1;
				pos2 = 4'd4;
				pos3 = 4'd7;
				winner = 'b01;
			end
			else if(memory[1] == 'b10 & memory[4] == 'b10 & memory[7] == 'b10)
			begin 
				pos1 = 4'd1;
				pos2 = 4'd4;
				pos3 = 4'd7;
				winner = 'b10;
			end
			else if(memory[2] == 'b01 & memory[5] == 'b01 & memory[8] == 'b01)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd5;
				pos3 = 4'd8;
				winner = 'b01;
			end
			else if(memory[2] == 'b10 & memory[5] == 'b10 & memory[8] == 'b10)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd5;
				pos3 = 4'd8;
				winner = 'b10;
			end
			else if(memory[0] == 'b01 & memory[4] == 'b01 & memory[8] == 'b01)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd4;
				pos3 = 4'd8;
				winner = 'b01;
			end
			else if(memory[0] == 'b10 & memory[4] == 'b10 & memory[8] == 'b10)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd4;
				pos3 = 4'd8;
				winner = 'b10;
			end
			else if(memory[2] == 'b01 & memory[4] == 'b01 & memory[6] == 'b01)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd4;
				pos3 = 4'd6;
				winner = 'b01;
			end
			else if(memory[2] == 'b10 & memory[4] == 'b10 & memory[6] == 'b10)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd4;
				pos3 = 4'd6;
				winner = 'b10;
			end
			else
			begin 
				pos1 = 4'd15;
				pos2 = 4'd15;
				pos3 = 4'd15;
				winner = 'b11;
			end
			
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
			
			if(memory[0] == 'b01 & memory[1] == 'b01 & memory[2] == 'b01)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd1;
				pos3 = 4'd2;
				winner = 'b01;
			end
				
			else if(memory[0] == 'b10 & memory[1] == 'b10 & memory[2] == 'b10)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd1;
				pos3 = 4'd2;
				winner = 'b10;
			end
			else if(memory[3] == 'b01 & memory[4] == 'b01 & memory[5] == 'b01)
			begin 
				pos1 = 4'd3;
				pos2 = 4'd4;
				pos3 = 4'd5;
				winner = 'b01;
			end
			else if(memory[3] == 'b10 & memory[4] == 'b10 & memory[5] == 'b10)
			begin 
				pos1 = 4'd3;
				pos2 = 4'd4;
				pos3 = 4'd5;
				winner = 'b10;
			end
			else if(memory[6] == 'b01 & memory[7] == 'b01 & memory[8] == 'b01)
			begin 
				pos1 = 4'd6;
				pos2 = 4'd7;
				pos3 = 4'd8;
				winner = 'b01;
			end
			else if(memory[6] == 'b10 & memory[7] == 'b10 & memory[8] == 'b10)
			begin 
				pos1 = 4'd6;
				pos2 = 4'd7;
				pos3 = 4'd8;
				winner = 'b10;
			end
			else if(memory[0] == 'b01 & memory[3] == 'b01 & memory[6] == 'b01)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd3;
				pos3 = 4'd6;
				winner = 'b01;
			end
			else if(memory[0] == 'b10 & memory[3] == 'b10 & memory[6] == 'b10)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd3;
				pos3 = 4'd6;
				winner = 'b10;
			end
			else if(memory[1] == 'b01 & memory[4] == 'b01 & memory[7] == 'b01)
			begin 
				pos1 = 4'd1;
				pos2 = 4'd4;
				pos3 = 4'd7;
				winner = 'b01;
			end
			else if(memory[1] == 'b10 & memory[4] == 'b10 & memory[7] == 'b10)
			begin 
				pos1 = 4'd1;
				pos2 = 4'd4;
				pos3 = 4'd7;
				winner = 'b10;
			end
			else if(memory[2] == 'b01 & memory[5] == 'b01 & memory[8] == 'b01)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd5;
				pos3 = 4'd8;
				winner = 'b01;
			end
			else if(memory[2] == 'b10 & memory[5] == 'b10 & memory[8] == 'b10)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd5;
				pos3 = 4'd8;
				winner = 'b10;
			end
			else if(memory[0] == 'b01 & memory[4] == 'b01 & memory[8] == 'b01)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd4;
				pos3 = 4'd8;
				winner = 'b01;
			end
			else if(memory[0] == 'b10 & memory[4] == 'b10 & memory[8] == 'b10)
			begin 
				pos1 = 4'd0;
				pos2 = 4'd4;
				pos3 = 4'd8;
				winner = 'b10;
			end
			else if(memory[2] == 'b01 & memory[4] == 'b01 & memory[6] == 'b01)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd4;
				pos3 = 4'd6;
				winner = 'b01;
			end
			else if(memory[2] == 'b10 & memory[4] == 'b10 & memory[6] == 'b10)
			begin 
				pos1 = 4'd2;
				pos2 = 4'd4;
				pos3 = 4'd6;
				winner = 'b10;
			end
			else
			begin 
				pos1 = 4'd15;
				pos2 = 4'd15;
				pos3 = 4'd15;
				winner = 'b11;
			end
			
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