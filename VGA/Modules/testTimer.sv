module testTimer();
logic clk , reset,timeout;
timer tiempos(clk,reset,timeout);
initial begin 
clk =0;reset = 0;
end
always begin
#10 clk = ~clk;
end
always begin
#800 reset = ~reset;
#10 reset = ~reset;
end
endmodule