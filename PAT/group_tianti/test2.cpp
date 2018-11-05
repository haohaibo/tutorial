#include <stdio.h>
#include <string.h>
int main() {
  char s[10001], c;
  int a[256], i = 0;
  memset(a, 0, 256 * sizeof(int));
  gets(s);
  while ((c = getchar()) != '\n') {
    a[c] = 1;
  }
  while (s[i] != 0) {
    if (!a[s[i]]) {
      putchar(s[i]);
    }
    i++;
  }
  putchar('\n');
  return 0;
}
