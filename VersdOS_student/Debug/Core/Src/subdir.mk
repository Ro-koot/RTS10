################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Src/VersdOS_ll.s 

C_SRCS += \
../Core/Src/VersdOS.c \
../Core/Src/main.c 

OBJS += \
./Core/Src/VersdOS.o \
./Core/Src/VersdOS_ll.o \
./Core/Src/main.o 

S_DEPS += \
./Core/Src/VersdOS_ll.d 

C_DEPS += \
./Core/Src/VersdOS.d \
./Core/Src/main.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I"C:/Users/Max Overvoorde/Documents/School/Hogeschool Rotterdam/Jaar 4/RTS10/Week 4/VersdOS_student/Core/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/Max Overvoorde/Documents/School/Hogeschool Rotterdam/Jaar 4/RTS10/Week 4/VersdOS_student/Core/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/%.o: ../Core/Src/%.s Core/Src/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/VersdOS.d ./Core/Src/VersdOS.o ./Core/Src/VersdOS.su ./Core/Src/VersdOS_ll.d ./Core/Src/VersdOS_ll.o ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su

.PHONY: clean-Core-2f-Src

