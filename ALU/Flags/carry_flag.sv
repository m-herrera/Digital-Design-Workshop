module carry_flag(input logic _carry,input logic [1:0] selection, 
													output logic has_carry);
			
	assign has_carry = _carry & (selection ==0);
		//100 represents addition or substraction
													
endmodule 