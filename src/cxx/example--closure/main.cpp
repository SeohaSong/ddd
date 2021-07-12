#include <iostream>
#include <functional>


using namespace std;


function<int& ()> getClosure()
{
    static int val = 0;
    return [&]() -> int& {
        cout << &val << endl;
        return ++val;
    };
}


int main()
{
    auto countUp = getClosure();
    int& num = countUp();
    cout << &num << endl;
    cout << num << endl;
    return 0;
}
