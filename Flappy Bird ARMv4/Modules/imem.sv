module imem(input logic [31:0] a,
output logic [31:0] rd);
logic [31:0] RAM[255:0];
initial
$readmemh("D:/Projects/Digital-Design-Workshop/Flappy Bird ARMv4/HexCode.txt",RAM);
assign rd = RAM[a[31:2]]; // word aligned
endmodule  