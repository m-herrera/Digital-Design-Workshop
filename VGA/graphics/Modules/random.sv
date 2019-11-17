module random(input clk, rst, enable, 
			  output logic[3:0] rand_num);

	logic rstrt;
	logic[3:0] count;
	
	assign rstrt = count >= 4'd9;
	
	counter_GL #(4) Count(clk, rst || rstrt, 1'b1, count);
	
	
	always_ff @(posedge clk, posedge enable)
		if (enable)
			rand_num <= count;
		else
			rand_num <= rand_num;
		
		
endmodule 