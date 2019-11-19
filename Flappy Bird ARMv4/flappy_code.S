		SUB		R0, R15, R15
		ADD		R1, R0, #0x4000
		ADD		R2, R0, #128
		STR		R2, [R1, #4]
		ADD		R3, R0, #208
		STR		R3, [R1, #8]
		ADD		R4, R0, #200
		STR		R4, [R1, #12]
		ADD		R5, R0, #308
		STR		R5, [R1, #16]
		ADD		R4, R0, #500
		STR		R4, [R1, #20]
		ADD		R5, R0, #348
		STR		R5, [R1, #24]
		ADD		R4, R0, #200
		STR		R4, [R1, #28]
		ADD		R5, R0, #-30
		STR		R5, [R1, #32]
		ADD		R4, R0, #500
		STR		R4, [R1, #36]
		ADD		R5, R0, #-50
		STR		R5, [R1, #40]
		ADD		R6, R0, #0
		
		INICIO:	LDR		R12, [R1, #0x100]
		SUBS		R11, R12, #0
		BEQ		INICIO
		STR		R12, [R1, #0x100]
		
		
		SUBS		R5, R6, #0
		BNE		JUMP
		LDR		R4, [R1, #0]
		
		SUBS		R4, R4, #0x29
		BNE		DISMINUIR
		STR		R4, [R1, #0]
		ADD		R6, R6, #20
		
		
		JUMP:	SUB		R6, R6, #2
		SUB		R3, R3, #2
		STR		R3, [R1, #8]
		B		ENDIF
		
		
		DISMINUIR:	ADD		R3,R3,#2
		STR		R3,[R1,#8]
		
		ENDIF:
		LDR		R4, [R1, #12]
		SUB		R4, R4, #1
		STR		R4, [R1, #12]
		
		LDR		R4, [R1, #20]
		SUB		R4, R4, #1
		STR		R4, [R1, #20]
		
		LDR		R4, [R1, #28]
		SUB		R4, R4, #1
		STR		R4, [R1, #28]
		
		LDR		R4, [R1, #36]
		SUB		R4, R4, #1
		STR		R4, [R1, #36]
		B		INICIO
