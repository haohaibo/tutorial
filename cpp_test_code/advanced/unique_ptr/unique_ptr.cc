#include <iostream>
#include <vector>
#include <memory>
#include <cstdio>
#include <fstream>
#include <cassert>
#include <functional>

struct B {
    virtual void bar()
    {
        std::cout << "B::bar" << std::endl;
    }
    virtual ~B() = default;

};
