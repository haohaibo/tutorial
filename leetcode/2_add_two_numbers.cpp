/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
 public:
  ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
    ListNode* p;
    ListNode preHead(0);
    p = &preHead;
    int carray = 0;
    int pos_sum;
    while (l1 || l2 || carray) {
      pos_sum = (l1 ? l1->val : 0) + (l2 ? l2->val : 0) + carray;

      p->next = new ListNode(pos_sum % 10);
      carray = pos_sum / 10;
      p = p->next;
      l1 = l1 ? l1->next : l1;
      l2 = l2 ? l2->next : l2;
    }
    return preHead.next;
  }
};
