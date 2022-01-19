#include <iostream> // header in standard library
#include "tclass.h" // header in local directory
#include <private.h>

using namespace demo;
using namespace std;

void tclass::call_private()
{
    std::cout << _PROJECT_VERSION_ << std::endl;
}
