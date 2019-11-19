module vsync_reg_test();

logic rst, frame, refresh;

vsync_reg DUT(rst, frame, refresh);

initial begin
	frame = 1; rst = 0;
	
	#10 rst = 1;
	#10 rst = 0;
	#10 frame = 0;
	#10 frame = 1;
	#10 rst = 1;
	#10 rst = 0;
end

endmodule