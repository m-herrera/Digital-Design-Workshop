module arithmetic_logic_unit_test();
	logic [7:0] a, b, out;
	logic [3:0] select;
	logic negative, zero, carry_out, overflow;
	arithmetic_logic_unit #(8) DUT(a, b, select, out, negative, zero, carry_out, overflow);
	
	initial begin
	a = 8'b01001011;
	b = 8'b00000100;
	
	select = 0; #10;
	assert(out === 8'b01001111) else $error("OR 1 failed");
	
	
	select = 1; #10;
	assert(out === 8'b01001111) else $error("XOR 1 failed");
	
	
	select = 2; #10;
	assert(out === 8'b00000000) else $error("AND 1 failed");
	
	
	select = 3; #10;
	assert(out === 8'b10110100) else $error("Barrel Shift 1 failed");
	
	
	select = 4; #10;
	assert(out === 8'b00000100) else $error("Right Shift 1 failed");
	
	
	select = 5; #10;
	assert(out === 8'b10110000) else $error("Left Shift 1 failed");
	
	
	select = 6; #10;
	//assert(out === 8'bzzzzzzzz) else $error("Z6 failed");
	
	
	select = 7; #10;
	//assert(out === 8'bzzzzzzzz) else $error("Z7 failed");
	
	
	select = 8; #10;
	assert(out === 8'b01001111) else $error("Sum 1 failed");
	
	
	select = 9; #10;
	assert(out === 8'd71) else $error("Subtract 1 failed");
	
	
	select = 10; #10;
	assert(out === 8'b00000100) else $error("Arithmetic Shift 1 failed");
	
	
	select = 11; #10;
	//assert(out === 8'bzzzzzzzz) else $error("Z11 failed");
	
	
	end
endmodule