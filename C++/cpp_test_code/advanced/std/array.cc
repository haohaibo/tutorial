#include <array>
#include <iostream>

int main() {
  std::array<int, 3> a1{{1, 2, 3}};
  for (int i = 0; i < 3; ++i) {
    std::cout << a1[i] << " ";
  }
  std::cout << "\n";
  return 0;
}
