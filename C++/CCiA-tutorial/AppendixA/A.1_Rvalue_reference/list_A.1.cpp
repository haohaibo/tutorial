/*
*
*      Filename: list_A.1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-04 17:09:21
* Last Modified: 2017-06-04 20:44:33
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

        // move constructor
        // just copy the pointer to the data and leave the other instance 
        // with a null pointer
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

