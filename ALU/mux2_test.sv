module mux2_test();
	logic [7:0] num1;
	logic [7:0] num2;
	logic [3:0] ALUControl;
	logic [7:0] result;

	
	mux2 #(8) DUT(num1, num2, ALUControl[0], result);

	
	initial begin 
		ALUControl = 0;
		num1 = 0;
		num2 = 1;
		assert(result == 0);
	
		#10
		num1 = 1;
		assert(result == 1);
		
		#10 
		num2 = 0;
		assert(result == 1);
	
	
		ALUControl = 1;
		assert(result == 0);
		
		#10
		num1 = 0;
		num2 = 1;
		assert(result == 1);
	
		#10
		num1 = 1;
		assert(result == 1);
		
		#10 
		num2 = 0;
		assert(result == 0);
	
	end
	
endmodule 