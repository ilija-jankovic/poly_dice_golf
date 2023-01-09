import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poly_dice_golf/game/game_session.dart';

class Direction extends StatelessWidget {
  final bool active;
  final StrokeDirection direction;
  final void Function(StrokeDirection) onPressed;

  const Direction(
      {super.key,
      required this.active,
      required this.direction,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colour = active ? Colors.orange : Colors.grey;
    final icon = direction == StrokeDirection.left
        ? Icons.arrow_left
        : Icons.arrow_right;
    return FloatingActionButton(
      onPressed: () => onPressed(direction),
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        size: 30.0,
        color: colour,
      ),
    );
  }
}
