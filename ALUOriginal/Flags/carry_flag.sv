module carry_flag(input logic _carry,input logic[2:0] selection, 
													output logic has_carry);
			
	assign has_carry = _carry & (selection == 3'b100);
		//100 represents addition or substraction
													
endmodule 