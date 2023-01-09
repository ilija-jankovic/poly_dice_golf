import 'dart:math' as math;

class Ball {
  late int _position;

  Ball({int position = 0}) {
    _position = position;
  }

  void move(int offset) {
    _position += position + offset;
  }

  void clampPosition(int min, int max) {
    _position = math.min(math.max(_position, min), max);
  }

  int get position => _position;
}
