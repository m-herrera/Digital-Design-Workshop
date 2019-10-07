module decoSoldier(input [2:0] color,
				output logic [23:0] RGB);

always_comb
 case(color)
 3'd0:RGB = 24'h000000;
 3'd1:RGB = 24'h030326;
 3'd2:RGB = 24'h0a0a46;
 3'd3:RGB = 24'h38383a;
 3'd4:RGB = 24'h2d2621;
 3'd5:RGB = 24'h000000;
 3'd6:RGB = 24'h241211;
 3'd7:RGB = 24'h645f57;
 endcase
 
 endmodule