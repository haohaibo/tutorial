#include <iostream>

template <bool isA, bool isB>
void func(int a, int b, int c) {
  if (isA)
    std::cout << "isA" << std::endl;
  else
    std::cout << "not A" << std::endl;
}
int main() {
  int a = 1, b = 2, c = 2;
  bool isA;
  std::cin >> isA;
  if (isA)
    func<true, false>(a, b, c);
  else
    func<false, false>(a, b, c);
}
