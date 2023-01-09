import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poly_dice_golf/game/die.dart';

class DieAdderButton extends StatelessWidget {
  final DieType type;
  final void Function(Die die) onPressed;

  const DieAdderButton(
      {super.key, required this.type, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(Die(type: type)),
      child: Text(type.name),
    );
  }
}
