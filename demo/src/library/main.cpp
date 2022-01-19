#include <iostream>
#include <iterator>
#include <algorithm>
#include <def.h>
#include <classes/test_class.h>
#include <classes/test_class_so.h>

int main()
{
    std::cout << "Hello World!!!" << std::endl;
    std::cout << _PROJECT_VERSION_ << std::endl;

    demo::test_class t1;
    std::cout << "Use library classes" << std::endl;
    std::cout << t1.do_something(1) << std::endl;
    std::cout << t1.do_something(3) << std::endl;

    demo::test_class_so t2;
    std::cout << "Use library classes_so" << std::endl;
    std::cout << t2.do_something(1) << std::endl;
    std::cout << t2.do_something(3) << std::endl;
}
