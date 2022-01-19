#include <iostream> // header in standard library
#include "tclass.h" // header in local directory
// #include <interface.h> // it will be build error, because executable could not use INTERFACE include_directories

using namespace demo;
using namespace std;

void tclass::call_interface()
{
    // std::cout << _PROJECT_VERSION_ << std::endl;
    std::cout << "Library can't use INTERFACE include_directories" << std::endl;
}
