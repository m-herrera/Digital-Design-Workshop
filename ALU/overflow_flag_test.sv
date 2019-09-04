module overflow_flag_test();
	logic[7:0] num1;
	logic[7:0] num2;
	logic[3:0] ALUControl;
	logic[7:0] result;
	logic overflow;

	
	overflow_flag DUT(num1[7], num2[7], ALUControl, result[7], overflow);
	
	
	initial begin
		ALUControl = 0;
		
	
	end


endmodule 