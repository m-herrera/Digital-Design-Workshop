module random(input clk, rst, enable, 
			  output logic[3:0] rand_num);

	logic[3:0] count;
	counter_GL #(4) Count(clk, rst, !enable, count);
	
	
	always_ff @(posedge clk)
		if (enable)
			rand_num <= count;
		else
			rand_num <= rand_num;
		
		
endmodule 