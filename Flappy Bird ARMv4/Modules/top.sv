module top(input logic clk, reset, PS2_CLK, PS2_DAT, clk_reset,
			output logic hsync, vsync, blank, sync, vga_clk, 
			output logic[7:0] vga_r, vga_g, vga_b);

logic [31:0]  ReadData;
logic [9:0][31:0] vram_parallel_output;
logic [31:0] WriteData, DataAdr, PC, Instr;
logic MemWrite;

// instantiate processor and memories
arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
imem imem(PC, Instr);
iomemory dmem(PS2_CLK, PS2_DAT, !clk, reset, MemWrite, vsync, DataAdr, WriteData, ReadData, vram_parallel_output);
vga_top vga(clk, reset, clk_reset, vram_parallel_output[0][10:0],
							   vram_parallel_output[1][10:0], 
						       vram_parallel_output[2][10:0],
						       vram_parallel_output[3][10:0],
						       vram_parallel_output[4][10:0],
						       vram_parallel_output[5][10:0],
						       vram_parallel_output[6][10:0],
						       vram_parallel_output[7][10:0],
						       vram_parallel_output[8][10:0],
						       vram_parallel_output[9][10:0], hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b);
//vga_top vga(clk, reset, clk_reset, 'd128, 'd208, 'd200, 'd308,  'd500, 'd342,'d200, -'d90, 'd340, -'d50, hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b);
endmodule 