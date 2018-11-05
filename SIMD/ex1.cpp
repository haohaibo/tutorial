/*
*
*      Filename: ex1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-28 00:45:01
* Last Modified: 2017-06-28 00:50:26
**/
#include <stdio.h>
typedef int v4sf __attribute__((mode(V4SF)));  // vector of four single floats

union f4vector {
  v4sf v;
  float f[4];
};

int main() {
  union f4vector a, b, c;
  a.f[0] = 1;
  a.f[1] = 2;
  a.f[2] = 3;
  a.f[3] = 4;
  b.f[0] = 5;
  b.f[1] = 6;
  b.f[2] = 7;
  b.f[3] = 8;

  c.v = a.v + b.v;
  printf("%f, %f, %f, %f\n", c.f[0], c.f[1], c.f[2], c.f[3]);
}
