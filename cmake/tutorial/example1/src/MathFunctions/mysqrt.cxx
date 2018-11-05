/*
 * Author: Haibo Hao
 * Date: 2017.3.30
 * Email: haohaibo@ncic.ac.cn
 * */

float mysqrt(float a) {
  double x, y;
  x = 0.0;
  y = a / 2;
  while (x != y) {
    x = y;
    y = (x + a / x) / 2;
  }
  return x;
}
