import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/golf_track.dart';

class GolfController {
  final GolfTrack track;

  const GolfController(this.track);

  void moveBall(Ball ball, int offset) {
    ball.move(offset);
    ball.clampPosition(0, track.length - 1);
    final nextTerrain = track.getTerrainAtPosition(ball.position);
    nextTerrain.manipulateBall(ball);
  }

  int getMaxDice(Ball ball) =>
      track.getTerrainAtPosition(ball.position).maxDiceCount;
}
