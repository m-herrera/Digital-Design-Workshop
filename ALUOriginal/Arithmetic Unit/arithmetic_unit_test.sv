module arithmetic_unit_test();
	logic [7:0] a, b, out;
	logic [1:0] select;
	logic cout;
	arithmetic_unit #(8) DUT(a, b, select, cout, out);
	
	initial begin
	a = 8'd11;
	b = 8'd4;
	
	select = 0; #10;
	assert(out === 8'd15) else $error("Sum 1 failed");
	
	
	select = 1; #10;
	assert(out === 8'd7) else $error("Subtract 1 failed");
	
	
	select = 2; #10;
	assert(out === 8'd0) else $error("Shift 1 failed");
	
	a = 8'd240;
	b = 8'd2;
	
	select = 0; #10;
	assert(out === 8'd242) else $error("Sum 2 failed");
	
	
	select = 1; #10;
	assert(out === 8'd238) else $error("Subtract 2 failed");
	
	
	select = 2; #10;
	assert(out === 8'd252) else $error("Shift 2 failed");
	
	
	end
endmodule