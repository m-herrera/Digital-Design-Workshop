module overflow_flag_test();
	logic[3:0] num1, num2, result;
	logic[3:0] ALUControl;
	logic overflow;

	
	overflow_flag DUT(num1[3], num2[3], result[3], ALUControl, overflow);
	
	
	initial begin
		ALUControl = 4'd8;
		
		num1 = 4'd7; num2 = 4'd3; result = 4'd10; #10;
		assert(overflow === 1) else $error("Sum 1 failed");
		
		num1 = 4'd2; num2 = 4'd3; result = 4'd5; #10;
		assert(overflow === 0) else $error("Sum 2 failed");
		
		num1 = 4'd15; num2 = 4'd3; result = 4'd2; #10;
		assert(overflow === 0) else $error("Sum 3 failed");
	
	end


endmodule 