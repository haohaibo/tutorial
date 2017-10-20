class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        // count zeros
        int numZeros=0;
        for(int i=0;i<nums.size();++i){
            if(nums[i]==0){
                ++numZeros;
            }
        }
        
        //
        vector<int> res;
        for(int i=0;i<nums.size();++i){
            if(nums[i]!=0){
                res.push_back(nums[i]);
            }
        }
        
        //
        while(numZeros--){
            res.push_back(0);
        }
        
        // copy back to nums
        for(int i=0;i<nums.size();++i){
            nums[i]=res[i];
        }
    }
};
