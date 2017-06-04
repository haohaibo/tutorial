/*
*
*      Filename: list_A.1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-04 17:09:21
* Last Modified: 2017-06-04 19:57:24
**/
#include <iostream>

// A class with a move constructor
class X
{
    private:
        int *data;
    public:
        X():data(new int[1000000])
        {}
        
        ~X()
        {
            delete [] data;
        }

        // copy constructor
        // the copy constructor is defined just as you might expect:
        // allocate a new block of memory and copy the data across
        X(const X &other):data(new int[1000000])
        {
            std::copy(other.data, other.data + 1000000, data);
        }

        X(X && other):data(other.data)
        {
            other.data = nullptr;
        }

};
    

int main()
{
    X a;
    return 0;
}

