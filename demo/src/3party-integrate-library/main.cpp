#include <boost/lambda/lambda.hpp>
#include <iostream>
#include <iterator>
#include <algorithm>

using namespace boost::lambda;

int main()
{
    // Create vector by array
    // arr[number] = arr + number
    // sizeof(arr) / sizeof(int) equal array length
    int arr[] = {1,2,3};
    std::vector<int> v (arr, arr + sizeof(arr) / sizeof(int) );
    // iterator all value in vector and run lambda equation.
    std::for_each(
        v.begin(), v.end(), std::cout << (_1 * 3) << " " );
}
