module condlogic( input logic clk, reset,
						input logic [3:0] Cond,
						input logic [3:0] ALUFlags,
						input logic [1:0] FlagW,
						input logic PCS, RegW, MemW,
						output logic PCSrc, RegWrite,
						MemWrite);
						
logic [1:0] FlagWrite;
logic [3:0] Flags;
logic CondEx;

flopenr #(2)flagreg1(clk, reset, FlagWrite[1],
							ALUFlags[3:2], Flags[3:2]); //Registro que guarda flags de la instruccion anterior

flopenr #(2)flagreg0(clk, reset, FlagWrite[0], //Registro que guarda flags de la instruccion anterior
ALUFlags[1:0], Flags[1:0]);
// asigna condiciones en caso de que se cumpla
condcheck cc(Cond, Flags, CondEx);
assign FlagWrite = FlagW & {2{CondEx}};
assign RegWrite = RegW & CondEx;
assign MemWrite = MemW & CondEx;
assign PCSrc = PCS & CondEx;

endmodule


