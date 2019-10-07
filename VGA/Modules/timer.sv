module timer(input logic clk,reset,output logic timeout);
logic enable;
logic [4:0] conteo;
counter #(5) contador(reset,clk,enable,conteo);
always_comb
begin
case(conteo)
'd30:begin enable<=0; timeout<=1;end
default:begin enable<=1; timeout<=0 ;end
endcase
end
endmodule