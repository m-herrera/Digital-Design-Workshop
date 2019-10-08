`timescale 10ns/10ns


module rom_test();


	logic[11:0] address;
	logic[2:0] out;
	logic clk;
	
	
	rom1 sprite1_rom(.address (address),
				     .clock (clk),
				     .q (out));	
	
	initial begin
	
		address = 12'd90;
	
	end
	
	
	always #10 clk = !clk;

endmodule 