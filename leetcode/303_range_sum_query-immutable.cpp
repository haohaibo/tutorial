class NumArray {
public:
    NumArray(vector<int> nums) {
        data.push_back(0);
        for(int num : nums){
            data.push_back(data.back()+num);
        }
    }
    
    int sumRange(int i, int j) {
        return data[j+1]-data[i];
    }
private:
    vector<int> data;
};

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * int param_1 = obj.sumRange(i,j);
 */
