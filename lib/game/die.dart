import 'dart:math';

enum DieType { d4, d6, d12, d20 }

class Die {
  final DieType type;

  const Die({required this.type});

  int get sides {
    switch (type) {
      case DieType.d4:
        return 4;
      case DieType.d6:
        return 6;
      case DieType.d12:
        return 12;
      case DieType.d20:
        return 20;
    }
  }

  int roll() {
    return Random().nextInt(sides) + 1;
  }
}
