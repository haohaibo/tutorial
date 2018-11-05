/*
*
*      Filename: L1-018.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-28 00:37:58
* Last Modified: 2017-04-28 00:37:58
**/

#include <stdio.h>
#include <iostream>
using namespace std;
int main() {
  string time;
  cin >> time;
  int hh, mm;
  hh = (time[0] - '0') * 10 + (time[1] - '0');
  mm = (time[3] - '0') * 10 + (time[4] - '0');
  if ((hh >= 0 && hh <= 11) || (hh == 12 && mm == 0)) {
    cout << "Only " << time << ".  Too early to Dang." << endl;
  } else {
    int count = 0;
    count = hh - 12;
    if (mm > 0) {
      count++;
    }
    for (int i = 0; i < count; ++i) {
      printf("Dang");
    }
    printf("\n");
  }
  return 0;
}
