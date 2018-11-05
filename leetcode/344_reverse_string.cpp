class Solution {
 public:
  string reverseString(string s) {
    string t;
    for (int i = s.length() - 1; i >= 0; --i) {
      t.push_back(s[i]);
    }
    return t;
  }
};
