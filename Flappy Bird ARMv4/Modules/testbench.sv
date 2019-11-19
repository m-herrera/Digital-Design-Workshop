`timescale 1 ps / 1 ps


module testbench();
logic clk, reset, PS2_CLK, PS2_DAT;
logic hsync, vsync, blank, sync, vga_clk; 
logic[7:0] vga_r, vga_g, vga_b;

// instantiate device to be tested
top dut(clk, reset, PS2_CLK, PS2_DAT, hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b);
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