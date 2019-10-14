module data_turn(input logic turno, output logic [1:0] persona);
always_comb
begin
case(turno)
'b1:persona<='b10;
default:persona<='b01;
endcase
end
endmodule
