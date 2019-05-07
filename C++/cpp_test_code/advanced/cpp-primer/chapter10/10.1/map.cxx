/*
 * Author: Haibo hao
 * Date  : 2017.4.4
 * Email : haohaibo@ncic.ac.cn
 * */
#include <iostream>
#include <map>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
  // count number of times each word occurs in the input
  map<string, int> word_count;  // empty map from string to int

  // map_it->first = "new key"; // error: key is const
  //++map_it->second; // ok: we can change value through an iterator

  // cout << map_it->first; // print the key for this element
  // cout << map_it->second; // print the value for this element

  // insert default initialized element with key Anna; then assign 1 to its
  // value
  word_count["Anna"] = 1;

  // get an iterator to an element in word_count
  map<string, int>::iterator map_it = word_count.begin();
  // *map_it is a reference to a pair<const string, int> object
  cout << "key: " << map_it->first << endl;  // print the key for this element
  cout << "value: " << map_it->second << endl;
  ;  // print the value for this element
  cout << "key: Anna\nValue:" << word_count["Anna"]
       << endl;          // fetch element indexed by Anna;
  ++word_count["Anna"];  // fetch element indexed by Anna and add one to it
  cout << "Key:Anna\nValue:" << word_count["Anna"] << endl;

  //----------------Three kinds to insert elements into map--------------------
  //---kind 1---
  word_count.insert(map<string, int>::value_type("HaiboHao", 2));

  cout << "Key: HaiboHao" << endl;
  cout << "Value: " << word_count["HaiboHao"] << endl;

  //---kind 2---
  typedef map<string, int>::value_type valType;
  word_count.insert(valType("Zhang", 3));
  cout << "Key: Zhang" << endl;
  cout << "Value: " << word_count["Zhang"] << endl;

  //---king 3---
  word_count.insert(make_pair("LI", 4));
  cout << "Key: LI" << endl;
  cout << "Value: " << word_count["LI"] << endl;

  //----------------word count--------------------
  string word;
  /*
  while(cin >> word)
  {
      ++word_count[word];
  }
  */

  while (cin >> word) {
    // inserts element with key equal to word and value 1
    // if word already in word_count, insert does nothing
    pair<map<string, int>::iterator, bool> ret =
        word_count.insert(make_pair(word, 1));

    if (!ret.second)  // word already in word_cont
    {
      // ++ret.first->second; // increment counter
      ++((ret.first)->second);  // equivalent expression
    }
  }

  // get iterator positioned on the first element
  map<string, int>::const_iterator map_iterator = word_count.begin();

  // for each element in the map
  while (map_iterator != word_count.end()) {
    // print the element key, value pairs
    cout << map_iterator->first << " occurs " << map_iterator->second
         << " times" << endl;
    ++map_iterator;
  }

  return 0;
}
