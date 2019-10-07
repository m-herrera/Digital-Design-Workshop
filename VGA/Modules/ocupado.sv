module ocupado(input logic [1:0] memoria,output logic ocupado);
always_comb
begin
if(memoria == 2'b10  || memoria ==2'b01)
ocupado<=1'b1;
else
ocupado<=1'b0;
end
endmodule
