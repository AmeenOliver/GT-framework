CPP_SRC=Sources/Sources/
HDR_SRC=Sources/Headers
EXEC_DIR=Build
GTES_CPP=GTestLibrary/gtest
TEST_CPP=Tutos_SUT
GTES_HDR=GTestLibrary
TOOLS_DIR := lcov-master/bin
GTEST_FRAME := ../../../Tools/googletest/scripts
LCOV    := $(TOOLS_DIR)/lcov
GENHTML := $(TOOLS_DIR)/genhtml
GENDESC := $(TOOLS_DIR)/gendesc
GENPNG  := $(TOOLS_DIR)/genpng
GCOVR	:= C:/cygwin64/bin/gcovr
CCC=gcc
CXX=g++
APPS_NAME := exec
CXXFLAGS= -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -lpthread -std=c++11

DEPENDENCIES = $(EXEC_DIR)/Fibonacci.o $(EXEC_DIR)/gtest_main.o $(EXEC_DIR)/main.o $(EXEC_DIR)/gtest-all.o 
## -ftest-coverage -fprofile-arcs
all: run coverage
run: Fibonacci.o gtest_main.o main.o gtest-all.o 
	$(CXX) -lpthread -ftest-coverage -fprofile-arcs  -o $(EXEC_DIR)/$(APPS_NAME) $(DEPENDENCIES)
	./$(EXEC_DIR)/exec --gtest_output="xml:hello.xml"

Qa :
	@cppcheck --enable=all --inconclusive --xml --xml-version=2 $(CPP_SRC) 2> cppcheck.xml
Fibonacci.o : Sources/Sources/Fibonacci.cpp
	$(CXX) $(CXXFLAGS) -I "$(HDR_SRC)" -ftest-coverage -fprofile-arcs -c $< -o $(EXEC_DIR)/$@ 

gtest-all.o : $(GTES_CPP)/*.cc
	$(CCC) $(CXXFLAGS) -I "$(GTES_HDR)"  -c $< -o $(EXEC_DIR)/$@ 
%.o : Gtest_main/%.cpp
	$(CXX) $(CXXFLAGS) -I "$(GTES_HDR)" -I "$(HDR_SRC)"  -c $< -o $(EXEC_DIR)/$@ 
clean :
	rm $(EXEC_DIR)/*.o $(EXEC_DIR)/*.d $(EXEC_DIR)/$(APPS_NAME)  $(EXEC_DIR)/*.info \
	$(EXEC_DIR)/*.gcda $(EXEC_DIR)/*.gcno 

test_coverage:
	@perl $(LCOV) --zerocounters --directory Build
	./$(EXEC_DIR)/exec
	@perl $(LCOV) --rc lcov_branch_coverage=1 --base-directory Build --capture --directory Build --output-file Build/$(APPS_NAME).info --test-name $(APPS_NAME)_test

coverage : test_coverage
	@perl $(GENHTML) --rc lcov_branch_coverage=1 --branch-coverage Build/$(APPS_NAME).info  --output-directory $(EXEC_DIR)/output --title "$(APPS_NAME) example" --legend