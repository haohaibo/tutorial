class Solution {
public:
    int hammingWeight(uint32_t n) {
        int i=0, ones=0;
        while(i<32){
            ones += n&1;
            n = n >> 1;
            ++i;
        }
        return ones;
    }
};
