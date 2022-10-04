// Author: Daniel Versluis
// Email: VersD@hr.nl
// Description: Contains all neccesary low-level functions
// for pushing and popping CPU/Stack

		.thumb
		.syntax unified

        .global pushRegistersToCurrentPSP
        .global popRegistersFromCurrentPSP
        .global readPSP
        .global writePSP
        .global returnToPSP
        .global returnToMSP
       // .global SVC_Handler
		
pushRegistersToCurrentPSP:
		MRS 	r0	, psp			//Move PSP to register R0 (the function argument)
		STMDB 	r0!	, {r4-r11}		//Store multiple registers decrement address before each access,
									//when done write back last used address to %0 (new SP location)
		MSR 	psp	, r0			//Move register %0 to psp to update to the new SP, output to scratch
		MOV		PC	, LR			//return by moving link-register to program counter

popRegistersFromCurrentPSP:
		MRS 	R0	, psp			//Move PSP to register R0
		LDMIA 	R0!	, {r4-r11}		//Load multiple registers increment address after each access,
									//when done write back last used address to R0 (new SP location)
		MSR 	psp	, R0			//Move register R0 to psp to update to the new SP, output to scratch
		MOV		PC	, LR			//return by moving link-register to program counter

readPSP:
		MRS 	R0 , psp			//move psp to r0
		MOV		PC	, LR			//return by moving link-register to program counter

writePSP:
    	MSR 	psp	, R0			//Move r0 to psp.
    	ISB							//flush pipeline
		MOV		PC	, LR			//return by moving link-register to program counter

returnToPSP:
		ldr 	lr, =0xFFFFFFFD         //terug met process stack
		bx		lr

returnToMSP:
		ldr 	lr, =0xFFFFFFF9         //terug met process stack
		bx		lr

