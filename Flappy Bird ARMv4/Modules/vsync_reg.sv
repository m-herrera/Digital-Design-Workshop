module vsync_reg(input logic rst, frame,
						output logic refresh);
						
always_ff @(posedge rst, negedge frame)
	begin
		if(rst) refresh <= 0;
		else if(!frame) refresh <= 1;
		else refresh <= refresh;
	end
endmodule