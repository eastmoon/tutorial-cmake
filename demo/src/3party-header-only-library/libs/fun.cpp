#include <boost/lambda/lambda.hpp>
#include <iostream>
#include <iterator>
#include <algorithm>
#include "fun.h"

using namespace boost::lambda;

void add(int *arr, int size, int value) {
    // Create vector by array
    std::vector<int> v (arr, arr + size);
    // iterator all value in vector and run lambda equation.
    std::for_each(
        v.begin(), v.end(), std::cout << (_1 * value) << " " );
}
