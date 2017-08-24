class Solution {
public:
    vector<vector<int>> matrixReshape(vector<vector<int>>& nums, int r, int c) {
        int ori_r = nums.size();
        int ori_c = nums[0].size();
        
        if(ori_r*ori_c != r*c){
            cout << "not" << endl;
            return nums;
        }else{
            vector<int> col;
            col.reserve(ori_r*ori_c);
            
            vector<vector<int>> reshape;
            reshape.resize(r);
            for(int i = 0; i < r; ++i){
                reshape[i].resize(c);
            }
            for(size_t i = 0; i < ori_r; ++i){
                for(size_t j = 0; j < ori_c; ++j){
                    col.push_back(nums[i][j]);
                }
            }
            
            int index = 0;
            for(size_t i = 0; i < r; ++i){
                for(size_t j = 0; j < c; ++j){
                    reshape[i][j] = col[index];
                    ++index;
                }
            }
            return reshape;
        }
    }
};
