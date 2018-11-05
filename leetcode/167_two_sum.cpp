class Solution {
 public:
  vector<int> twoSum(vector<int>& numbers, int target) {
    int index1, index2;
    int find = 0;
    for (int i = 0; i < numbers.size(); ++i) {
      int temp = target - numbers[i];
      index1 = i + 1;
      find = 0;

      index2 = bsearch(numbers, temp, 0, numbers.size() - 1, i);
      if (index2 != -1) {
        find = 1;
        break;
      }
    }
    vector<int> res;
    res.push_back(index1);
    res.push_back(index2);
    return res;
  }

  int bsearch(vector<int>& d, int target, int low, int high, int ignore) {
    if (low > high) {
      return -1;
    }
    int mid = (low + high) / 2;
    if (d[mid] == target && mid != ignore) {
      return mid + 1;
    }

    int res;
    if (d[mid] <= target) {
      res = bsearch(d, target, mid + 1, high, ignore);
    } else {
      res = bsearch(d, target, low, mid - 1, ignore);
    }
    return res;
  }
};
