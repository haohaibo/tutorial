#include <stdio.h>
#include <iostream>

using namespace std;

int main() {
  int data[3];
  scanf("%d", &data[0]);
  scanf("%d", &data[1]);
  scanf("%d", &data[2]);
  for (int i = 0; i < 2; ++i) {
    for (int j = i + 1; j < 3; ++j) {
      if (data[i] > data[j]) {
        int temp;
        temp = data[i];
        data[i] = data[j];
        data[j] = temp;
      }
    }
  }
  for (int i = 0; i < 3; ++i) {
    if (i < 2) {
      printf("%d->", data[i]);
    } else {
      printf("%d\n", data[i]);
    }
  }
  return 0;
}
