module stateMachineTest();
logic clk,rst,timeout,seleccion,inicio,ocupado,ganado;
logic [2:0] estados;
Game_logic maquina(clk,rst,1,0,1,0,0, estados);

initial begin
clk=0;
rst = 1;
#10 rst = 0;
end

always
#10 clk=~clk;

endmodule


