module logic_unit 
	#(parameter N = 4)
		(input logic [N-1:0] num1,
		input logic [N-1:0] num2,
		input logic [2:0] ALUControl,
		output logic[N-1:0] result);
			
			logic [N-1:0] or_result, xor_result, and_result;
			logic [N-1:0] right_shift_result, left_shift_result, circular_shift_result;
		
			or_gate #(N) Or(num1, num2,or_result); 
			xor_gate #(N) Xor(num1, num2,xor_result); 
			and_gate #(N) And(num1, num2,and_result); 
			
			right_shift #(N) RShift(num1, num2, right_shift_result); 
			left_shift #(N) LShift(num1, num2, left_shift_result); 
			circular_shift #(N) CShift(num1, num2[2:0], circular_shift_result); 
			
			mux6 #(N) Mux(or_result, xor_result, and_result,
								circular_shift_result, right_shift_result, left_shift_result,
								ALUControl, result);
			
		
	endmodule 