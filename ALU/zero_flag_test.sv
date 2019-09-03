module zero_flag_test();
	logic [3:0] number;
	logic zero;
	
	zero_flag #(4) DUT(number, zero);
	initial begin
		number = 10;
		assert(zero == 1) #10;
		number = 0;
		assert(zero == 0) #10;
		number = 1; #10
		assert(zero == 1) #10;
		number = 2; #10
		assert(zero == 1) #10;
		number = 9; #10
		assert(zero == 1) #10;
		number = 0; #10;
		assert(zero == 0) #10;
		$display("zero_flag tests successful");
	end
endmodule 