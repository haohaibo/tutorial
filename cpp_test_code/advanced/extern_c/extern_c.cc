/*
*
*      Filename: extern_c.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-08-07 19:23:08
* Last Modified: 2018-08-07 19:23:08
**/
#include <cstdio>
#include <iostream>

void f() {}
void g();

extern "C" {
void ef() {}
void eg();
}

// prevent g and eg from being optimized away
void h() {
  g();
  eg();
}

int main() { return 0; }
