`timescale 1 ns / 1 ns


module testbench();
logic clk, reset, PS2_CLK, PS2_DAT, clk_reset;
logic hsync, vsync, blank, sync, vga_clk; 
logic[7:0] vga_r, vga_g, vga_b;

// instantiate device to be tested
top dut(clk, reset, PS2_CLK, PS2_DAT, clk_reset, hsync, vsync, blank, sync, vga_clk, vga_r, vga_g, vga_b);
// initialize test
initial
begin
clk_reset = 0;
#5;
clk_reset = 1;
#20;
clk_reset = 0;
reset <= 1; PS2_DAT = 1; 

# 22 reset <= 0;

	#5 PS2_DAT <= 0;//Inicio
	#10 PS2_DAT <= 1;
	#10 PS2_DAT <= 0;
	#10 PS2_DAT <= 0;
	#10 PS2_DAT <= 1;
	#10 PS2_DAT <= 0;
	#10 PS2_DAT <= 1;
	#10 PS2_DAT <= 0;
	#10 PS2_DAT <= 0;
	#10 PS2_DAT <= 1;//Paridad
	#10 PS2_DAT <= 1;//Final

end
// generate clock to sequence tests
always
begin
PS2_CLK <= 1; clk <= 1; # 5; PS2_CLK <= 0; clk <= 0; # 5;
end

endmodule