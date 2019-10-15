module testPGAdeboucner( input logic clk,boton,output logic [3:0] salCont,output logic salida);

debouncer # ( 10,8) debo(clk,boton,salida);
counter_GL #(4) count(0, salida,1, salCont);
endmodule
