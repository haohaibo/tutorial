/*
*
*      Filename: L1-030.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-06 09:08:22
* Last Modified: 2017-05-06 10:27:05
**/
#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;

typedef struct {
  int gender;
  char name[10];
  bool match;
} STU;

int main() {
  int N;
  scanf("%d", &N);
  STU *stu = (STU *)malloc(N * sizeof(STU));
  int i = 0;
  int temp = N;
  while (--temp >= 0) {
    scanf("%d", &stu[i].gender);
    // 这里要注意输入的名字中间可能会带有空格
    getchar();
    gets(stu[i].name);
    stu[i].match = false;
    ++i;
  }

  int count = 0;
  int j = 0, k;
  while (count < N) {
    k = N - 1;
    while (k > j) {
      if ((stu[j].gender + stu[k].gender) == 1 && stu[j].match == false &&
          stu[k].match == false) {
        stu[j].match = true;
        stu[k].match = true;
        printf("%s %s\n", stu[j].name, stu[k].name);
        ++j;
        count += 2;
        break;
      }
      --k;
    }
  }
  return 0;
}
