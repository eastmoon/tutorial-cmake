#include <iostream>
#include <date/date.h>
#include <date/tz.h>

using namespace std;
using namespace date;

int main()
{
    cout << weekday{July/4/2001} << endl;
}
