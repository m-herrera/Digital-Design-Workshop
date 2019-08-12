module decoder_test();
logic [0:3] a;
logic [0:15] b;
 
decoder deco(a,b);
initial begin
	#10 a = 0;
	#10 a =4;
	#10 a =10;
	#10 a =12;
	#10 a =14;
end

endmodule 