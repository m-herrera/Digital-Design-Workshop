module modulo#(parameter bits=4)(input logic [bits-1:0] a ,
output logic [bits-1:0] z);
assign  z = a%bits;
endmodule 