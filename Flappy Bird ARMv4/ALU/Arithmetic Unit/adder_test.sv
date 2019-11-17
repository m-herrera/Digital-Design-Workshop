module adderv2_test();
	logic [3:0] a, b, s;
	logic cin, cout;
	
	adderv2 #(4) DUT(a, b, cin, s, cout);
	
	initial begin
		a = 4; b = 3; cin=0;#10;
		a = 8; b = 9; cin=0;#10;
		a = 5; b = 2; cin=0;#10;
		a = 1; b = 7; cin=1;#10;
	end
endmodule