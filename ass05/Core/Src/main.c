/* main.c simple program to test assembler program */

#include <stdio.h>

extern int multiply(int a, int b);

int main(void)
{
	extern void initialise_monitor_handles(void);
	initialise_monitor_handles();

	int a = multiply(10505, 35489);
    printf("Result of test(3, 5) = %d\n", a);
    return 0;
}
