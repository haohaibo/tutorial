/*
*
*      Filename: strchr.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-18 11:20:22
* Last Modified: 2017-04-18 11:20:22
**/
#include <stdio.h>
#include <string.h>

int main() {
  char string[] = {"This is a string"};
  char *ptr, c = 'r';
  ptr = strchr(string, c);
  if (ptr)
    printf("The character %c is at position: %s\n", c, ptr);
  else
    printf("The character was not found\n");
  return 0;
}
