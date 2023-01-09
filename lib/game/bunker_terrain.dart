import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/terrain.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';

class BunkerTerrain extends Terrain {
  BunkerTerrain({required super.position, required super.length});

  @override
  int get maxDiceCount => 2;

  @override
  void manipulateBall(Ball ball) {}

  @override
  TerrainType get type => TerrainType.bunker;
}
