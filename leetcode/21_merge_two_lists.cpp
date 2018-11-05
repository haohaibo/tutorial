tion for singly-linked list.
 * struct ListNode {
  *int val;
  *ListNode* next;
  *ListNode(int x) : val(x), next(NULL){}*
};
* / class Solution {
 public:
  ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
    ListNode* res = new ListNode(0);

    if (l1 == NULL) return l2;
    if (l2 == NULL) return l1;

    if (l1->val < l2->val) {
      res->val = l1->val;
      l1 = l1->next;
    } else {
      res->val = l2->val;
      l2 = l2->next;
    }
    ListNode* p = res;
    while (l1 || l2) {
      if (l1 && l2) {
        if (l1->val <= l2->val) {
          p->next = l1;
          l1 = l1->next;
        } else {
          p->next = l2;
          l2 = l2->next;
        }
        p = p->next;
      }
      if (l1 == NULL) {
        p->next = l2;
        return res;
      }
      if (l2 == NULL) {
        p->next = l1;
        return res;
      }
    }
    return res;
  }
};
