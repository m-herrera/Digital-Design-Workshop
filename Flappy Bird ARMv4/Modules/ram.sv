module ram #(parameter N=32, SIZE=10)(input logic clk, rst, write_enable,
													input logic[N-1:0] address, data_input,
													output logic[N-1:0] data_output);
													
	logic[SIZE-1:0][N-1:0] memory;
	
	always_comb
		if(write_enable)
			data_output <= 'z;
		else
			data_output <= memory[address];
	
	always_ff @(posedge clk)
		if(rst)
			memory = '0;
		else
			if(write_enable)
				memory[address] <= data_input;
endmodule
				
				