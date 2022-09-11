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

int test_random_numbers(int number_of_tests){

	int succesful = 0;
	int a = 0;
	int b = 0;
	int result_assembly = 0;
	int result_c = 0;

	for (int i = 0; i < number_of_tests; i++){
		a = rand() % 5;
		b = rand() % 10;

		result_assembly = power(a, b);
		result_c = tothepower(a, b);

		if (result_assembly == result_c){
			succesful++;
		}
	}
	return succesful;
}

int test_limits(){
	int succesful = 0;
	int result_assembly = 0;
	int result_c = 0;

	result_assembly = power(0, 0);
	result_c = tothepower(0, 0);

	if (result_assembly == result_c){
		succesful++;
	}

	result_assembly = power(1, 0);
	result_c = tothepower(1, 0);

	if (result_assembly == result_c){
		succesful++;
	}

	result_assembly = power(0, 1);
	result_c = tothepower(0, 1);

	if (result_assembly == result_c){
		succesful++;
	}

	result_assembly = power(1, 1);
	result_c = tothepower(1, 1);

	if (result_assembly == result_c){
		succesful++;
	}
	result_assembly = power(2, 31);
	result_c = tothepower(2, 31);

	if (result_assembly == result_c){
		succesful++;
	}
	return succesful;
}

int main(void)
{
	extern void initialise_monitor_handles(void);
	int tests_per_test = 20;
	initialise_monitor_handles();
	int succesful = 0;

	succesful = test_random_numbers(tests_per_test) + test_limits();

	printf("%d of the %d tests have succeeded\r\n", succesful, (tests_per_test + 5));

    return 0;
}
