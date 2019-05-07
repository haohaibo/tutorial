#include <iostream>
#include <memory>

using namespace std;

template<class T>
void foo(const unique_ptr<T>& ptr) {
    cout << *ptr << endl;
}

void bar(int* x)
{
    std::cout << *x << std::endl;
}
// possible overload, if needed
//    template<class T>
//    void foo(const unique_ptr<const T>& ptr) {
//        cout << *ptr << endl;
//    }

int main() {
    unique_ptr<const int> ptr1 = make_unique<const int>(7);
    const unique_ptr<const int> ptr2 = make_unique<const int>(9);
    unique_ptr<int> ptr3 = make_unique<int>(11);
    const unique_ptr<int> ptr4 = make_unique<int>(13);
    foo(ptr1);
    foo(ptr2);
    foo(ptr3);
    foo(ptr4);
    int* p = new int(233);
    std::cout << *ptr4 << std::endl;
    std::cout << *p << std::endl;
    foo(unique_ptr<int>(p));
    bar(new int(222));
}
