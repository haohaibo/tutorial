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
  TreeNode* invertTree(TreeNode* root) {
    if (root == NULL) return root;
    TreeNode* newTree = root;
    TreeNode* temp;
    temp = newTree->left;
    newTree->left = newTree->right;
    newTree->right = temp;

    invertTree(newTree->left);
    invertTree(newTree->right);

    return newTree;
  }
};
