module seven_seg_decoder_test();
	logic [3:0] number;
	logic [6:0] segments;

	seven_seg_decoder DUT(number, segments);

	initial begin
		number = 4'h3; #10;
		number = 4'h8; #10;
		number = 4'hA; #10;
		number = 4'hE; #10;
	end
endmodule
