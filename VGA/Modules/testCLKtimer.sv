module testCLKtimer();

logic clk,clk1;
clockForTimer #(7,5) UUT(clk,clk1);
initial begin
clk = 0;
end
always
#10 clk=~clk;
endmodule
