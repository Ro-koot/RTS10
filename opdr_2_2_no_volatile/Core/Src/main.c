#include <stdint.h>

#define RCC_AHB1ENR_BIT_GPIODEN *(uint32_t*)(0x42000000 + 0x00023830 * 32 + 3 * 4)
#define GPIOD_BASE 0x40020C00
#define GPIOD_MODER *(uint32_t*)(GPIOD_BASE + 0x00)
#define GPIOD_ODR *(uint32_t*)(GPIOD_BASE + 0x14)
// There is something missing here ...

int main(void)
{
	// GPIO Port D Clock Enable
	RCC_AHB1ENR_BIT_GPIODEN = 1;
	// GPIO Port D Pin 15 down to 12 Push/Pull Output
	GPIOD_MODER = 0x55000000;
	// Set green and red LEDs
	GPIOD_ODR = 0x5000;
	// Do forever:
	while (1)
	{
		// Wait a moment
		for (volatile int32_t i = 0; i < 1000000; i++);
		// Flip all LEDs
		GPIOD_ODR ^= 0xF000;
	}
}
