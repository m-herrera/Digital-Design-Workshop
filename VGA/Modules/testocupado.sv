module testocupado();
logic [1:0] a;
logic b;
ocupado modulo(a,b);
initial begin
a=2'b00;
#10 a =2'b10;
#10 a =2'b01;
#10 a =2'b00;
end
endmodule