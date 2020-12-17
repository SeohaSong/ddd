#include <iostream>
#include <chrono>

#include "gtest/gtest.h"


#define SIZE 1000000

using namespace std;
using namespace std::chrono;


system_clock::time_point start;
duration<float> cost;
int arr[SIZE];
int sum;


void runLoops(int (&arr)[SIZE])
{
    start = system_clock::now();
    sum = 0;
    for (int idx = 0; idx < SIZE; idx++)
    {
        sum += arr[idx];
    }
    cout << (system_clock::now() - start).count() << endl;
    start = system_clock::now();
    sum = 0;
    int idx = -1;
    while (++idx < SIZE)
    {
        sum += arr[idx];
    }
    cout << (system_clock::now() - start).count() << endl;
    start = system_clock::now();
    sum = 0;
    for (int &val: arr)
    {
        sum += val;
    }
    cout << (system_clock::now() - start).count() << endl;
}


TEST(toy, toy)
{
    for (int &val: arr)
    {
        val = 0;
    }
    runLoops(arr);
}
