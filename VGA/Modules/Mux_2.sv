module  Mux_2 #(parameter N=4) (input logic [N-1:0] data1,data2,input logic seleccion,output logic data_out);
always_comb
begin
case(seleccion)
'b1: data_out<=data2;
default:data_out<=data1;
endcase
end
endmodule
