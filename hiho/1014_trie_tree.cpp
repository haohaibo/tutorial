#include <cstdio>
#include <iostream>
#include <string>
#include <vector>
using namespace std;

struct TrieNode {
  char ch;
  vector<TrieNode*> nexts;
  int count;
  TrieNode() { count = 0; }
  TrieNode(char c) {
    ch = c;
    count = 1;
  }
};

int main() {
  TrieNode* tree = new TrieNode;
  int n, m;
  string s;
  cin >> n;
  TrieNode* p;
  while (n > 0) {
    cin >> s;
    p = tree;
    for (int i = 0; i < s.length(); ++i) {
      int find = 0;
      if (p->nexts.size() == 0) {
        p->nexts.push_back(new TrieNode(s[i]));
        p = p->nexts[0];
        continue;
      }
      for (int j = 0; j < p->nexts.size(); ++j) {
        if (s[i] == p->nexts[j]->ch) {
          find = 1;
          ++(p->nexts[j]->count);
          p = p->nexts[j];
          break;
        }
      }
      if (find == 0) {
        p->nexts.push_back(new TrieNode(s[i]));
        p = p->nexts[p->nexts.size() - 1];
      }
    }
    --n;
  }

  cin >> m;
  p = tree;
  while (m > 0) {
    cin >> s;
    int num = 0;
    int flag = 0;
    p = tree;
    for (int i = 0; i < s.length(); ++i) {
      flag = 0;
      for (int j = 0; j < p->nexts.size(); ++j) {
        if (s[i] == p->nexts[j]->ch) {
          num = p->nexts[j]->count;
          p = p->nexts[j];
          flag = 1;
          break;
        }
      }
      if (flag == 0) {
        num = 0;
        break;
      }
    }
    cout << num << endl;
    --m;
  }
}
