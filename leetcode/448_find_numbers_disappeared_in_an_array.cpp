class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        for(int i=0;i<nums.size();++i){
            int pos = abs(nums[i]) - 1;
            nums[pos] = nums[pos]>0 ? -nums[pos] : nums[pos];
        }
        
        vector<int> res;
        for(int i=0;i<nums.size();++i){
            if(nums[i]>0){
                res.push_back(i+1);
            }
        }
        return res;
    }
};
