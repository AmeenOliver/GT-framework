/*
 * Fibonacci.cpp
 *
 *  Created on: 6 mars 2019
 *      Author: aelyoubi
 */

#include <iostream>
#include "Fibonacci.h"

using namespace std;

int fibonacci(int number){
  if(number <= 2){
    return 1;
  } else {
    return fibonacci(number - 1) + fibonacci(number - 2);
  }
}


