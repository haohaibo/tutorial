#include <algorithm>
#include <cstdio>
#include <iostream>

using namespace std;

int main() {
  int N, M;
  cin >> N >> M;
  int need[N + 1], value[N + 1];

  for (int i = 1; i <= N; ++i) {
    cin >> need[i] >> value[i];
  }
  int best[N + 1][M + 1];

  for (int j = 1; j <= M; ++j) {
    best[0][j] = 0;
  }

  for (int i = 1; i <= N; ++i) {
    for (int j = 1; j <= M; ++j) {
      if (j < need[i]) {
        best[i][j] = best[i - 1][j];
      } else {
        best[i][j] = max(best[i - 1][j - need[i]] + value[i], best[i - 1][j]);
      }
    }
  }

  cout << best[N][M] << endl;
}
