#include <stdio.h>
#include <iostream>
using namespace std;

int main() {
  int N, sum = 0;
  int weight[17] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
  char map[11] = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};
  string id;
  scanf("%d", &N);
  int correct = N;
  int temp_N = N, flag;
  while (temp_N >= 1) {
    cin >> id;
    sum = 0;
    flag = 1;
    for (int i = 0; i < 17; ++i) {
      if (id[i] >= '0' && id[i] <= '9') {
        sum += weight[i] * (int)(id[i] - '0');
      } else {
        flag = 0;
        break;
      }
    }
    if (id[17] != map[sum % 11] || flag == 0) {
      cout << id << endl;
      --correct;
    }
    --temp_N;
  }
  if (correct == N) {
    printf("All passed\n");
  }
  return 0;
}
