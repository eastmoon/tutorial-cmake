// CMakeApp.cpp: 定義應用程式的進入點。
//

#include "CMakeApp.h"

using namespace std;
using namespace boost::lambda;

int main()
{
	cout << "Hello CMake." << endl;
	cout << "This demo test for std:cout." << endl;
  // Create vector by array
  // arr[number] = arr + number
  // sizeof(arr) / sizeof(int) equal array length
  std::vector<int> v = { 5, 7, 9, 4, 6, 8 };
  // iterator all value in vector and run lambda equation.
  std::for_each(
      v.begin(), v.end(), std::cout << (_1 * 3) << " ");

	return 0;
}
