#include <iostream>


using namespace std;


int& getRvalueAsLvalue(int&& val)
{
    cout << &val << endl;
    return ++val;
}

void checkRvalueAddress(int&& val)
{
    cout << &val << endl;
}


int getRvalue()
{
    return 0;
}


int main()
{
    cout << &getRvalueAsLvalue(0) << endl;

    int& val = getRvalueAsLvalue(0);
    cout << val << endl;
    getRvalueAsLvalue(10);
    cout << val << endl;

    checkRvalueAddress(1);
    checkRvalueAddress(1 + 1);

    int&& rvalue = getRvalue();
    cout << &rvalue << endl;

    return 0;
}
