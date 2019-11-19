module synchronizer(input clk, rst, 
				   output logic[10:0] pixelx, pixely,
				   output logic hsync, vsync, blank, sync);
				   
	assign blank = (pixely <  480) && (pixelx < 640);
	assign sync = 1'b1;

	assign hsync = !(pixelx >= 11'd656 && pixelx < 11'd752);
	assign vsync = !(pixely >= 11'd491 && pixely < 11'd493);
			
	logic rstx, rsty;			
	assign rstx = rst || (pixelx == 800);
	assign rsty = rst || (pixely == 525);

	logic enablex, enabley;
	assign enablex = 1'b1;
	assign enabley = (pixelx == 11'd800);

	counter #(11)HCount(clk, rstx, enablex, pixelx);
	
	counter #(11)VCount(clk, rsty, enabley, pixely);

endmodule 