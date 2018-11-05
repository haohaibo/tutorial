class Solution {
 public:
  bool judgeCircle(string moves) {
    int pos_x = 0, pos_y = 0;
    for (size_t i = 0; i < moves.length(); ++i) {
      if (moves[i] == 'U') {
        ++pos_y;
      } else if (moves[i] == 'R') {
        ++pos_x;
      } else if (moves[i] == 'D') {
        --pos_y;
      } else if (moves[i] == 'L') {
        --pos_x;
      }
    }
    if (pos_x == 0 && pos_y == 0) {
      return true;
    } else {
      return false;
    }
  }
};
