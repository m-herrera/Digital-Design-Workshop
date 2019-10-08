module game_state_memory(input logic clk,reset, r_w, // 1 - read; 0 - write;
						 input logic[3:0] address,
						 input logic[1:0] data_in,
						 output logic[1:0] data_out);
						 
	logic[1:0] memory [8:0];
	
	integer i;
    always_ff @(posedge clk, posedge reset)
    begin
	
        if(reset)
            for(i=0;i<9;i++)
                memory[i] = 2'b0;
        else
			if (r_w)
				data_out = memory[address];
			else
				memory[address] = data_in;
		
	end
		

endmodule 