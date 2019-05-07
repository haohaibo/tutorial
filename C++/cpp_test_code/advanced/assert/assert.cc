#include <iostream>
#include <cassert>

int main()
{
    bool value = false;

    assert(value && "value must be true");

    return 0;
}
