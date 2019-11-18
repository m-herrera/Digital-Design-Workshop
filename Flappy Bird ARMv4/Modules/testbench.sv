module testbench();
logic clk, reset, PS2_CLK, PS2_DAT;
logic [31:0] WriteData, DataAdr,PC,Instr;
logic MemWrite;
logic [9:0][31:0] vram_parallel_output;
// instantiate device to be tested
top dut(clk, reset, PS2_CLK, PS2_DAT, WriteData, DataAdr,PC,Instr, MemWrite, vram_parallel_output);
// initialize test
initial
begin
reset <= 1; PS2_DAT = 1; 
# 22 reset <= 0;
end
// generate clock to sequence tests
always
begin
PS2_CLK <= 1; clk <= 1; # 5; PS2_CLK <= 0; clk <= 0; # 5;
end

endmodule