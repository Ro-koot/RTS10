	.cpu cortex-m4
	.thumb
	.syntax unified
	.globl power
	.text
	.thumb_func

multiply:
	MOVS.N R2, #0				// making variable for return value, R2 = m, R3 = i
check:
	CMP.N	R0, #0				// if A = 0
	BNE.N 	loop				// als ie niet gelijk is aan 0, jump naar loop
	MOVS.N 	R0, R2				// return M als return waarde
	BX.N	LR					// weten we niet helemaal zeker
loop:
	ADD.N	R2, R2, R1			// m = m + b
	SUBS.N	R0, #1				// A = A - 1
	B.N		check

power:
	PUSH.N 	{LR}
	MOVS.N	R2, #1
	CMP.N 	R1, #0
	BNE.N	check_loop
	MOVS.N 	R0, #1
	BX.N	LR						// volgorde: R0 = n, R1 = m, R2 = p

check_loop:
	CMP.N	R1, #1
	BEQ.N	return
while_loop:
	MOVS.N	R3, #1					// r3 = 1
	ANDS.N	R3, R3, R1				// R1 is even of oneven
	CMP.N	R3, #1					//--> immediately lose function of R3
	BNE.N	skip
	MOVS.N	R3, R1
	MOVS.N	R1, R0
	MOVS.N	R0, R2
	MOVS.N	R2, R3					// volgorde: R0 = p, R1 = n, R2 = m, R3 = m
	PUSH.N	{R1, R2, R3}			//--> push value of R1R2R3 on stack
	LDR.N	R2, =multiply
	BLX.N	R2
	POP.N 	{R1, R2, R3}
	MOVS.N 	R2, R0
	MOVS.N 	R0, R1
	MOVS.N 	R1, R3					// volgorde: R0 = n, R1 = m, R2 = p, R3 = m
skip:
	PUSH.N	{R1, R2}				// behoud waarde van m en p
	MOVS.N	R1, R0					// R0 en R1 zijn n
	LDR.N	R2, =multiply
	BLX.N	R2
	POP.N 	{R1, R2}				// volgorde: R0 = n, R1 = m, R2 = p, R3 = x
	LSRS.N	R1, R1, #1
	CMP.N	R1, #1
	BNE.N	while_loop
return:
	MOVS.N 	R1, R2					// volgorde R0 = n, R1 = p, R2 = p, R3 = x
	LDR.N	R2, =multiply
	BLX.N	R2
	POP.N	{PC}
	BX.N 	LR
