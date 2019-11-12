module arithmetic_shift_test();
	logic [3:0] a, b, sout;
	
	arithmetic_shift #(4) DUT(a, b, sout);
	
	initial begin
		a = 4'd4; b = 3;#10;
		a = 4'd7; b = 1;#10;
		a = 4'd11; b = 3;#10;
		a = 4'd8; b = 1;#10;
	end
endmodule	
	
				