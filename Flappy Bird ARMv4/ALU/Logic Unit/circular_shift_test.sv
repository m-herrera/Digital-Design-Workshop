module circular_shift_test();

 logic [31:0] a;
 logic [3:0] b;
 logic [31:0] c;
 circular_shift rotador(a,b,c);
 
 initial begin
		#10 a = 'hFF; b = 1;
		#10 b = 2;
		#10 b = 3;
		#10 b = 4;
		#10 b = 5;
		#10 b = 6;
		#10 b = 7;
		#10 b = 8;
		#10 b = 9;
		#10 b = 10;
		#10 b = 11;
		#10 b = 12;
		#10 b = 13;
		#10 b = 14;
		#10 b = 15;

	end
endmodule
