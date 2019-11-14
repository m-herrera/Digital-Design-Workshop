module vram #(parameter N=32, SIZE=10)(input logic clk, rst, write_enable,
													input logic[N-1:0] address, data_input,
													output logic[N-1:0] data_output,
													output logic[SIZE-1:0][N-1:0] parallel_output);
								
	always_ff @(posedge clk)
		if(rst)
			parallel_output = '0;
		else
			begin
				if(address < SIZE)
					case(write_enable)
						0:data_output <= parallel_output[address[SIZE-1:0]];
						1:
							begin
								data_output <= 'z;
								parallel_output[address[SIZE-1:0]] <= data_input;
							end
					endcase
				else
					data_output <= 'z;
			end
endmodule
				
				