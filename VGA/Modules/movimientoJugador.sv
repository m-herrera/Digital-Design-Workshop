module  movimientoJugador #( parameter N=4,B=9) ( input logic clk,output logic [N-1:0] posicion);
logic reset;
logic [N-1:0] conteo;
counter_GL #(N) contador(reset,clk,1,conteo);
always_comb
begin
case(conteo)
B:begin reset <=1; posicion<=0 ;end
default: begin reset<=0;  posicion<=conteo; end
endcase
end
endmodule