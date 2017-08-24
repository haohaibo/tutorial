class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int res = 0;
        if(nums.size() == 1){
            return nums[0];
        }
        for(size_t i = 0; i < nums.size(); ++i){
            res = res^nums[i];
        }
        return res;
    }
};
