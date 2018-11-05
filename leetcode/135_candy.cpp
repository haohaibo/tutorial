class Solution {
 public:
  int candy(vector<int>& ratings) {
    vector<int> nums(ratings.size(), 1);
    for (int i = 1; i < ratings.size(); ++i) {
      if (ratings[i] > ratings[i - 1]) {
        nums[i] = nums[i - 1] + 1;
      }
    }

    for (int i = ratings.size() - 1; i > 0; --i) {
      if (ratings[i - 1] > ratings[i]) {
        nums[i - 1] = max(nums[i - 1], nums[i] + 1);
      }
    }
    int sum = 0;
    for (int i = 0; i < ratings.size(); ++i) {
      sum += nums[i];
    }
    return sum;
  }
};
