#include <cmath>
#include <iostream>
using namespace std;

#ifndef ROUND
#define ROUND(x) (floor(x + 0.5))
#endif

//-----------------------------------------------
// to separate filename from path
// from http://www.cplusplus.com/reference/string/string/find_last_of/
// returns the
string getPathFromFilename(const std::string& str) {
  std::cout << "Splitting: " << str << '\n';
  unsigned found = str.find_last_of("/\\");
  cout << "found = " << found << endl;
  std::cout << " path: " << str.substr(0, found) << '\n';
  std::cout << " file: " << str.substr(found + 1) << '\n';
  return str.substr(0, found);
}
int main(int argc, char** argv) {
  float data = 2.3;
  data = ROUND(data);
  cout << data << endl;
  cout << getPathFromFilename(argv[0]) << endl;
  return 0;
}
