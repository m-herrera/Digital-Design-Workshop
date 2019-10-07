module out_logic(input logic [1:0] state,
						output logic [3:0] quadrant);
					
always_comb 
case(state)
2'b00: quadrant = 4'b0001;
2'b01:quadrant = 4'b0010;
2'b10:quadrant = 4'b0100;
2'b11:quadrant = 4'b1000;
default: quadrant = 4'b0000;
endcase 
endmodule 