module counterTest();
parameter N=8;
logic clk;
logic reset;
logic [N-1:0] out;
counter #(N) count(clk,reset,out);

initial begin 
clk=0;
reset=0;
#20 reset=1;
#25 reset=0;
end
always
#5 clk = !clk;
endmodule 