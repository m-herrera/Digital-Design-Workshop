module counter_test ();
	logic clk, reset;
	logic [1:0] count2;
	logic [3:0] count4;
	logic [5:0] count6;
	counter #(2) DUT2(reset, clk, count2);
	counter #(4) DUT4(reset, clk, count4);
	counter #(6) DUT6(reset, clk, count6);
	
	initial begin
	clk = 0; reset = 1; #10;
	assert(count2 === 2'b00) else $error("0 reset failed (2).");
	assert(count4 === 4'b0000) else $error("0 reset failed (4).");
	assert(count6 === 6'b000000) else $error("0 reset failed (6).");
	
	clk = 1; reset = 0; #10;
	assert(count2 === 2'b01) else $error("1 failed (2).");
	assert(count4 === 4'b0001) else $error("1 failed (4).");
	assert(count6 === 6'b000001) else $error("1 failed (6).");
	clk = 0; #10;
	clk = 1; #10;
	assert(count2 === 2'b10) else $error("2 failed (2).");
	assert(count4 === 4'b0010) else $error("2 failed (4).");
	assert(count6 === 6'b000010) else $error("2 failed (6).");
	clk = 0; #10;
	clk = 1; #10;
	assert(count2 === 2'b11) else $error("3 failed (2).");
	assert(count4 === 4'b0011) else $error("3 failed (4).");
	assert(count6 === 6'b000011) else $error("3 failed (6).");
	clk = 0; #10;
	clk = 1; #10;
	assert(count2 === 2'b00) else $error("end failed (2).");
	assert(count4 === 4'b0100) else $error("4 failed (4).");
	assert(count6 === 6'b000100) else $error("4 failed (6).");
	clk = 0; #10;
	clk = 1; #10;
	assert(count2 === 2'b01) else $error("1(2) failed (2).");
	assert(count4 === 4'b0101) else $error("5 failed (4).");
	assert(count6 === 6'b000101) else $error("5 failed (6).");
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	clk = 0; #10;
	clk = 1; #10;
	assert(count4 === 4'b1111) else $error("15 failed (4).");
	assert(count6 === 6'b001111) else $error("15 failed (6).");
	clk = 0; #10;
	clk = 1; #10;
	assert(count4 === 4'b0000) else $error("end failed (4).");
	assert(count6 === 6'b010000) else $error("16 failed (6).");

	clk = 1; reset = 1; #10;
	assert(count2 === 2'b00) else $error("reset failed (2).");
	assert(count4 === 4'b0000) else $error("reset failed (4).");
	assert(count6 === 6'b000000) else $error("reset failed (6).");
	
	end
endmodule 