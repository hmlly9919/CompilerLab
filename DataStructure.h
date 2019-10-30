#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <cstdio>
#include <cstdlib>

#define DEBUG 1;				  

constexpr int INT = 0;
constexpr int REAL = 1;
constexpr int STR = 2;
constexpr int VAR = 3;
constexpr int LIST = 4;

typedef int TYPE;

typedef struct Unit
{
	long val_int;					// int value
	double val_float;				// float value
	TYPE val_type;					// type
	std::string val_str; 			// string value and variable name
	std::vector <Unit*> nptr;
}U;