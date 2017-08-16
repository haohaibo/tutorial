/*
*
*      Filename: typeid3.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-16 14:51:51
* Last Modified: 2017-08-16 15:05:42
**/
#include <iostream>
#include <typeinfo>

class A
{
    public:
        virtual void Print()
        {
            std::cout << "This is class A" << std::endl;
        }
};

class B : public A 
{
    public:
        void Print()
        {
            std::cout << "This is class B" << std::endl;
        }
};


class C : public A 
{
    public:
        void Print()
        {
            std::cout << "This is class C" << std::endl;
        }
};

void Handle(A *a)
{
    if(typeid(*a) == typeid(A))
    {
        std::cout << "I am A truly." << std::endl;
    }else if(typeid(*a) == typeid(B))
    {
        std::cout << "I am B truly." << std::endl;
    }else if(typeid(*a) == typeid(C))
    {
        std::cout << "I am C truly." << std::endl;
    }else
    {
        std::cout << "I am alone" << std::endl;
    }
}
int main()
{
    A *pA = new B();
    Handle(pA);
    delete pA;

    pA = new C();
    Handle(pA);

    return 0;
}

