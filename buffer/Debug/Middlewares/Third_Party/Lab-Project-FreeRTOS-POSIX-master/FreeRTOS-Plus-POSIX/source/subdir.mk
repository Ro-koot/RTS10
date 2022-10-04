################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.c \
../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.c 

OBJS += \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.o \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.o 

C_DEPS += \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.d \
./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/%.o Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/%.su: ../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/%.c Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/include/ -I../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/include/private/ -I../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/include/FreeRTOS_POSIX -I../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/include -I../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/include/portable -I../Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/include/portable/st/stm32l475_discovery -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-Lab-2d-Project-2d-FreeRTOS-2d-POSIX-2d-master-2f-FreeRTOS-2d-Plus-2d-POSIX-2f-source

clean-Middlewares-2f-Third_Party-2f-Lab-2d-Project-2d-FreeRTOS-2d-POSIX-2d-master-2f-FreeRTOS-2d-Plus-2d-POSIX-2f-source:
	-$(RM) ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.su ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.d ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.o ./Middlewares/Third_Party/Lab-Project-FreeRTOS-POSIX-master/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-Lab-2d-Project-2d-FreeRTOS-2d-POSIX-2d-master-2f-FreeRTOS-2d-Plus-2d-POSIX-2f-source

