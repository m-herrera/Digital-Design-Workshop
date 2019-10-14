module clockForTimer #(parameter N= 16,B=50000) (input logic clk,output logic clk1);
logic reset;
logic [N-1:0] conteo;
counter_GL #(N) contador(reset,clk,1,conteo);
always_comb
begin
case(conteo)
B:begin reset <=1; clk1=1; end
default: begin reset<=0; clk1=0;end
endcase
end
endmodule