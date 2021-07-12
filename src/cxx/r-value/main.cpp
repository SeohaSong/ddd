#include <iostream>


using namespace std;


int& getRValueAsLValue(int&& val)
{
    return ++val;
}

void checkRValueAddress(int&& val)
{
    cout << &val << endl;
}
void checkRValueAddress(const char&& val)
{
    cout << (void*)&val << endl;
}
void checkRValueAddress(const char*&& val)
{
    for (; *val; cout << (void*)val++ << endl);
}

int getRValue()
{
    return 0;
}


int main()
{
    cout << &getRValueAsLValue(0) << endl;
    int& val = getRValueAsLValue(0);
    cout << &val << endl;
    cout << val << endl;
    getRValueAsLValue(10);
    cout << val << endl;
    cout << endl;

    checkRValueAddress(1);
    checkRValueAddress(1 + 1);
    checkRValueAddress('a');
    cout << endl;

    checkRValueAddress("a");
    checkRValueAddress("a");
    cout << endl;

    int&& r_val1 = getRValue();
    cout << &r_val1 << endl;
    int&& r_val2 = getRValue();
    cout << &r_val2 << endl;

    return 0;
}
