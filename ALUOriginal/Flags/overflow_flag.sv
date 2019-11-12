module overflow_flag(input logic msb_num1, msb_num2, msb_result,
								input logic[3:0] control, 
								output logic overflow);


logic addition_substraction;
logic sign_change;
logic sign_contradiction;
 								
								
assign addition_substraction = control[3:1] == 3'b100;
//100 represents addition or substraction

assign sign_change = msb_num1 ^ msb_result;
assign sign_contradiction = !(msb_num1 ^ msb_num2 ^ control[0]);

assign overflow = addition_substraction & sign_change & sign_contradiction;


endmodule 