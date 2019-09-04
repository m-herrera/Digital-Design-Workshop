module moduloTest();
  
 logic [8:0] a;
 logic [8:0] b;
 modulo #(9) oper(a,b);
 initial begin
		#10 a = 0; 
		#10 a = 4; 
		#10 a = 12; 
		#10 a = 45; 
	end
endmodule 