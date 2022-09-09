	.cpu cortex-m4
	.thumb
	.syntax unified
	.globl test
	.text
	.thumb_func
test:
	ADD.N	R0, R0, R1
	BX.N	LR
