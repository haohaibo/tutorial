class Solution {
 public:
  vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {
    set<int> n1set, n2set;
    for (int i = 0; i < nums1.size(); ++i) {
      n1set.insert(nums1[i]);
    }
    for (int i = 0; i < nums2.size(); ++i) {
      n2set.insert(nums2[i]);
    }
    vector<int> res;

    for (set<int>::iterator it = n2set.begin(); it != n2set.end(); ++it) {
      if (n1set.count(*it) == 1) {
        res.push_back(*it);
      }
    }
    return res;
  }
};
