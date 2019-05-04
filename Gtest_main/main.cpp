/*
 * main.cpp
 *
 *  Created on: 21 avr. 2019
 *      Author: mac
 */
#include <iostream>
using namespace std;
#include "gtest/gtest.h"
#include "Fibonacci.h"

int main(int argc, char **argv){
	testing::InitGoogleTest(&argc,argv); // @suppress("Function cannot be resolved")
	return RUN_ALL_TESTS();
}


