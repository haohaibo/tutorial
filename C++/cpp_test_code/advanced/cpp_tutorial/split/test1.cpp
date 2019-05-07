/*
*
*      Filename: test1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-16 16:06:38
* Last Modified: 2017-08-16 16:58:48
**/
#include <string.h>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
  char s[] = "a,b*c*d,e";
  const char *d = ",*";
  char *p;
  p = strtok(s, d);
  while (p) {
    cout << p << " ";
    p = strtok(NULL, d);
  }
  cout << endl;
  return 0;
}
