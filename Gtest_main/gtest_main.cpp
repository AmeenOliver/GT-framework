/*
 * gtest_main.cpp
 *
 *  Created on: 21 avr. 2019
 *      Author: mac
 */
#include "gtest/gtest.h"
#include "Fibonacci.h"

TEST(TestFibonacci, TestFunctionsResults){
	EXPECT_EQ(fibonacci(1) , 1);
	EXPECT_EQ(fibonacci(10) , 55);
	EXPECT_EQ(fibonacci(16) , 987);
	EXPECT_EQ(fibonacci(19) , 4181);
}

