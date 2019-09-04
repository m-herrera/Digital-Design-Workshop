module LleftTest();
  
 logic [8:0] a;
 logic [8:0] b;
 logic [8:0] c;
 Lleft #(9) gate(a,b,c);
 initial begin
		#10 a = 0; b = 0;
		#10 a = 4; b = 4;
		#10 a = 12; b = 3;
		#10 a = 45; b = 5;
	
	end
endmodule 