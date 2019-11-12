module mux6_test();
	
	logic[7:0] num1, num2, num3, num4, num5, num6;
	logic[2:0] control;
	logic[7:0] result;
	
	mux6 #(8) DUT(num1, num2, num3, num4, num5, num6, control, result);

	
	initial begin 
		num1 = 8'd1;
		num2 = 8'd2;
		num3 = 8'd3;
		num4 = 8'd4;
		num5 = 8'd5;
		num6 = 8'd6;
		control = 3'b000;
		#10 assert(result == 8'd1);
		
		control = 3'b001;
		#10 assert(result == 8'd2);
		
		control = 3'b010;
		#10 assert(result == 8'd3);
		
		control = 3'b011;
		#10 assert(result == 8'd4);
		
		control = 3'b100;
		#10 assert(result == 8'd5);
		
		control = 3'b101;
		#10 assert(result == 8'd6);
		
		control = 3'b110;
		#10 assert(result == 8'bz);
		
		control = 3'b111;
		#10 assert(result == 8'bz);
		
		
	
	end

endmodule 