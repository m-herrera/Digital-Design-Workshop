module seven_segments_test();
	logic [3:0] numbers;
	logic [6:0] display;
	
	seven_segments DUT(numbers, display);
	
	initial begin
	
	#10 numbers = 4'd0;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd1;
	#1	$display("display = %b\n", display);	
	#10 numbers = 4'd2;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd3;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd4;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd5;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd6;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd7;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd8;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd9;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd10;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd11;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd12;
	#1	$display("display = %b\n", display);
	#10 numbers = 4'd13;
	#1	$display("display = %b\n", display);
	end
	
endmodule 