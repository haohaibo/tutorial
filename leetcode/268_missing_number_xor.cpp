/*
 *
 *      Filename: 268_missing_number_xor.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-10-28 22:49:10
* Last Modified: 2017-10-28 22:49:26
 **/
class Solution {
 public:
  int missingNumber(vector<int>& nums) {
    int res = 0;
    for (int i = 1; i <= nums.size(); ++i) {
      res = res ^ i ^ nums[i - 1];
    }
    return res;
  }
};
