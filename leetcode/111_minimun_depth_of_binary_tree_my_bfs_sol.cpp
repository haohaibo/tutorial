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
  int minDepth(TreeNode* root) {
    if (!root) return 0;
    queue<TreeNode*> qt;
    qt.push(root);
    bool flag = false;
    int count = 0;
    while (!qt.empty()) {
      queue<TreeNode*> temp;
      while (!qt.empty()) {
        TreeNode* pnode = qt.front();
        qt.pop();

        if (pnode->left) {
          temp.push(pnode->left);
        }

        if (pnode->right) {
          temp.push(pnode->right);
        }

        if (!pnode->left && !pnode->right) {
          flag = true;
          break;
        }
      }
      qt = temp;
      ++count;
      if (flag) {
        break;
      }
    }
    return count;
  }
};
