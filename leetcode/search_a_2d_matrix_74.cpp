/*
 *
 *      Filename: search_a_2d_matrix_74.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-04-23 18:59:59
* Last Modified: 2017-04-23 20:28:35
 **/
#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

class Solution {
 public:
  bool searchMatrix(vector<vector<int> >& matrix, int target) {
    int m = matrix.size();
    if (m == 0) {
      return false;
    }
    int n = matrix[0].size();
    if (n == 0) {
      return false;
    }
    // binary search
    return binary_search(matrix, target, 0, m - 1, m, n);
  }
  bool binary_search(vector<vector<int> >& matrix, int target, int low,
                     int high, int m, int n) {
    if (low <= high) {
      int middle = low + (high - low) / 2;
      if ((target >= matrix[middle][0]) && (target <= matrix[middle][n - 1])) {
        vector<int>::iterator it =
            find(matrix[middle].begin(), matrix[middle].end(), target);

        if (it != matrix[middle].end()) {
          return true;
        } else {
          return false;
        }
      } else {
        if (target < matrix[middle][0]) {
          return binary_search(matrix, target, low, middle - 1, m, n);
        } else {
          return binary_search(matrix, target, middle + 1, high, m, n);
        }
      }
    } else {
      return false;
    }
  }
};

int main() {
  vector<vector<int> > matrix;
  vector<int> row;
  row.push_back(1);
  row.push_back(3);
  row.push_back(5);
  row.push_back(7);

  matrix.push_back(row);
  row.clear();
  row.push_back(10);
  row.push_back(11);
  row.push_back(16);
  row.push_back(20);
  matrix.push_back(row);

  row.clear();
  row.push_back(23);
  row.push_back(30);
  row.push_back(34);
  row.push_back(50);
  matrix.push_back(row);

  Solution sol;
  vector<vector<int> > matrix2;
  vector<int> temp;
  matrix2.push_back(temp);
  cout << sol.searchMatrix(matrix, 4) << endl;
  cout << sol.searchMatrix(matrix2, 1) << endl;
  return 0;
}
