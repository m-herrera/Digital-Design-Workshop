module arithmetic_logic_unit_test();
	logic [7:0] a, b, out;
	logic [1:0] select;
	logic negative, zero, carry_out, overflow;
	arithmetic_logic_unit #(8) DUT(a, b, select, out, negative, zero, carry_out, overflow);
	
	initial begin
	a = 8'b01001100;
	b = 8'b01100101;
	#10 select =2'b10;
	#10 select =2'b01;
	#10 select =2'b00;
	#10 select =2'b11;
	end
endmodule