/*
*
*      Filename: test2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-10 05:02:43
* Last Modified: 2017-08-10 05:02:43
**/
#include <stdarg.h>
#include <stdio.h>
// ref: http://blog.csdn.net/yuzhihui_no1/article/details/43734663
int test(int num, ...) {
  int i, result = 0;
  va_list ap;  // 其实它就是个字符指针char*
  va_start(ap,
           num);  //这里把上面得到的字符指针，后移4个字节，就是跳过num的内存地址
  printf("num:%d, *ap:%d\n", num, *ap);

  for (i = 0; i < num; ++i) {
    //这里把ap往后跳过4个字节(sizeof(int)大小)指向下一个参数，返回的是当前参数
    result = va_arg(ap, int);
    printf("in for result:%d, *ap:%d\n", result, *ap);
  }
  va_end(ap);  //结束标志
  return result;
}

int main() {
  int i = 4, j = 1, k = 2, g = 3, z = 4, m = 10;
  printf("result:%d\n", test(i, j, k, g, z, m));
}
