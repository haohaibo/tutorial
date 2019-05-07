/*extern "C"
{
    #include "cExample.h"
}
*/
#include <stdio.h>
#include "cExample.h"
// using namespace std;
//#include "cExample.h"
// extern "C" int add(int, int);
int main(int argc, char** argv) {
  printf("%d\n", add(2, 3));
  return 0;
}
