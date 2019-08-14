module seven_seg_decoder(input logic [3:0] number, 
								output logic [6:0] segments);
always_comb
	case(number)
	//                        abcdefg
		0:       segments = 7'b0000001;
		1:       segments = 7'b1001111;
		2:       segments = 7'b0010010;
		3:       segments = 7'b0000110;
		4:       segments = 7'b1001100;
		5:       segments = 7'b0100100;
		6:       segments = 7'b0100000;
		7:       segments = 7'b0001111;
		8:       segments = 7'b0000000;
		9:       segments = 7'b0000100;
		10:      segments = 7'b0001000;
		11:      segments = 7'b1100000;
		12:      segments = 7'b1110010;
		13:      segments = 7'b1000010;
		14:      segments = 7'b0110000;
		15:      segments = 7'b0111000;
		default: segments = 7'b1111111;
	endcase
endmodule
								