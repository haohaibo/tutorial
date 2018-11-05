#include <iostream>
#include <string>

class B {
 public:
  B() { std::cout << "construct obj B" << std::endl; }
  ~B() { std::cout << "destroy obj B" << std::endl; }
};

class A {
 public:
  A() { std::cout << "construct obj A" << std::endl; }
  ~A() { std::cout << "destroy obj A" << std::endl; }
  B& addB(B* b) {
    // auto cc = new B();
    // B& ab = b;
    return *b;
  }

  void destroy() { delete this; }
};

int main() {
  {
    A* a = new A();
    B* b = new B();

    B& ab = a->addB(b);
    a->destroy();
  }

  return 0;
}
