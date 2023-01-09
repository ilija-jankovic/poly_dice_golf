import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:poly_dice_golf/game/ball.dart';
import 'package:poly_dice_golf/game/terrain.dart';
import 'package:poly_dice_golf/models/golf_track_model.dart';
import 'package:poly_dice_golf/models/terrain_model.dart';

class GolfTrack {
  late final List<Terrain> terrain;
  late final int length;

  void _parseTerrain(Map<String, dynamic> json) {
    final track = GolfTrackModel.fromJson(json);

    int pos = 0;
    terrain = [];
    for (final model in track.terrainModels) {
      terrain.add(Terrain.create(model.type, pos, model.length));
      pos += model.length;
    }

    // Store total map length.
    length = pos;
  }

  GolfTrack({required Map<String, dynamic> json}) {
    _parseTerrain(json);
  }

  static Future<GolfTrack> load(String mapName) async {
    final text = await rootBundle.loadString('assets/maps/$mapName.json');
    final json = jsonDecode(text);
    return GolfTrack(json: json);
  }

  Terrain getTerrainAtPosition(int position) {
    if (position < 0 || position >= length) {
      throw Exception(
          'Position must be between 0 (inclusive) and $length (exclusive).');
    }

    // For loop should always return non-null value if map formatted correctly.
    for (final terrain in terrain) {
      if (position < terrain.position + terrain.length) {
        return terrain;
      }
    }

    throw 'Terrain missing at position $position.';
  }
}
