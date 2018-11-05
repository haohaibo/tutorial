/*
 *
 *      Filename: L2-001.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-06-07 21:04:01
* Last Modified: 2017-06-08 12:30:26
 **/
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <algorithm>
#include <iostream>
#include <vector>

struct PRE {
  std::vector<int> pre_node;
  // int pre_node;
  int count;

  PRE() : count(0) { pre_node.reserve(1); }
};

struct SET_S {
  int flag;
  int dst;

  SET_S() : flag(0), dst(-1) {}
};

int max_num_path(int src, int dst, int& max_people, int temp_people,
                 struct PRE* Pre, int* people, std::vector<int>& max_path,
                 std::vector<int> temp_path) {
  temp_path.push_back(dst);

  if (dst == src) {
    if (max_people < temp_people + people[src]) {
      max_path.clear();
      for (int i = 0; i < temp_path.size(); ++i) {
        max_path.push_back(temp_path[i]);
      }
      temp_path.clear();
    }
    max_people = std::max(max_people, temp_people + people[src]);
    return 1;
  }
  int sum = 0;
  for (int i = 0; i < Pre[dst].pre_node.size(); ++i) {
    sum += max_num_path(src, Pre[dst].pre_node[i], max_people,
                        temp_people + people[dst], Pre, people, max_path,
                        temp_path);
  }
  return sum;
}
int main() {
  int N, M, S, D;
  scanf("%d", &N);
  scanf("%d", &M);
  scanf("%d", &S);
  scanf("%d", &D);

  int* people = (int*)malloc(N * sizeof(int));
  for (int i = 0; i < N; ++i) {
    scanf("%d", &people[i]);
  }
  int** Graph;
  Graph = (int**)malloc(N * sizeof(int*));
  int src, dst;
  int len;
  for (int i = 0; i < N; ++i) {
    Graph[i] = (int*)malloc(N * sizeof(int));
    for (int j = 0; j < N; ++j) {
      if (i == j) {
        Graph[i][j] = 0;
      } else {
        Graph[i][j] = -1;  // 初始化为无穷大
      }
    }
  }

  int max_dst = 0;
  for (int i = 0; i < M; ++i) {
    scanf("%d", &src);
    scanf("%d", &dst);
    scanf("%d", &len);
    Graph[src][dst] = len;
    Graph[dst][src] = len;
  }

  // if S_set[i].flag==1  node i is in set S_set
  // else node i is in set Q_set
  struct SET_S* S_set = (struct SET_S*)malloc(N * sizeof(struct SET_S));
  int infinite = 500 * 500;
  for (int i = 0; i < N; ++i) {
    S_set[i].dst = infinite;  // 初始化每个节点到源节点的距离为无穷大
    S_set[i].flag = 0;
  }

  // struct PRE *Pre = (struct PRE*)malloc(N*sizeof(struct PRE));

  struct PRE* Pre = new struct PRE[N];

  // add source to set S_set
  // S_set[S].flag = 1;
  // Pre[S].count += 1;
  // Pre[S].pre_node(S);

  // 初始化源节点的的前驱为它自己
  Pre[S].pre_node.push_back(S);
  // 最短路径的条数
  Pre[S].count = 1;
  // 初始化源节点到自己的距离为0
  S_set[S].dst = 0;

  int u = S;
  int u_min;
  int min = S_set[0].dst + 1;

  for (int i = 0; i < N; ++i) {
    // extract minimum node in Q set
    min = infinite + 1;
    for (int j = 0; j < N; ++j) {
      if (S_set[j].flag == 0) {
        if (min > S_set[j].dst) {
          min = S_set[j].dst;
          u_min = j;
        }
      }
    }
    u = u_min;

    // add minimum node u to S set
    S_set[u].flag = 1;

    // relax
    for (int k = 0; k < N; ++k) {
      if (Graph[u][k] != -1 && S_set[k].flag == 0) {
        if ((S_set[u].dst + Graph[u][k]) < S_set[k].dst) {
          S_set[k].dst = S_set[u].dst + Graph[u][k];
          Pre[k].pre_node.clear();
          Pre[k].pre_node.push_back(u);
        } else {
          if ((S_set[u].dst + Graph[u][k]) == S_set[k].dst) {
            Pre[k].pre_node.push_back(u);
          }
        }
      }
    }
  }

  int max_people = 0;
  int num_path = 0;
  std::vector<int> max_path;
  max_path.reserve(N);
  std::vector<int> temp_path;
  temp_path.reserve(N);
  // int max_num_path(int src, int dst, int& max_people, int temp_people,struct
  // PRE *Pre , int *people, std::vector<int>& max_path, std::vector<int>
  // temp_path)
  num_path =
      max_num_path(S, D, max_people, 0, Pre, people, max_path, temp_path);
  printf("%d %d\n", num_path, max_people);
  for (int i = max_path.size() - 1; i >= 0; --i) {
    if (i == 0) {
      std::cout << max_path[i] << std::endl;
    } else {
      std::cout << max_path[i] << " ";
    }
  }
  return 0;
}
