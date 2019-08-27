module counter_display(input logic clk, input logic reset, output logic[6:0] segments);
	logic [3:0] count;
	counter #3 counter1(reset, clk, count);
	seven_seg_decoder display(count, segments);
endmodule 