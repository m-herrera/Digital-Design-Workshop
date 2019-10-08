module game_state_memory_test();

logic clk, rst, we;
logic[3:0] r_addr, w_addr;
logic[1:0] data_in, data_out;

game_state_memory DUT (clk, rst, we, r_addr, w_addr, data_in, data_out);

initial begin
	clk = 0; rst = 0; we = 0; w_addr = 'd0; r_addr = 'd0;
	#20 rst = 1;
	#20 rst = 0;
	#10 w_addr = 'd0;
	#10 data_in = 'b10; we = 1;
	#10 w_addr = 'd1;
	#10 data_in = 'b11;
	#10 w_addr = 'd2;
	#10 data_in = 'b01;
	#10 w_addr = 'd3;
	#10 data_in = 'b10;
	#10 w_addr = 'd4;
	#10 data_in = 'b01;
	#10 w_addr = 'd5;
	#10 data_in = 'b10;
	#10 w_addr = 'd6;
	#10 data_in = 'b01;
	#10 w_addr = 'd7;
	#10 data_in = 'b10;
	#10 w_addr = 'd8;
	#10 data_in = 'b01;
	#10 we = 0;
	#20 r_addr = 'd0;
	#20 r_addr = 'd1;
	#20 r_addr = 'd2;
	#20 r_addr = 'd3;
	#20 r_addr = 'd4;
	#20 r_addr = 'd5;
	#20 r_addr = 'd6;
	#20 r_addr = 'd7;
	#20 r_addr = 'd8;
	#20 rst = 1;
	#20 rst = 0;
	#20 r_addr = 'd0;
	#20 r_addr = 'd1;
	#20 r_addr = 'd2;
	#20 r_addr = 'd3;
	#20 r_addr = 'd4;
	#20 r_addr = 'd5;
	#20 r_addr = 'd6;
	#20 r_addr = 'd7;
	#20 r_addr = 'd8;
end

always
	#10 clk <= !clk;
	
endmodule
  