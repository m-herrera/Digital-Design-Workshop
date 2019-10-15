module async_counter#(parameter N=4)(input logic clk, rst,
									 output logic[N-1:0] count);

					
always_ff @(posedge clk, posedge rst)
	if(rst) 
		count <= 0;
	else 
		count <= count + 1'b1;
	
endmodule 