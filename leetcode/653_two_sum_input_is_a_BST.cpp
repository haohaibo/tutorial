/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
 public:
  bool findTarget(TreeNode* root, int k) {
    vector<int> data;
    Inorder(root, data);
    int temp;
    for (int i = 0; i < data.size(); ++i) {
      temp = k - data[i];
      if (temp >= data[i]) {
        for (int j = i + 1; j < data.size(); ++j) {
          if (data[j] == temp) {
            return true;
          }
        }
      }
    }
    return false;
  }
  void Inorder(TreeNode* root, vector<int>& data) {
    if (root == NULL) return;

    Inorder(root->left, data);
    data.push_back(root->val);
    Inorder(root->right, data);
  }
};
