module arithmetic_logic_unit_display(
	input logic [7:0] a, b,
	input logic [3:0] ALUControl,
	output logic [6:0] segments1,
	output logic [6:0] segments2,
	output logic negative, zero, carry_out, overflow);


	logic [7:0] out;
	arithmetic_logic_unit #(8) ALU(a, b, ALUControl, out, negative, zero, carry_out, overflow);
	
	seven_seg_decoder display2(out[7:4], segments2);
	seven_seg_decoder display1(out[3:0], segments1);
	
endmodule 