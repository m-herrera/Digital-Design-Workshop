module logic_unit_test();
	logic[7:0] num1, num2, result;
	logic[3:0] ALUControl;
	


	logic_unit #(8) DUT(num1, num2, ALUControl[2:0], result);
	
	initial begin
	
		num1 = 8'b11001001;
		num2 = 8'b10100111;
		ALUControl = 3'b111;
		#10 assert(result == 8'bz);
		ALUControl = 3'b000;
		#10 assert(result == 8'b11101111);
		ALUControl = 3'b001;
		#10 assert(result == 8'b01101110);
		ALUControl = 3'b010;
		#10 assert(result == 8'b10000001);
		ALUControl = 3'b011;
		#10 assert(result == 8'b10010011);
		ALUControl = 3'b100;
		#10 assert(result == 8'b0);
		num2 = 8'b100;
		#10 assert(result == 8'b00001100);
		ALUControl = 3'b101;
		#10 assert(result == 8'b10010000);
	
	end
	
endmodule 