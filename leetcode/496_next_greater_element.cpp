class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& findNums, vector<int>& nums) {
        vector<int>::iterator it;
        vector<int> res;
        int flag = 0;
        for(int i = 0; i < findNums.size(); ++i){
            flag = 0;
            it = find(nums.begin(), nums.end(), findNums[i]);
            while(it != nums.end()){
                if(*it > findNums[i]){
                    flag = 1;
                    res.push_back(*it);
                    break;
                }
                ++it;
            }
            if(flag == 0){
                res.push_back(-1);
            }
        }
        return res;
    }
};
