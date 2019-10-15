module debouncer#(parameter imm = 200,N = 8)(input logic clk,boton,output logic salida);

logic salidaFF1, salidaFF2, salidaXor;

FF #(1) flipflopD1(clk,0,1,boton,salidaFF1);
FF #(1) flipflopD2(clk,0,1,salidaFF1,salidaFF2);
xor_gate gate(salidaFF1,salidaFF2,salidaXor);
counter_GL #(8) contador(salidaXor,clk,~enable,conteo);
and_imm_gate #(N,imm) andgate(conteo,enable);
FF #(1) flipflopD3(clk,0,enable,salidaFF2,salida);
endmodule
