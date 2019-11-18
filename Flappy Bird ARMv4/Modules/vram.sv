module vram #(parameter N=32, SIZE=10)(input logic clk, rst, write_enable,
													input logic[N-1:0] address, data_input,
													output logic[N-1:0] data_output,
													output logic[SIZE-1:0][N-1:0] parallel_output);
								
	always_comb
		if(write_enable)
			data_output <= 'z;
		else
			data_output <= parallel_output[address];
	
	always_ff @(posedge clk)
		if(rst)
			parallel_output = '0;
		else
			if(write_enable)
				parallel_output[address] <= data_input;
endmodule
				
				