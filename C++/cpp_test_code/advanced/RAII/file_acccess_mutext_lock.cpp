/*
*
*      Filename: file_acccess_mutext_lock.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-03 21:05:00
* Last Modified: 2017-08-03 21:21:46
**/
#include <fstream>
#include <iostream>
#include <mutex>
#include <stdexcept>
#include <string>

void wrie_to_file(const std::string& message) {
  // mutex to protect file access (shared across threads)
  static std::mutex mutex;

  // lock mutex before accessing file
  std::lock_guard<std::mutex> lock(mutex);

  // try to open file
  std::ofstream file("example.txt");
  if (!file.is_open()) {
    throw std::runtime_error("unable to open file");
  }

  // write message to file
  file << message << std::endl;
}

int main(int argc, char* argv[]) {
  std::string message = argv[1];
  wrie_to_file(message);
  return 0;
}
