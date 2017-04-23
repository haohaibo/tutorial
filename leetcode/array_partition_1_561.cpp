/*
 *
 *      Filename: array_partition_1_561.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-04-23 18:36:37
* Last Modified: 2017-04-23 18:58:53
 **/
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

class Solution {
    public:
        int arrayPairSum(vector<int>& nums) {
            sort(nums.begin(), nums.end());
            int sum = 0;
            for(int i=0; i < nums.size(); i+=2)
            {
                sum += nums[i];
            }
            return sum;
        }
};

int main()
{
    Solution sol;
    vector<int> data;
    data.push_back(1);
    data.push_back(4);
    data.push_back(2);
    data.push_back(3);
    cout << sol.arrayPairSum(data) << endl;
    return 0;
}

