class Solution {
 public:
  string multiply(string num1, string num2) {
    string a, b;
    a = num1;
    b = num2;
    string A, B;

    // cout << a;
    // cout << b;
    int fa = 1;
    int fb = 1;
    int f = 1;
    int lena = 0;
    int lenb = 0;
    if (a[0] == '-') {
      A = a.substr(1, a.size() - 1);
      fa = -1;
      lena = a.size() - 1;
    } else {
      A = a;
      lena = a.size();
    }

    if (b[0] == '-') {
      B = b.substr(1, b.size() - 1);
      fb = -1;
      lenb = b.size() - 1;
    } else {
      B = b;

      lenb = b.size();
    }
    // cout << A << endl;
    // cout << B;
    f = fa * fb;
    int lenmax = max(lena, lenb);
    int na[lenmax];
    int nb[lenmax];

    int i;
    int j;
    // cout << lenmax<< endl;
    for (i = lenmax - 1, j = lena - 1; j >= 0; --i, --j) {
      na[i] = A[j] - '0';
      // cout << na[i] << endl;
    }

    while (i >= 0) {
      na[i] = 0;
      --i;
    }

    for (i = lenmax - 1, j = lenb - 1; j >= 0; --i, --j) {
      nb[i] = B[j] - '0';
      // cout << nb[i] << endl;
    }

    while (i >= 0) {
      nb[i] = 0;
      --i;
    }

    int nc[2 * lenmax];
    for (i = 0; i < 2 * lenmax; ++i) {
      nc[i] = 0;
    }

    for (i = 0; i < lenmax; ++i) {
      for (j = 0; j < lenmax; ++j) {
        nc[i + j] += na[lenmax - 1 - i] * nb[lenmax - 1 - j];
      }
    }

    for (i = 0; i < 2 * lenmax - 1; ++i) {
      nc[i + 1] += nc[i] / 10;
      nc[i] = nc[i] % 10;
    }

    j = 2 * lenmax - 1;
    // cout << j << endl;
    while (nc[j] == 0 && j >= 0) {
      --j;
      if (j == -1) {
        break;
      }
    }
    string res;
    if (f == -1) {
      // printf("-");
      res += "-";
    }
    if (j == -1) {
      res += "0";
      return res;
    } else {
      for (i = j; i >= 0; --i) {
        // printf("%d",nc[i]);
        res += to_string(nc[i]);
      }
      return res;
    }
  }
};