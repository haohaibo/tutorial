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
  int findTilt(TreeNode* root) {
    if (root == nullptr) return 0;
    return findTiltOfNode(root) + findTilt(root->left) + findTilt(root->right);
  }
  int findTiltOfNode(TreeNode* root) {
    if (root == nullptr) return 0;
    return abs(SumOfTree(root->left) - SumOfTree(root->right));
  }

  int SumOfTree(TreeNode* root) {
    if (root == nullptr) return 0;
    return root->val + SumOfTree(root->left) + SumOfTree(root->right);
  }
};
