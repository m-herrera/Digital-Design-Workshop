module clock_divider #(parameter conversion_size = 2)(
	input logic in_clk,
	input logic reset,
	input logic[conversion_size-1:0] conversion,
	output logic out_clk);
	
	
	logic[conversion_size-1:0] count;
	
	always_ff @(posedge in_clk)
	begin
		if (reset)
			begin
				out_clk <= in_clk;
				count <= 'b1;
			end
		else
			begin
				if (count == (conversion - 1'b1))
				begin
					count <= 'b1;
					out_clk <= !out_clk;
				end
				else
				begin
					count <= count + 1'b1;
					out_clk <= out_clk;
				end
			end 
	end

endmodule 