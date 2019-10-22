module counter_GL #(parameter bits=4)
					(input clk, rst, enable, 
					 output logic[bits-1:0] count);
	
always_ff @(posedge clk, posedge rst)
    if (rst)
		count <= 'b0;
    else if (enable)
        count <= count + 1'b1;
	else
		count <= count;

endmodule 
