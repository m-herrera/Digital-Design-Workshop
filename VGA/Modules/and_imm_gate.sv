module and_imm_gate #(parameter N= 1,imm = 100)
(input logic [N-1:0] a,output logic b);
always @* begin
if(a == 10)
b=1;
else
b=0;
end

endmodule