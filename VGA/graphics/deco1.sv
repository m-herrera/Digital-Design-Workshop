module deco1(input logic[2:0] color_in, 
			output logic [23:0]color_out);

	logic[23:0] color_out_temp;
	
	assign color_out = {color_out_temp[7:0], color_out_temp[15:8], color_out_temp[23:16]};
	
	always_comb
		case(color_in)
			3'd0:color_out_temp = 24'hffffff;
			3'd1:color_out_temp = 24'h2098dc;
			3'd2:color_out_temp = 24'h23cee5;
			3'd3:color_out_temp = 24'h14b5e1;
			3'd4:color_out_temp = 24'hffffff;
			3'd5:color_out_temp = 24'h712e23;
			3'd6:color_out_temp = 24'hdbb369;
			3'd7:color_out_temp = 24'h205cd0;
			default : color_out_temp = 24'h0;
		endcase


endmodule 