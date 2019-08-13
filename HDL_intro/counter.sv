module counter #(parameter bits=4)(input logic reset, 
												input logic clk, 
												output logic[bits-1:0] count);

	always_ff @ (posedge clk, posedge reset)
		if (reset) count <= 0;
		else count <= count + { {bits-1 {1'b0}}, 1'b1};
endmodule 