module synchronizer(input clk, rst, 
				   output logic[9:0] pixelx, pixely,
				   output logic hsync, vsync, blank, sync);
				   
	assign blank = (pixely <  480) && (pixelx < 640);
	assign sync = 1'b1;

	assign hsync = !(pixelx >= 10'd656 && pixelx < 10'd752);
	assign vsync = !(pixely >= 10'd491 && pixely < 10'd493);
			
	logic rstx, rsty;			
	assign rstx = rst || (pixelx == 800);
	assign rsty = rst || (pixely == 525);

	logic enablex, enabley;
	assign enablex = 1'b1;
	assign enabley = (pixelx == 10'd800);

	counter #(10)HCount(clk, rstx, enablex, pixelx);
	
	counter #(10)VCount(clk, rsty, enabley, pixely);

endmodule 