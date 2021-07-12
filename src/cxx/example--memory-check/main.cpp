#include <iostream>
#include <unistd.h>


using namespace std;


void printMemory()
{
    int failed = 0;
    static char cmd[256];
    cout << "=========================================================" << endl;
    sprintf(cmd, "cat /proc/%d/maps", getpid());
    failed = system(cmd);
    cout << "---------------------------------------------------------" << endl;
    sprintf(cmd, "pmap %d", getpid());
    failed = system(cmd);
    cout << "=========================================================" << endl;
}


int main()
{
    printMemory();
    return 0;
}
