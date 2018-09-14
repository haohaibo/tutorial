/*
*
*      Filename: dynamic_cast.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-16 15:32:18
* Last Modified: 2017-08-16 17:01:04
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

class B 
{
    public:
        virtual void Print()
        {
            std::cout << "This is class B" << std::endl;
        }
};

class C : public A, public B 
{
    public:
        virtual void Print()
        {
            std::cout << "This is class C" << std::endl;
        }
};

int main()
{
    A *pA = new C;

    //C *pC= pA; //error
    C *pC = dynamic_cast<C *>(pA);
    if(pC != NULL)
    {
        pC->Print();
    }
    
    pA->Print();
    delete pA;

    return 0;
}
