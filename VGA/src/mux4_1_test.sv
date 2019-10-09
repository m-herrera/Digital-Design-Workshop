module mux4_1_test();


	logic[2:0] input1, input2, input3, input4, out;
	logic in2, in3,in4;

	mux4_1 DUT(input1, input2, input3, input4, {in2,in3,in4}, out);
	
	initial begin
		input1 = 3'd1;
		input2 = 3'd2;
		input3 = 3'd3;
		input4 = 3'd4;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		#10 in2 = 1;
		#10 in2 = 0;
		#10 in3 = 1;
		#10 in3 = 0;
		#10 in4 = 1;
		#10 in4 = 0;
	end
endmodule 