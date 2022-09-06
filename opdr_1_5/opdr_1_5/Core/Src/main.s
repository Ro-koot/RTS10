		.syntax unified
		.cpu cortex-m4
		.thumb
		.text
		.global main
main:	// initialisation in Pinky machine code
		.short  0x2008, 0x4905, 0x6008, 0x2055
		.short  0x0600, 0x4904, 0x6008, 0x2000
		.short  0x4903, 0x6008, 0x230f, 0x031b
		// literals needed by machine code
		.word	0x40023830, 0x40020c00, 0x40020c14
		// loop in Pinky assembler code
loop:   LDR.N   R2, =1333332 // just some random value!
wait:	SUBS.N  R2, #1
		BNE.N   wait
		NOP.N
		// toggle leds
		EORS.N  R0, R0, R3
		STR.N   R0, [R1, #0]
		B.N		loop
