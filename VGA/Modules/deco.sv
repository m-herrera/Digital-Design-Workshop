module deco(input [2:0] color,
				output logic [23:0] RGB);

always_comb
 case(color)
 3'd0:RGB = 24'h000000;
 3'd1:RGB = 24'h2098dc;
 3'd2:RGB = 24'h23cee5;
 3'd3:RGB = 24'h14b5e1;
 3'd4:RGB = 24'hffffff;
 3'd5:RGB = 24'h712e23;
 3'd6:RGB = 24'hdbb369;
 3'd7:RGB = 24'h205cd0;
 endcase
 
 endmodule