/*
 * Author: Haibo hao
 * Date  : 2017.4.4
 * Email : haohaibo@ncic.ac.cn
 * */
#include <iostream>
#include <string>
#include <utility>
#include <vector>

using namespace std;

typedef pair<string, string> Author;

int main(int argc, char* argv[]) {
  pair<string, string> anon;        // holds two strings
  pair<string, int> word_count;     // holds a string and a int
  pair<string, vector<int> > line;  // holds a string and vector<int>

  pair<string, string> author("Haibo", "Hao");

  Author proust("Marcel", "Proust");
  Author joyce("James", "Joyce");

  string firstbook;
  // access and test the data members of the pair
  if (author.first == "Haibo" && author.second == "Hao") {
    firstbook = "Stephen Hero";
  }

  pair<string, string> next_auth;
  string first, last;
  while (cin >> first >> last) {
    // generate a pair from first and last
    next_auth = make_pair(first, last);
    cout << next_auth.first << " " << next_auth.second << endl;
  }
  return 0;
}
