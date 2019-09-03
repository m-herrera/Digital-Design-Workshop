module overflow_flag(input logic msb_num1, input logic msb_num2, 
								input logic[3:0] control, input logic msb_result,
								output logic overflow);


assign addition_substraction = control[3:1] == 3'b100;
//100 represents addition or substraction

assign sign_change = msb_num1 ^ msb_result;
assign sign_contradiction = !(msb_num1 ^ msb_num2 ^ control[0]);

assign overflow = addition_substraction & sign_change & sign_contradiction;


endmodule 