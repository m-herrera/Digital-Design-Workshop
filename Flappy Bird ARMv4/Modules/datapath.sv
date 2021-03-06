module datapath(input logic clk, reset,
					input logic [1:0] RegSrc,
					input logic RegWrite,
					input logic [1:0] ImmSrc,
					input logic ALUSrc,
					input logic [1:0] ALUControl,
					input logic MemtoReg,
					input logic PCSrc,
					output logic [3:0] ALUFlags,
					output logic [31:0] PC,
					input logic [31:0] Instr,
					output logic [31:0] ALUResult, WriteData,
					input logic [31:0] ReadData);
					
logic [31:0] PCNext, PCPlus4, PCPlus8;
logic [31:0] ExtImm, SrcA, SrcB, Result;
logic [3:0] RA1, RA2;

// next PC logic
mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
flopr #(32) pcreg(clk, reset, PCNext, PC);
adder #(32) pcadd1(PC, 32'b100, PCPlus4);
adder #(32) pcadd2(PCPlus4, 32'b100, PCPlus8);

mux2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1); // mux al que entra R y el registro 15
mux2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);// entra un R y RD en caso de sw

regfile rf(clk, RegWrite, RA1, RA2,
				Instr[15:12], Result, PCPlus8,
				SrcA, WriteData);//banco de registros
				
mux2 #(32) resmux(ALUResult, ReadData, MemtoReg, Result);//selecciona datos para escribir
extend ext(Instr[23:0], ImmSrc, ExtImm); // extiende el inmediato segun la instruccion


mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);//selecciona el source
arithmetic_logic_unit #(32) alu(SrcA, SrcB, ALUControl, ALUResult, ALUFlags[3],ALUFlags[2],ALUFlags[1],ALUFlags[0]);//ALU
endmodule