import 'package:flutter/material.dart';
import 'package:poly_dice_golf/themes/game_object_theme.dart';

GameObjectTheme getBallTheme(int player) {
  if (player < 1 || player > 2) {
    throw RangeError('Player number must be 1 or 2.');
  }

  final colour = player == 1 ? Colors.red : Colors.blue;

  return GameObjectTheme(colour: colour, heightOffset: 0.2);
}
