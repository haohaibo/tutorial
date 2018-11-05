/*
 *
 *      Filename: L1-025.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-05-04 15:07:36
* Last Modified: 2017-05-04 16:46:20
 **/
#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;
int main() {
  string data1, data2, str_input;
  bool flag1 = true, flag2 = true;
  int sum = 0, input1 = 0, input2 = 0;

  /* 这里要注意题目的意思和细节：
   1. 第一个空格是A和B的分隔，那么意思就是第一个空格之前的所有内容都是A的
   第一个空格之后的所有内容都是B的
   考虑乱码情况 例如: 1 3 fjdk fjd
   这样虽然可以读到1 和 3 但是后面还有乱码，这个时候B的输入就不符合要求

  */
  getline(cin, str_input);
  int pos = 0;
  pos = str_input.find_first_of(" ");
  data1 = str_input.substr(0, pos);
  data2 = str_input.substr(pos + 1);
  // cout << data1 << endl;
  // cout << data2 << endl;
  for (int i = 0; i < data1.size(); ++i) {
    if (data1[i] < '0' || data1[i] > '9') {
      flag1 = false;
      break;
    }
  }
  for (int i = 0; i < data2.size(); ++i) {
    if (data2[i] < '0' || data2[i] > '9') {
      flag2 = false;
      break;
    }
  }
  if (flag1 == false || flag2 == false) {
    if (flag1 == false) {
      cout << "? +";
    } else {
      if (atoi(data1.c_str()) < 1 || atoi(data1.c_str()) > 1000) {
        printf("? +");
      } else {
        cout << data1 << " +";
      }
    }

    if (flag2 == false) {
      cout << " ? = ?" << endl;
      ;
    } else {
      if (atoi(data2.c_str()) < 1 || atoi(data2.c_str()) > 1000) {
        printf(" ? = ?\n");
      } else {
        cout << " " << data2 << " = ?" << endl;
      }
    }

  } else {
    input1 = atoi(data1.c_str());
    input2 = atoi(data2.c_str());
    if (input1 < 1 || input1 > 1000 || input2 < 1 || input2 > 1000) {
      if (input1 < 1 || input1 > 1000) {
        printf("? +");
      } else {
        cout << data1 << " +";
      }

      if (input2 < 1 || input2 > 1000) {
        printf(" ? = ?\n");
      } else {
        cout << " " << data2 << " = ?" << endl;
      }

    } else {
      sum = input1 + input2;
      printf("%d + %d = %d\n", input1, input2, sum);
    }
  }
  return 0;
}
