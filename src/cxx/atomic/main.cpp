#include <iostream>
#include <thread>
#include <vector>
#include <atomic>


using namespace std;


class Bomb
{
public:
    Bomb* operator++(int val)
    {
        cout << "Bomb::operator++ " << val << endl;
        return this;
    }
    void print()
    {
        cout << "Bomb::print" << endl;
    }
};


void add(atomic<int>& counter)
{
    for (int i = 0; i < 10000; i++)
    {
        counter++;
    }
}


int main()
{
    atomic<int> counter(0);

    vector<thread> workers;
    for (int idx = 0; idx < 4; idx++)
    {
        workers.push_back(thread(add, ref(counter)));
    }
    for (int idx = 0; idx < 4; workers[idx++].join());

    cout << "result: " << counter << endl;

    atomic<Bomb*> bomb;
    (*bomb)++->print();

    return 0;
}
