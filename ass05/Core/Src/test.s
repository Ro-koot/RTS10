	.cpu cortex-m4
	.thumb
	.syntax unified
	.globl multiply
	.text
	.thumb_func
multiply:
	MOVS.N R2, R1				// 3e variabele wordt b
	MOVS.N R1, R0				// 2e variabele wordt a
	MOVS.N R0, #0				// m wordt 0
multiply2:
	CMP.N R2, #0				//--> compare B met 0
	BNE.N skip1					//--> Niet gelijk aan 0? skip naar skip1
	MOVS.N R0, #0				//--> Wel gelijk aan 0? Move de waarde 0 naar R0 (return)
	BX.N LR						//--> return naar eerdere laag code
skip1:
	CMP.N R2, #1				//--> compare B met 1
	BNE.N skip2					//--> niet gelijk aan 1? skip naar skip2
	ADDS.N R0, R0, R1			//--> wel gelijk aan 1? Tel a bij m op in return waarde
	BX.N LR						//--> return naar eerdere laag code
skip2:
	MOVS.N R3, #1				//--> Maak R3 gelijk aan b
	ANDS.N R3, R2				//--> bitmask zodat de eerste bit alleen gezien wordt, return op R3
	CMP.N R3, #0				//--> is R3 gelijk aan 0?
	BNE.N skip3					//--> Nee? skip3, Ja, ga door
	LSLS.N R1, R1, #1			//--> Left shift A met 1 bit
	LSRS.N R2, R2, #1			//--> right shift B met 1 bit
	B.N multiply2				//--> recurse de functie door te springen naar de functienaam opnieuw
skip3:
	ADDS.N R0, R0, R1			//--> Tel m bij a op
	LSLS.N R1, R1, #1			//--> Left shift a met 1
	LSRS.N R2, R2, #1			//--> right shift b met 1
	B.N multiply2
