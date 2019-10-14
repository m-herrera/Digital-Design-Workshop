module timer #(b=30)(input logic clk,reset,output logic timeout);
logic enable;
logic [4:0] conteo;
counter_GL #(5) contador(reset,clk,enable,conteo);
always_comb
begin
case(conteo)
b:begin enable<=0; timeout<=1;end
default:begin enable<=1; timeout<=0 ;end
endcase
end
endmodule