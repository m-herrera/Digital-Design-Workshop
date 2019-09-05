module negative_flag_test();
	logic[3:0] number;
	logic is_arithmetic;
	logic is_negative;
	
	negative_flag DUT(number[3], is_arithmetic, is_negative);
	integer i;
	initial begin
		is_arithmetic = 1;
		#10 number = 5;
		assert(is_negative == 0);
		#10 number = 0;
		assert(is_negative == 0);
		#10 number = -5;
		assert(is_negative == 1);
		#10 number = 0;
		assert(is_negative == 0);
		is_arithmetic = 0;
		assert(is_negative == 0);
		#10 number = 5;
		assert(is_negative == 0);
		#10 number = 0;
		assert(is_negative == 0);
		#10 number = -5;
		assert(is_negative == 0);
		#10 number = 0;
		assert(is_negative == 0);
		$display("negative_flag tests successful");

	end


endmodule 