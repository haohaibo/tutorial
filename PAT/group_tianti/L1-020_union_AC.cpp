#include <stdio.h>
#include <algorithm>
#include <iostream>
#include <set>
#include <string>
#include <vector>
using namespace std;

int main() {
  int N, K;
  string ID;
  vector<vector<string> > data;
  vector<string> line;
  set<string> have_friends, no_friends;
  scanf("%d", &N);
  for (int i = 0; i < N; ++i) {
    scanf("%d", &K);
    for (int j = 0; j < K; ++j) {
      cin >> ID;
      line.push_back(ID);
      if (K > 1) {
        have_friends.insert(ID);
      }
    }

    data.push_back(line);
    line.clear();
  }
  int M;
  scanf("%d", &M);
  vector<string> query;
  set<string> out;

  bool flag = true;  // have no friends
  int count = 0;
  for (int i = 0; i < M; ++i) {
    flag = true;
    cin >> ID;

    if (have_friends.find(ID) != have_friends.end()) {
      flag = false;  // have friends
    }

    if (flag == true) {
      if (out.find(ID) == out.end()) {
        ++count;
        if (count == 1) {
          cout << ID;
        } else {
          cout << " " << ID;
        }

        out.insert(ID);
      }
    }
  }
  if (count == 0) {
    cout << "No one is handsome" << endl;
  } else {
    cout << endl;
  }

  return 0;
}
