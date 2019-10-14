module testOcupado();
logic [1:0] mem;
logic out;
ocupado UUT(mem,out);
initial begin
mem = 'b01;
#10 mem = 'b10;
#10 mem = 'b11;
end
endmodule
