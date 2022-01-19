#include <iostream> // header in standard library
#include "tclass.h" // header in local directory
#include <public.h>

using namespace demo;
using namespace std;

void tclass::call_public()
{
    std::cout << _PROJECT_VERSION_ << std::endl;
}
