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
  int maxDepth(TreeNode* root) {
    if (root == NULL) return 0;
    queue<TreeNode*> qt;
    qt.push(root);
    int depth = 0;
    while (!qt.empty()) {
      queue<TreeNode*> temp;
      while (!qt.empty()) {
        TreeNode* pnode = qt.front();
        qt.pop();

        if (pnode->left != NULL) {
          temp.push(pnode->left);
        }
        if (pnode->right != NULL) {
          temp.push(pnode->right);
        }
      }
      ++depth;
      qt = temp;
    }

    return depth;
  }
};
