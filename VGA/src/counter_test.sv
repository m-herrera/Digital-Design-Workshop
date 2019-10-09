module counter_test();

logic next, rst;
logic[3:0] count, count2;

counter DUT(next, rst, count);
async_counter DUT2(next, rst, count2);
initial begin
	next = 0; rst = 1;
	#10 next = 1; 
	#10 next = 0; rst = 0;
	#10 next = 1;
	#10 next = 0;
	#10 next = 1;
	#10 next = 0;
	#10 next = 1;
	#10 next = 0;
	#10 next = 1;
	#10 next = 0;
	#10 next = 1;
	#10 next = 0;
	#10 next = 1;
	#10 next = 0;
	#10 rst = 1;
end

endmodule
