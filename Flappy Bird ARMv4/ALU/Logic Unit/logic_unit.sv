module logic_unit #(parameter N = 8)
						(input logic [N-1:0] num1, num2,
						input logic ALUControl,
						output logic[N-1:0] result);
		
	logic [N-1:0] or_result, and_result;
	or_gate #(N) Or(num1, num2, or_result); 
	and_gate #(N) And(num1, num2, and_result);
	mux2v2 #(N) Mux(and_result, or_result, ALUControl, result);
			
endmodule 