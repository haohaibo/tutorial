/*
 *
 *      Filename: 69_sqrt_x.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-10-28 23:15:16
* Last Modified: 2017-10-28 23:15:49
 **/
class Solution {
    public:
        int mySqrt(int x) {
            if(x==0){
                return x;
            }
            int l=1,r=x;
            int mid,res;
            while(l<=r){
                mid=l+(r-l)/2;
                if(mid<x/mid){
                    l=mid+1;
                    res=mid;
                }else{
                    if(mid==x/mid){
                        return mid;
                    }else{
                        r=mid-1;
                    }
                }
            }
            return res;
        }
};

