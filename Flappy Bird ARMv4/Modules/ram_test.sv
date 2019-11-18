module ram_test();

	logic clk, rst, write_enable;
	logic[31:0] address, data_input;
	logic[31:0] data_output;

	ram DUT(clk, rst, write_enable, address, data_input, data_output);

	initial begin
		#10 rst = 1; write_enable = 0; address = 'z; data_input = 'z; clk = 0;
		#10 rst = 0;
		#10 write_enable = 1; address = 32'h1; data_input = 32'hFA32;
		#10 write_enable = 0; data_input = 32'hEA99;
		#10 write_enable = 1; address = 32'h5;
		#10 data_input = 32'hEA99; address = 32'h3;
		#10 write_enable = 0; address = 32'h5;
		#10 address = 32'h3;
		#12 address = 32'h1;
	end	

	always #5 clk <= !clk;

endmodule