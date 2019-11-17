module carry_flag_test();
	
	logic _carry;
	logic[3:0] ALUControl;
	logic has_carry;

	carry_flag DUT(_carry, ALUControl[3:1], has_carry);
	
	
	initial begin
	
	_carry = 0;
	ALUControl = 4'b0;
	
	#10 _carry = 1;
	assert(has_carry == 1'b0);
	#10 _carry = 0;
	assert(has_carry == 1'b0);
	
	#10 ALUControl = 4'b1000;
	
	#10 _carry = 1;
	assert(has_carry == 1'b1);
	#10 _carry = 0;
	assert(has_carry == 1'b0);
	
	#10 ALUControl = 4'b1001;
	
	#10 _carry = 1;
	assert(has_carry == 1'b1);
	#10 _carry = 0;
	assert(has_carry == 1'b0);
	
	
	end

endmodule 