module decoder(input logic [1:0] Op,
					input logic [5:0] Funct,
					input logic [3:0] Rd,
					output logic [1:0] FlagW,
					output logic PCS, RegW, MemW,
					output logic MemtoReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc, ALUControl);
					
logic [9:0] controls;
logic Branch, ALUOp;

always_comb
casex(Op)
	// inmediato
	2'b00: if (Funct[5]) controls = 10'b0000101001;
	// Procesa registros en vez de inmediatos
	else controls = 10'b0000001001;
	// load a registros
	2'b01: if (Funct[0]) controls = 10'b0001111000;
	// STR
	else controls = 10'b1001110100;
	// B
	2'b10: controls = 10'b0110100010;
	// Unimplemented
	default: controls = 10'b0000000000;
endcase
//asigna todas
assign {RegSrc, ImmSrc, ALUSrc, MemtoReg,
			RegW, MemW, Branch, ALUOp} = controls;
// ALU Decoder

always_comb
if (ALUOp) begin //deco operaciones ALU
	case(Funct[4:1])
		4'b0100: ALUControl = 2'b00; // ADD
		4'b0010: ALUControl = 2'b01; // SUB
		4'b0000: ALUControl = 2'b10; // AND
		4'b1100: ALUControl = 2'b11; // ORR
		default: ALUControl = 2'b00; // añadir siguientes
	endcase
	FlagW[1] = Funct[0];
	FlagW[0] = Funct[0] &
	(ALUControl == 2'b00 | ALUControl == 2'b01);
end else begin

	ALUControl = 2'b00; 
	FlagW = 2'b00; 
end
// PC Logic
assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule
