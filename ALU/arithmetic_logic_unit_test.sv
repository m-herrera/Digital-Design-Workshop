module arithmetic_logic_unit_test();
	logic [7:0] a, b, out;
	logic [1:0] select;
	logic negative, zero, carry_out, overflow;
	arithmetic_logic_unit #(8) DUT(a, b, select, out, negative, zero, carry_out, overflow);
	
	initial begin
	a = 8'b01001100;
	b = 8'b01100101;
	select=2;
	#20 select=1;
	#20 select=0;
	#20 select=3;
	end
endmodule