#include <iostream>
#include <classes/tclass.h>
// #include <private.h> // it will be build error, because executable could not use PRIVATE include_directories

int main()
{
    std::cout << "Call library class tclass action" << std::endl;
    demo::tclass t;
    t.call_public();
    t.call_interface();
    t.call_private();
}
