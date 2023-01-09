import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/bunker_terrain.dart';
import 'package:poly_dice_golf/game/fairway_terrain.dart';
import 'package:poly_dice_golf/game/hole_terrain.dart';
import 'package:poly_dice_golf/game/rough_terrain.dart';
import 'package:poly_dice_golf/game/water_terrain.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';

abstract class Terrain {
  final int position;
  final int length;

  const Terrain({required this.position, required this.length});

  factory Terrain.create(TerrainType type, int position, int length) {
    switch (type) {
      case TerrainType.hole:
        return HoleTerrain(position: position, length: length);
      case TerrainType.bunker:
        return BunkerTerrain(position: position, length: length);
      case TerrainType.fairway:
        return FairwayTerrain(position: position, length: length);
      case TerrainType.rough:
        return RoughTerrain(position: position, length: length);
      case TerrainType.water:
        return WaterTerrain(position: position, length: length);
    }
  }

  int get maxDiceCount;

  void manipulateBall(Ball ball);

  TerrainType get type;
}
