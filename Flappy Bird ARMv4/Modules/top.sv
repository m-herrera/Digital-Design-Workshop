module top(input logic clk, reset, PS2_CLK, PS2_DAT,
output logic [31:0] WriteData, DataAdr, PC, Instr,
output logic MemWrite,
output logic [9:0][31:0] vram_parallel_output);
logic [31:0]  ReadData;
// instantiate processor and memories
arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
WriteData, ReadData);
imem imem(PC, Instr);
iomemory dmem(PS2_CLK, PS2_DAT, clk, reset, MemWrite, DataAdr, WriteData, ReadData, vram_parallel_output);
endmodule