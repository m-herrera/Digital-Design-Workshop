module arithmetic_logic_unit_test();
	logic [7:0] a, b, out;
	logic [3:0] select;
	logic negative, zero, carry_out, overflow;
	arithmetic_logic_unit #(8) DUT(a, b, select, out, negative, zero, carry_out, overflow);
	
	initial begin
	a = 8'b01001100;
	b = 8'b01100101;
	
	select = 0; #10;
	assert(out === 8'b01101101) else $error("OR 1 failed");
	
	
	select = 1; #10;
	assert(out === 8'b00101001) else $error("XOR 1 failed");
	
	
	select = 2; #10;
	assert(out === 8'b01000100) else $error("AND 1 failed");
	
	
	b = 8'b00000011;
	select = 3; #10;
	assert(out === 8'b10001001) else $error("Barrel Shift 1 failed");
	
	
	select = 4; #10;
	assert(out === 8'b00001001) else $error("Right Shift 1 failed");
	
	
	select = 5; #10;
	assert(out === 8'b01100000) else $error("Left Shift 1 failed");
	
	a = 8'b11001100;
	b = 8'b11100101;
	select = 8; #10;
	assert(out === 8'b10110001) else $error("Sum 1 failed");
	assert(carry_out === 1) else $error("Sum 1 failed");
	
	b = 8'b11001100;
	select = 9; #10;
	assert(out === 8'd0) else $error("Subtract 1 failed");
	assert(zero === 1) else $error("Subtract 1 failed");
	
	b = 8'b00000011;
	select = 10; #10;
	assert(out === 8'b11111001) else $error("Arithmetic Shift 1 failed");
	
	end
endmodule