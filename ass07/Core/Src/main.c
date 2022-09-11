/* main.c simple program to test assembler program */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

extern int power(int a, int b);
extern int multiply(int a, int b);

int tothepower(int a, int b){
	int result = 1;
	for (int i = 0; i < b; i++){
		result = result * a;
	}
	return result;
}

int main(void)
{
	extern void initialise_monitor_handles(void);
	initialise_monitor_handles();

	int base = 2;
	//int exponential = 100;
	int a = 0;
	int b = 0;
	int result_assembly = 0;
	int result_c = 0;
	int succesful = 0;
	int failed = 0;

	for (int i = 0; i < 20; i++){
		a = rand() % 5;
		b = rand() % 10;

		result_assembly = power(a, b);
		result_c = tothepower(a, b);

		if (result_assembly == result_c){
			succesful++;
		}
		else{
			failed++;
		}
	}
    return 0;
}
