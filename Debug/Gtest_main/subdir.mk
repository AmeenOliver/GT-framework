################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Gtest_main/main.cpp 

OBJS += \
./Gtest_main/main.o 

CPP_DEPS += \
./Gtest_main/main.d 


# Each subdirectory must supply rules for building sources it contributes
Gtest_main/main.o: ../Gtest_main/main.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/Users/mac/project/unitest/Sources/Headers" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"Gtest_main/main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


