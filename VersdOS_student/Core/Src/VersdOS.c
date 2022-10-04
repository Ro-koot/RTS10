/*
 * Copyright 2015 Daniel Versluis
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 * schedule.h
 *
 *  Created on: 12 nov. 2013
 *      Author: Daniel Versluis
 *       Email:	VersD @ hr.nl
 *
 * Description:
 * Contains the scheduler and the systick ISR.
 * Simple and incomplete implementation.
 *
 */
#include <stdlib.h>
#include <stdbool.h>
#include <stm32f4xx.h>
#include "VersdOS.h"

//The (external) assembly functions
void pushRegistersToCurrentPSP(void);
void popRegistersFromCurrentPSP(void);
void * readPSP(void);
void writePSP(void * ptr);
void returnToPSP(void);
void returnToMSP(void);

#define TASK_MASK MAX_TASKS-1
#define IDLE_TASK MAX_TASKS

//What states can our task have?
enum taskState {UNUSED = 0, RUNNING, READY};

//The task itself
typedef struct _task{
	int             *stack;		// pointer to the stack on the heap
	uint32_t		counter;	// a counter for delays
	void (*function)(void);		// function to execute
	enum taskState	state;		// state
	int8_t			priority;	// priority
} task;

// List of tasks
//add one space for idle task
task taskList[MAX_TASKS+1];
task * currentTask;
task * taskToExecute;

// Idle task
void idleTask(void)
{
	while (1)
	{
		__asm(" wfi"); // Sleep until next SysTick
	}
}



void addTaskToListAtIndex(void (*function)(void), uint32_t stackSize, int8_t priority, size_t pos, bool privileged)
{
	task *taskToAdd = &taskList[pos];

	taskToAdd->function = function;
	// Allocate memory... do we wanna use malloc or our own implementation ;-) ?
	taskToAdd->stack = (int *)malloc(stackSize)+stackSize;

	/*
	 * For debugging purposes we initialize the stack with
	 * values that we can recognize.
	 */
	*(--(taskToAdd->stack)) 	= 0x01000000;					//XSPR Thumb bit set
	*(--(taskToAdd->stack)) 	= (int)taskToAdd->function; 	//set PC to function pointer, cast as int to silence the compiler
	*(--(taskToAdd->stack)) 	= 0xFFFFFFFD; 					//LR, return with process stack (PSP)
	*(--(taskToAdd->stack)) 	= 0x0000000C;					//R12	Initial values used for debugging purposes
	*(--(taskToAdd->stack)) 	= 0x00000003;					//R3
	*(--(taskToAdd->stack)) 	= 0x00000002;					//R2
	*(--(taskToAdd->stack)) 	= 0x00000001;					//R1
	*(--(taskToAdd->stack)) 	= 0x00000000;					//R0

	if(pos!=IDLE_TASK)
	{
		*(--(taskToAdd->stack)) 	= 0x0000000B;					//R11
		*(--(taskToAdd->stack)) 	= 0x0000000A;					//R10
		*(--(taskToAdd->stack)) 	= 0x00000009;					//R9
		*(--(taskToAdd->stack)) 	= 0x00000008;					//R8
		*(--(taskToAdd->stack)) 	= 0x00000007;					//R7
		*(--(taskToAdd->stack)) 	= 0x00000006;					//R6
		*(--(taskToAdd->stack)) 	= 0x00000005;					//R5
		*(--(taskToAdd->stack)) 	= 0x00000004;					//R4

		// Initialize the task properties
		taskToAdd->state 		= READY;
	}else{
		taskToAdd->state 		= RUNNING;
		currentTask = taskToAdd;
		// Update the CPU PSP with our new stack pointer
		writePSP(taskToAdd->stack);
	}

	taskToAdd->priority 	= priority;
}

/*
 * Function to add a new task to the taskList
 * Not sorted, prioritized or any of that kind.
 *
 * It simply allocates memory for the new task stack,
 * fills the stack up so that the context switch will
 * successfully pop these registers and start running
 * at the correct address when returning from the SysTick ISR
 */
void addTaskToList(void (*function)(void), uint32_t stackSize, int8_t priority, bool privileged)
{
	size_t i = 0;
	// Simply find the next empty slot
	// Loops when no more slots are available
	while(taskList[i].state != UNUSED)
	{
		//increment i and roll back at the limit
		i++;
		i &= TASK_MASK;
	}
	addTaskToListAtIndex(function, stackSize, priority, i, privileged);
}

void startVersdOS(uint16_t sysTickPeriodIn_ms) {
	// Configure SysTick of 1 ms
	SysTick->LOAD = sysTickPeriodIn_ms * CLOCK_FREQ_IN_KHz - 1;
	SysTick->VAL = 0;
	SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk //Clock source selection = Processor clock (AHB)
					| SysTick_CTRL_TICKINT_Msk //Counting down to zero to asserts the SysTick exception request
					| SysTick_CTRL_ENABLE_Msk; //Counter enable

	//set systick and pendsv interrupt priority to lowest.
	//svc will be highest.
	SCB->SHP[2] |= 0xFF<<24;
	SCB->SHP[2]  |= 0xFF<<16;

	// Create Idle task
	addTaskToListAtIndex(idleTask, 128, -1, IDLE_TASK, UNPRIVILEGED);
	__set_CONTROL(1);								// set control bit (npriv) to (un)privileged mode

	__asm(" wfi"); // Sleep until next SysTick
}

// currentTask is running now, return next task to run
task * schedule()
{
	task* tempTaskPtr = currentTask;
	task *idleTaskPtr = &taskList[IDLE_TASK];
	//tempTaskPtr->state = READY;													// current task state = ready

	int teller=0;

	//Find next ready, non idle task.											// -> do while will always execute once
	do																			// zolang volgende taak niet klaar is, en er door de hele lijst is gelopen
	{
		if (tempTaskPtr->counter == 0 && tempTaskPtr != idleTaskPtr){
			tempTaskPtr->state = READY;
		}
		else if (tempTaskPtr != idleTaskPtr){
			tempTaskPtr->counter--;
			tempTaskPtr++;
		}

		if( (tempTaskPtr-1) == idleTaskPtr || tempTaskPtr == idleTaskPtr)		// eind van de lijst -> naar begin weer gaan
		{
			//since idle task is the last in the list, we've reached the end
			//and need to continue at the beginning
			tempTaskPtr = &taskList[0];
		}
	}while(tempTaskPtr->state != READY && teller++ < MAX_TASKS);

	//if no task was found
	if(tempTaskPtr->state != READY)
	{
		//idle task
		tempTaskPtr = idleTaskPtr;
	}

	return tempTaskPtr;
}

// flag used in blocking_delay function
bool SysTick_flag;
// counter used in non_blocking_delay function
unsigned int tick_delay;

/*
 * Interrupt routine for the Systick timer
 * simply calls the scheduler
 * */
void SysTick_Handler(void)
{
	//SysTick_flag = true;
	//select the next task
	taskToExecute = schedule();
	//request context switch
	SCB->ICSR |= (1<<28);						// for PendSV_Handler
}

__attribute__((naked)) // No function entry and exit code
void PendSV_Handler(void)
{
	//Push {R4-R11} context to PSP
	pushRegistersToCurrentPSP();
	//Save the new stack pointer after the push
	currentTask->stack = readPSP();

	currentTask = taskToExecute;

	//Load the new stack pointer from (new) currentTask
	writePSP(currentTask->stack);

	//Pop {R4-R11} context from PSP
	popRegistersFromCurrentPSP();

	returnToPSP();
}

/* The most simple SVC implementation
 */
void SVC_Handler(void)
{

	// Get svc and systickperiod from psp stack
	uint32_t *psp_address;
	uint32_t *pc_address;
	uint32_t svc_number;
	uint32_t sysTickPeriodInMs;
	psp_address = (uint32_t *)__get_PSP();						// retrieve address of psp
	sysTickPeriodInMs = *psp_address;							// send value of address of psp to variable
	pc_address = (uint32_t *)*(psp_address + 6);
	svc_number = *(pc_address-1);								// try to filter out the value 2.
	svc_number &= (0x00FF0000);
	svc_number = svc_number >> 16;
	switch(svc_number)
	{
		case 1:
			currentTask->state = RUNNING;
			currentTask->counter = tick_delay + 1;
			taskToExecute = schedule();
			SCB->ICSR |= (1<<28);
			break;
		case 2:
			if (sysTickPeriodInMs < 10){
				SysTick->CTRL = 0;

				SysTick->LOAD = sysTickPeriodInMs * CLOCK_FREQ_IN_KHz - 1;
				SysTick->VAL = 0;
				SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk //Clock source selection = Processor clock (AHB)
								| SysTick_CTRL_TICKINT_Msk //Counting down to zero to asserts the SysTick exception request
								| SysTick_CTRL_ENABLE_Msk; //Counter enable

			}
			break;
	}

	//determine what to do based on the svc number and systick period.

}

//Call Super Visor
void taskYield(void)
{
	asm("	svc #1");											// Calls function SVC_Handler
																// interrupt returns to msp with pushing certain registers to stack
}

void ChangeSystick(uint32_t sysTickPeriodIn_ms)
{
	asm("	svc #2");											// Calls function SVC_Handler
}

// make a funtion that returns the given value of svc call
/*void SVC_Handler(void)
{
	uint32_t svcNumber = getSVCallValue();
	switch(svcNumber)
	{
		case 1:
			taskYield();
			break;
		case 2:
			ChangeSystick();
			break;
		default:
			break;
	}
}*/
