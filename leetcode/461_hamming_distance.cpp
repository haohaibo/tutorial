class Solution {
public:
    int hammingDistance(int x, int y) {
        int count = 0;
        int res = x ^ y;
        for(int i=0; i < 32; ++i){
            if(res & 1){
                ++count;
            }
            res = res >> 1;
        }
        return count;
    }
};
