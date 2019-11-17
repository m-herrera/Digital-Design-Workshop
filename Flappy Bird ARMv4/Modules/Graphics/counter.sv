module counter #(parameter N=8)(input clk, rst, enable, 
								output logic[N-1:0] count);
	
	
	always_ff @(posedge clk)
		if (rst)
			count <= 'b0;
		else
			if (enable)
				count <= count + 1'b1;
			else
				count <= count;
		
endmodule 