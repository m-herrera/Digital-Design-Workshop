module sync_test();

logic clk, rst, pulse;
logic[3:0] sync_pos, line_size, count;

sync #(3) DUT(clk, rst, sync_pos, line_size, count, pulse);


initial begin
clk = 0; rst = 0; sync_pos = 'd2; line_size = 'd10;
#20 rst = 1;
#20 rst = 0;
end

always
	#10 clk <= !clk;
  
endmodule
