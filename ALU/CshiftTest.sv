module CshiftTest();
  
 logic [8:0] a;
 logic [2:0] b;
 logic [8:0] c;
 Cshift #(8) rotador(a,b,c);
 initial begin
		#10 a = 0; b = 1;
		#10 a = 4; b = 5;
		#10 a = 12; b = 6;
		#10 a = 45; b = 7;
	
	end
endmodule 