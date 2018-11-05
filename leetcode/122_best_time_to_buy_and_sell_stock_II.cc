/*
 *
 *      Filename: 122_best_time_to_buy_and_sell_stock_II.cc
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-11-23 22:35:09
 * Last Modified: 2017-11-23 22:35:09
 **/
class Solution {
 public:
  int maxProfit(vector<int>& prices) {
    int total = 0;
    int len = prices.size();
    for (int i = 0; i < len - 1; ++i) {
      if (prices[i + 1] > prices[i]) {
        total += prices[i + 1] - prices[i];
      }
    }
    return total;
  }
};
