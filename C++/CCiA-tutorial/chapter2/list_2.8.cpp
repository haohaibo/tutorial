/*
*
*      Filename: list_2.8.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: A naive parallel version of std::accumulate
*        Create: 2017-05-30 20:46:02
* Last Modified: 2017-06-14 09:07:29
**/
#include <algorithm>
#include <functional>
#include <iostream>
#include <numeric>
#include <thread>
#include <vector>

template <typename Iterator, typename T>
struct accumulate_block {
  void operator()(Iterator first, Iterator last, T &result) {
    result = std::accumulate(first, last, result);
  }
};

template <typename Iterator, typename T>
T parallel_accumulate(Iterator first, Iterator last, T init) {
  unsigned long const length = std::distance(first, last);

  if (!length) return init;

  // 每个线程最少处理min_per_thread个元素
  unsigned long const min_per_thread = 25;

  //总共需要的最大线程数
  unsigned long const max_threads =
      (length + min_per_thread - 1) / min_per_thread;

  unsigned long const hardware_threads = std::thread::hardware_concurrency();
  std::cout << "hardware_threads = " << hardware_threads << std::endl;

  unsigned long const num_threads =
      std::min(hardware_threads != 0 ? hardware_threads : 2, max_threads);

  std::cout << "num_threads = " << num_threads << std::endl;
  // 实际每个线程处理block_size个元素
  unsigned long const block_size = length / num_threads;

  // results的每个元素保存对应线程计算的部分和
  std::vector<T> results(num_threads);
  // 这里除去主线程
  std::vector<std::thread> threads(num_threads - 1);

  Iterator block_start = first;
  // 前num_threads-1个线程计算前block_size-1个block
  for (unsigned long i = 0; i < (num_threads - 1); ++i) {
    Iterator block_end = block_start;
    // 给迭代器block_end增加block_size大小的偏移量
    std::advance(block_end, block_size);

    threads[i] = std::thread(accumulate_block<Iterator, T>(), block_start,
                             block_end, std::ref(results[i]));
    block_start = block_end;
  }

  // 主线程计算最后一个block
  accumulate_block<Iterator, T>()(block_start, last, results[num_threads - 1]);

  std::for_each(threads.begin(), threads.end(),
                std::mem_fn(&std::thread::join));

  return std::accumulate(results.begin(), results.end(), init);
}

int main() {
  std::vector<int> vi;
  for (int i = 0; i < 1000000; ++i) {
    vi.push_back(i);
  }

  long long sum = parallel_accumulate(vi.begin(), vi.end(), 5);
  std::cout << "sum = " << sum << std::endl;
}
