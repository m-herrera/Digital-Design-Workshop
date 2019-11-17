module deco2(input logic[2:0] color_in, 
			output logic [23:0]color_out);

	logic[23:0] color_out_temp;
	
	assign color_out = {color_out_temp[7:0], color_out_temp[15:8], color_out_temp[23:16]};
	
	always_comb
		case(color_in)
			3'd0:color_out_temp = 24'h000000;
			3'd1:color_out_temp = 24'h000000;
			3'd2:color_out_temp = 24'h00821a;
			3'd3:color_out_temp = 24'h06a300;
			3'd4:color_out_temp = 24'h38d979;
			3'd5:color_out_temp = 24'h75ffd6;
			3'd6:color_out_temp = 24'h52dea1;
			default : color_out_temp = 24'h0;
		endcase


/* 
 * 0x00000000 = 0
 * 0xff000000 = 1
 * 0xff00821a = 2
 * 0xff06a300=3
 * 0xff38d979=4
 * 0xff75ffd6=5
 * 0xff52dea1 =6
 * */
		
endmodule 