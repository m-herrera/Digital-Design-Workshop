module Xor#(parameter bits=4)(input logic [bits-1:0] a ,
input logic [bits-1:0] b,
output logic [bits-1:0] z);
assign  z = a ^ b;
endmodule 