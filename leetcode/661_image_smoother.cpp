class Solution {
 public:
  vector<vector<int>> imageSmoother(vector<vector<int>>& M) {
    vector<vector<int>> N;
    N.resize(M.size());
    for (int i = 0; i < M.size(); ++i) {
      N[i].resize(M[0].size());
    }

    for (int i = 0; i < M.size(); ++i) {
      for (int j = 0; j < M[0].size(); ++j) {
        int windowsize = 0, psum = 0;
        for (int k = i - 1; k <= i + 1; ++k) {
          for (int m = j - 1; m <= j + 1; ++m) {
            if (k >= 0 && k <= M.size() - 1 && m >= 0 && m <= M[0].size() - 1) {
              psum += M[k][m];
              ++windowsize;
            }
          }
        }
        N[i][j] = psum / windowsize;
      }
    }
    return N;
  }
};
