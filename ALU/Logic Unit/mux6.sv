module mux6 
	#(parameter N)
		(input logic[N-1:0] num1,
		input logic[N-1:0] num2,
		input logic[N-1:0] num3,
		input logic[N-1:0] num4,
		input logic[N-1:0] num5,
		input logic[N-1:0] num6,
		input logic[2:0] select,
		output logic[N-1:0] out);
	
	always_comb
	begin
		case(select)
			3'd0 : out = num1;
			3'd1 : out = num2;
			3'd2 : out = num3;
			3'd3 : out = num4;
			3'd4 : out = num5;
			3'd5 : out = num6;
			default : out = 'z;
		endcase
	end
		
endmodule 