#include <iostream>


using namespace std;


class Box
{
    int _size = -1;
    char* _str = nullptr;

public:

    Box(const char* str)
    {
        while (str[++_size] != 0);
        _str = new char[_size + 1];
        for (int idx = 0; idx < _size; idx++)
        {
            _str[idx] = str[idx];
        }
        _str[_size] = 0;
    }

    Box(const Box& box)
    {
        cout << "Box(const Box& box)" << endl;
        _size = box._size;
        _str = new char[_size + 1];
        for (int idx = 0; idx < _size; idx++)
        {
            _str[idx] = box._str[idx];
        }
        _str[_size] = 0;
    }

    ~Box()
    {
        delete[] _str;
    }


    Box& operator=(const Box& box)
    {
        cout << "Box& operator=(const Box& box)" << endl;
        return *this;
    }


    void mutate()
    {
        for (int idx = 0; idx < _size; idx++)
        {
            _str[idx] = '_';
        }
        _str[_size] = 0;
    }

    void show()
    {
        cout << _size << " " << _str << endl;
    }
};


void test(Box box)
{
    box.mutate();
}


void printString(string*&& val)
{
    cout << *val << endl;
}

string* getString(string*&& val)
{
    val->push_back('_');
    printString(move(val));
    return val;
}


void assert(bool&& chk)
{
    if (chk)
    {
        cout << "passed" << endl;
    }
    else
    {
        cout << "failed" << endl;
        throw 0;
    }
}


int main()
{
    Box box("aaaa");
    Box box_("bbbb");
    box_ = box;
    test(box);
    box.show();

    string* val = getString(new string);
    delete val;

    string str;
    string&& str1 = move(str);
    string& str2 = str;

    assert(&str == &str1);
    assert(&str == &str2);

    return 0;
}
