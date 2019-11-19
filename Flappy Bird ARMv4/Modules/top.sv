module top(input logic clk, reset, PS2_CLK, PS2_DAT,
			output logic hsync, vsync, blank, sync, vga_clk, 
			output logic[7:0] vga_r, vga_g, vga_b);

logic [31:0]  ReadData;
logic [9:0][31:0] vram_parallel_output;
logic [31:0] WriteData, DataAdr, PC, Instr;
logic MemWrite;

// instantiate processor and memories
arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
imem imem(PC, Instr);
iomemory dmem(PS2_CLK, PS2_DAT, !clk, reset, MemWrite, DataAdr, WriteData, ReadData, vram_parallel_output);
vga_top vga(clk, reset, reset, vram_parallel_output[0][9:0],
							   vram_parallel_output[1][9:0], 
						       vram_parallel_output[2][9:0],
						       vram_parallel_output[3][9:0],
						       vram_parallel_output[4][9:0],
						       vram_parallel_output[5][9:0],
						       vram_parallel_output[6][9:0],
						       vram_parallel_output[7][9:0],
						       vram_parallel_output[8][9:0],
						       vram_parallel_output[9][9:0], hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b);
endmodule 