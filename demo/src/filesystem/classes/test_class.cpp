#include <iostream> // header in standard library
#include "test_class.h" // header in local directory

using namespace demo;
using namespace std;

int test_class::do_something(int _x)
{
    return _x * _x;
}
