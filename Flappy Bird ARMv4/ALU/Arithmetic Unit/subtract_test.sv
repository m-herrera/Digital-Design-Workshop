module subtract_test();
	logic [3:0] a, b, s;
	logic cout;
	
	subtract #(4) DUT(a, b, s, cout);
	
	initial begin
		a = 4; b = 3;#10;
		a = 7; b = 5;#10;
		a = 5; b = 1;#10;
		a = 1; b = 7;#10;
	end
endmodule