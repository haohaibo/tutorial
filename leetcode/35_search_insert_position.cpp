class Solution {
public:
    int searchInsert(vector<int>& nums, int target) {
        int index;
        index = BinarySearch(nums, 0, nums.size()-1, target);
        return index;
    }
    int BinarySearch(vector<int>&nums, int low, int high, int target){
        if(low > high)
            return low;
        
        int mid = (low+high)/2;
        if(nums[mid] == target){
            return mid;
        }else{
            if(nums[mid] > target)
               return BinarySearch(nums, low, mid - 1, target);  
            else
               return BinarySearch(nums, mid+1, high, target);
        }
    }
};
