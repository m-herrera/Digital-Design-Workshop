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
		ADD		R6, R0, #500
		STR		R6, [R1, #20]
		ADD		R7, R0, #342
		STR		R7, [R1, #24]
		ADD		R8, R0, #200
		STR		R8, [R1, #28]
		ADD		R9, R0, #-30
		STR		R9, [R1, #32]
		ADD		R10, R0, #500
		STR		R10, [R1, #36]
		ADD		R11, R0, #-50
		STR		R11, [R1, #40]
		
inicio	LDR		R12, [R1, #0x100]
		SUBS		R11, R12, #0
		BEQ		inicio
		STR		R12, [R1, #0x100]
		
		SUB		R4, R4, #1
		STR		R4, [R1, #12]
		SUB		R6, R6, #1
		STR		R6, [R1, #20]
		SUB		R8, R8, #1
		STR		R8, [R1, #28]
		SUB		R10, R10, #1
		STR		R10, [R1, #36]
		B		inicio
