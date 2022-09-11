	.cpu cortex-m4
	.thumb
	.syntax unified
	.globl multiply
	.text
	.thumb_func
multiply:
	MOVS.N R2, #0				// making variable for return value, R2 = m, R3 = i
	MOVS.N R3, #0
check:
	CMP.N	R0, #0				// if A = 0
	BNE.N 	loop				// als ie niet gelijk is aan 0, jump naar loop
	MOVS.N 	R0, R2				// return M als return waarde
	BX.N	LR					// weten we niet helemaal zeker
loop:
	ADD.N	R2, R2, R1			// m = m + b
	SUBS.N	R0, #1				// A = A - 1
	B.N		check
