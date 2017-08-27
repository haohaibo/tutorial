class Solution {
public:
    int poorPigs(int buckets, int minutesToDie, int minutesToTest) {
        int total_stats = 2*ceil(log2(buckets));
        int one_stats = minutesToTest/minutesToDie;
        int min_pigs = total_stats/one_stats;
        return min_pigs;
        
    }
};
