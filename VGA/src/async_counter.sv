module async_counter#(parameter N=3)
					(input logic next, rst,
					output logic[N:0] count);

					
always_ff @(posedge next, posedge rst)
	if(rst) count <= 0;
	else count <= count + { {N-1 {1'b0}}, 1'b1};
	
endmodule 