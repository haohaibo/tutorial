/*
 *
 *      Filename: 121_best_time_to_buy_and_sell_stock.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-10-23 17:26:09
* Last Modified: 2017-10-23 17:27:18
 **/
class Solution {
    public:
        int maxProfit(vector<int>& prices) {
            int minPrice=INT_MAX;
            int maxProfit=0;
            for(int i=0;i<prices.size();++i){
                minPrice=min(minPrice,prices[i]);
                maxProfit=max(maxProfit,prices[i]-minPrice);
            }
            return maxProfit;
        }
};

