#include <iostream>
#include <stdarg.h>

using namespace std;


void test(int arg_n...)
{
    va_list args;
    va_start(args, arg_n);
    
    va_list args_;
    va_copy(args_, args);
    
    for (int idx = 0; idx < arg_n + 1; idx++)
    {
        cout << va_arg(args, int) << endl;
    }
    va_end(args);

    cout << "========" << endl;

    for (int idx = 0; idx < arg_n + 1; idx++)
    {
        cout << va_arg(args_, int) << endl;
    }
    va_end(args_);
}


int main()
{
    test(3, 2, 15875, 1);
    return 0;
}
