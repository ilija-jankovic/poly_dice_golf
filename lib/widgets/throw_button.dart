import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poly_dice_golf/game/die.dart';

class ThrowButton extends StatelessWidget {
  final void Function() onPressed;
  const ThrowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Text('Throw'),
    );
  }
}
