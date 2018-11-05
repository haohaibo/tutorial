#include <stdlib.h>
#include <iostream>
struct RegionId {
  unsigned short int labelId;  // id for the region

  // position in the original vector (so we can recover
  // sort and apply it to other vectors)
  long long int posId;

  // position in the original image (so we can store super voxels)
  long long int idx;

  friend bool operator<(RegionId& lhs, RegionId& rhs);
};

bool operator<(RegionId& lhs, RegionId& rhs) {
  return lhs.labelId < rhs.labelId;
}

int main(int argc, char** argv) {
  RegionId rid1, rid2;
  if (argc < 3) {
    std::cout << "Usage: " << argv[0] << " labelId1 labelId2\n" << std::endl;
    return 1;
  }
  rid1.labelId = atoi(argv[1]);
  rid2.labelId = atoi(argv[2]);
  if (rid1 < rid2) {
    std::cout << "OK\n" << std::endl;
  } else {
    std::cout << "NOT OK \n" << std::endl;
  }
  return 0;
}
