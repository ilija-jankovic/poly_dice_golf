import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/die.dart';
import 'package:poly_dice_golf/game/golf_controller.dart';
import 'package:poly_dice_golf/game/golf_track.dart';

/// Needed for .sum in strokeBall().
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

enum StrokeDirection { left, right }

class GameSession {
  GolfController? _controller;
  List<Ball>? _balls;
  int? _player;

  Future<void> start(String mapName) async {
    final track = await GolfTrack.load(mapName);
    _controller = GolfController(track);

    _player = 1;
    _balls = [Ball(), Ball()];
  }

  bool get _hasStarted =>
      _controller != null && _player != null && _balls != null;

  List<Ball> get balls {
    if (!_hasStarted) {
      throw Exception('Game must be started before balls are retrieved.');
    }

    return _balls!;
  }

  Ball getBall(int player) {
    if (!_hasStarted) {
      throw Exception('Game must be started before getBall is called.');
    }

    if (player < 1 || player > 2) {
      throw RangeError('Player number must be 1 or 2.');
    }

    return _balls![player - 1];
  }

  Ball get _currentPlayerBall {
    return getBall(_player!);
  }

  int get maxDice {
    if (!_hasStarted) {
      throw Exception('Game must be started before getMaxDice is called.');
    }

    return _controller!.getMaxDice(_currentPlayerBall);
  }

  GolfController get controller {
    if (!_hasStarted) {
      throw Exception('Game must be started before controller is retrieved.');
    }

    return _controller!;
  }

  void strokeBall(List<Die> dice, StrokeDirection direction) {
    if (dice.isEmpty) {
      throw Exception('Must throw at least 1 die.');
    }

    if (dice.length > maxDice) {
      throw Exception('Cannot have more than ${dice.length} in hand.');
    }

    final result = dice.map((die) => die.roll()).toList().sum;
    final offset = direction == StrokeDirection.right ? result : result * -1;

    _controller!.moveBall(_currentPlayerBall, offset);

    // Player 1 goes to 2 and vice versa.
    _player = _player! % 2 + 1;
  }
}
