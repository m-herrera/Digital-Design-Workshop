module debounce #(parameter N = 11)(input logic button_in, input logic clk, input logic reset, output logic button_out);
	logic current, next, reset_count;
	logic [N-1:0] counter;
	logic [N-1:0] second_counter;
	
	always_ff @ (posedge clk, posedge reset)
	begin
		if (reset)
			begin
				current <= 1'b0;
				next <= 1'b0;
				counter <= { N {1'b0} };
			end
		else
			begin
				current <= button_in;
				next <= current;
			end
	end
		
	assign reset_count = current ^ next;
	
	always_ff @ (posedge clk)
	begin
		if (reset_count)
			counter <= { N {1'b0} };
		else
			counter <= counter + 1;
	end
	
	always_ff @ (posedge clk)
	begin
		if(counter[N-1])
			button_out <= next;
		else
			button_out <= button_out;
		
	end
	
	
	
endmodule 