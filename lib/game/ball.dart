import 'dart:math' as math;

class Ball {
  int position;

  Ball({this.position = 0});

  void move(int offset) {
    position += offset;
  }

  void clampPosition(int min, int max) {
    position = math.min(math.max(position, min), max);
  }
}
