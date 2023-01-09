import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/terrain.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';

class HoleTerrain extends Terrain {
  HoleTerrain({required super.position, required super.length});

  @override
  int get maxDiceCount => 0;

  @override
  void manipulateBall(Ball ball) {}

  @override
  TerrainType get type => TerrainType.hole;
}
