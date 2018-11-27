#include <iostream>

class Base
{
    public:
        virtual int foo(float x) = 0;
};
class Derived: public Base
{
    public:
        int foo(float x) override { return x+1;}
};
class Derived2: public Base
{
    public:
        int foo(float x) override { return x+2;}
};

int main()
{
    Derived c1;
    Derived2 c2;
    std::cout << c1.foo(2) << std::endl;
    std::cout << c2.foo(233) << std::endl;

    return 0;
}
