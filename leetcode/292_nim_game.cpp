class Solution {
 public:
  bool canWinNim(int n) {
    bool res = (n % 4 != 0);
    return res;
  }
};
