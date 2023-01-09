import 'package:flutter/material.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';
import 'package:poly_dice_golf/themes/game_object_theme.dart';

GameObjectTheme getTerrainTheme(TerrainType type) {
  switch (type) {
    case TerrainType.hole:
      return const GameObjectTheme(colour: Colors.white, heightOffset: -0.5);
    case TerrainType.fairway:
      return const GameObjectTheme(colour: Colors.green);
    case TerrainType.water:
      return const GameObjectTheme(colour: Colors.blue, heightOffset: -0.3);
    case TerrainType.bunker:
      return const GameObjectTheme(colour: Colors.grey, heightOffset: -1.0);
    case TerrainType.rough:
      return GameObjectTheme(colour: Colors.green[800]!);
  }
}
