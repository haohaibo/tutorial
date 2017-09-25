/*
 *
 *      Filename: 350_intersection_of_two_arrays.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-09-25 22:38:04
* Last Modified: 2017-09-25 22:38:29
 **/
class Solution {
    public:
        vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
            vector<int> res;
            for(int i=0;i<nums1.size();++i){
                vector<int>::iterator it = std::find(nums2.begin(),nums2.end(),nums1[i]);
                if( it != nums2.end()){
                    res.push_back(nums1[i]);
                    nums2.erase(it);
                }
            }
            return res;
        }
};

