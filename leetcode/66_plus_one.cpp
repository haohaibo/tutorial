class Solution {
 public:
  vector<int> plusOne(vector<int>& digits) {
    int carry = 1;
    for (int i = digits.size() - 1; i >= 0; --i) {
      int psum = 0;
      psum = digits[i] + carry;

      if (psum < 10) {
        digits[i] = psum;
        return digits;
      } else {
        psum = psum % 10;
        digits[i] = psum;
        carry = 1;
      }
    }
    if (carry == 1) {
      vector<int> res;
      res.resize(digits.size() + 1);
      res[0] = 1;
      for (int i = 1; i < res.size(); ++i) {
        res[i] = digits[i - 1];
      }
      return res;
    } else {
      return digits;
    }
  }
};
