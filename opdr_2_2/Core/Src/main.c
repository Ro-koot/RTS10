#include <stdint.h>
#include <stm32f4xx.h>

int main(void)
{
	// GPIO Port D Clock Enable
	RCC->AHB1ENR = RCC_AHB1ENR_GPIODEN;
	// GPIO Port D Pin 15 down to 12 Push/Pull Output
	GPIOD->MODER = GPIO_MODER_MODER12_0 | GPIO_MODER_MODER13_0 | GPIO_MODER_MODER14_0 | GPIO_MODER_MODER15_0;
	// Set green and red LEDs
	GPIOD->ODR = 0x5000;
	/* There is something missing here ... = /* ... and here */
	// Do forever:
	while (1)
	{
		// Wait a moment
		for (volatile int32_t i = 0; i < 1000000; i++);
		// Flip all LEDs
		GPIOD->ODR ^= 0xF000;
		/* There is something missing here ... ^= /* ... and here */
	}
}
