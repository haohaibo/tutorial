class Solution {
public:
    uint32_t reverseBits(uint32_t n) {
        int i=0;
        uint32_t res=0;
        while(i<32){
            res = res ^ ((n&1) << (31-i));
            n = n >> 1;
            ++i;
        }
        return res;
    }
};
