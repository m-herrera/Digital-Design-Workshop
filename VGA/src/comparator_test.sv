module comparator_test();

logic[9:0] a, b;
logic equal, agtb, altb;

comparator #(9) DUT(a, b, equal, agtb, altb);

initial begin
a = 24; b = 10;
#10 a = 1; b = 3;
#10 a = 8; b = 8;
#10 a = 15; b = 12;
#10 a = 21; b = 21;
#10;
end
endmodule
