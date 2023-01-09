import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/terrain.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';

class WaterTerrain extends Terrain {
  const WaterTerrain({required super.position, required super.length});

  @override
  int get maxDiceCount => 0;

  @override
  void manipulateBall(Ball ball) {
    final diff = ball.position - position;

    // Checks for a difference to avoid an infinite loop between ball.move() and
    // manipulateBall().
    if (diff > 0) {
      ball.move(diff);
    }
  }

  @override
  TerrainType get type => TerrainType.water;
}
