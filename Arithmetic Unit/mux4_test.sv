module mux4_test();
	logic [3:0] a, b, c, d, out;
	logic [1:0] select;
	mux4 #(4) DUT(a, b, c, d, select, out);
	
	initial begin
	a = 4'b1010;
	b = 4'b1001;
	c = 4'b0101;
	d = 4'b0001;
	
	select = 0; #10;
	assert(out === 4'b1010) else $error("Select 0 failed");
	
	
	select = 1; #10;
	assert(out === 4'b1001) else $error("Select 1 failed");
	
	
	select = 2; #10;
	assert(out === 4'b0101) else $error("Select 2 failed");
	
	
	select = 3; #10;
	assert(out === 4'b0001) else $error("Select 3 failed");
	
	end
endmodule
