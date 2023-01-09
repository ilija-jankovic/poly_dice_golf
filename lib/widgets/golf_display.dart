import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/game_session.dart';
import 'package:poly_dice_golf/game/golf_track.dart';
import 'package:poly_dice_golf/game/terrain.dart';
import 'package:poly_dice_golf/themes/ball_theme.dart';
import 'package:poly_dice_golf/themes/terrain_theme.dart';

class GolfDisplay extends StatelessWidget {
  final GameSession session;

  const GolfDisplay({super.key, required this.session});

  List<LineChartBarData> _createTerrainData(List<Terrain> terrain) {
    return terrain.map((terrain) {
      final theme = getTerrainTheme(terrain.type);
      final colour = theme.colour;
      final yOffset = theme.heightOffset;
      return LineChartBarData(
          barWidth: 5,
          color: colour,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: [
                colour,
                colour.withOpacity(0.7),
                colour.withOpacity(0.0001)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          spots: [
            FlSpot(terrain.position.toDouble(), yOffset),
            FlSpot(terrain.position + terrain.length.toDouble(),
                theme.heightOffset)
          ]);
    }).toList();
  }

  List<LineChartBarData> _createBallData(List<Ball> balls, GolfTrack track) {
    return balls.toList().asMap().entries.map((entry) {
      final index = entry.key;
      final player = index + 1;

      final ball = entry.value;
      final terrain = track.getTerrainAtPosition(ball.position);

      final ballTheme = getBallTheme(player);
      final terrainTheme = getTerrainTheme(terrain.type);

      final colour = ballTheme.colour;
      final yOffset = ballTheme.heightOffset + terrainTheme.heightOffset + 0.5;

      return LineChartBarData(
          barWidth: 0,
          color: colour,
          dotData: FlDotData(
              getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                  color: colour, strokeWidth: 1.0, radius: 5.0)),
          belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: [
                colour,
                colour.withOpacity(0.7),
                colour.withOpacity(0.0001)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          spots: [
            FlSpot(ball.position.toDouble(), yOffset),
          ]);
    }).toList();
  }

  List<LineChartBarData> _createBarData(
      List<Terrain> terrain, List<Ball> balls, GolfTrack track) {
    return _createTerrainData(terrain)..addAll(_createBallData(balls, track));
  }

  @override
  Widget build(BuildContext context) {
    final track = session.controller.track;
    final terrain = track.terrain;
    final balls = session.balls;

    return LineChart(LineChartData(
        minX: 0,
        maxX: track.length.toDouble(),
        minY: -10,
        maxY: 10,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: false),
        lineTouchData: LineTouchData(enabled: false),
        lineBarsData: _createBarData(terrain, balls, track)));
  }
}
