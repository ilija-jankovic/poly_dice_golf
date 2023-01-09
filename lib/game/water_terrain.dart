import 'dart:math';

import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/terrain.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';

class WaterTerrain extends Terrain {
  const WaterTerrain({required super.position, required super.length});

  @override
  int get maxDiceCount => 0;

  @override
  void manipulateBall(Ball ball) {
    ball.position = max(0, position - 1);
  }

  @override
  TerrainType get type => TerrainType.water;
}
