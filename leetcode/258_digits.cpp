class Solution {
 public:
  int addDigits(int num) {
    int res = 1 + (num - 1) % 9;
    return res;
  }
}
