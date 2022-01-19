#include <iostream> // header in standard library
#include "test_class_so.h" // header in local directory

using namespace demo;
using namespace std;

int test_class_so::do_something(int _x)
{
    return 2 * _x;
}
