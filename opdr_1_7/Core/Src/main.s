  .syntax unified
  .cpu cortex-m4
  .thumb
  .text
  .global main
main:
		LDR.N R0, =0x42000000 + 0x00023830 * 32 + 3 * 4
		MOVS.N R1, #0x01
		STR.N R1, [R0, #0]

		LDR.N R0, =0x40020C00
		MOVS.N R1, #0b01010101
		LSLS.N R1, R1, #24
		STR.N R1, [R0, #0]
		MOVS.N R1, #0b1001
		LSLS.N R1, R1, #12
		STR.N R1, [R0, #0x14]
		B.N		main
