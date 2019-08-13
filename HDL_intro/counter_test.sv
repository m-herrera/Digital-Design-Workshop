module counter_test ();
	logic clk, reset;
	logic [3:0] count;
	counter #(4) DUT(reset, clk, count);
	
	initial begin
	clk = 0; reset = 1; #10;
	
	assert(count === 4'b0000) else $error("0 reset failed.");
	clk = 1; reset = 0; #10;
	assert(count === 4'b0001) else $error("1 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0010) else $error("2 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0011) else $error("3 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0100) else $error("4 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0101) else $error("5 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0110) else $error("6 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0111) else $error("7 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1000) else $error("8 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1001) else $error("9 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1010) else $error("10 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1011) else $error("11 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1100) else $error("12 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1101) else $error("13 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1110) else $error("14 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b1111) else $error("15 failed.");
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0000) else $error("end failed.");
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	assert(count === 4'b0011) else $error("reset failed.");
	clk = 0; #10;
	clk = 1; reset = 1; #10;
	assert(count === 4'b0000) else $error("1 failed.");
	
	end
endmodule 