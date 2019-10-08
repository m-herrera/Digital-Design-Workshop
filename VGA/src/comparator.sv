module comparator #(parameter N=3)
						(input logic[N:0] a, b,
						output logic equal, agtb, altb);

assign equal = a == b;
assign agtb = a > b;
assign altb = a < b;
						
endmodule

