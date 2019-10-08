module counter_test();

logic next, rst;
logic[3:0] count;

counter DUT(next, rst, count);

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
end

endmodule
