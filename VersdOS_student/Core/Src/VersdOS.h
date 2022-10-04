/*
 * VersOS.h
 *
 *  Created on: 12 nov. 2013
 *      Author: VersD @ hr.nl
 *
 */

#ifndef VERSDOS_H_
#define VERSDOS_H_

#include <stdint.h>

// define the clock frequency you use. You have to configure it YOURSELF!
#define CLOCK_FREQ_IN_KHz 100000
// define the max number of task you can use
#define MAX_TASKS 4 // MUST be a power of 2
// define priviledged or unpriviledged state
enum {PRIVILEGED, UNPRIVILEGED};

// Add new task to the taskList
// priority can be between 0 and 127, higher number means higher priority
void addTaskToList(void(*function)(void), uint32_t stackSize, int8_t priority, bool priviledged);
// Start OS
void startVersdOS(uint16_t sysTickPeriodIn_ms);

#endif /* VERSDOS_H_ */
