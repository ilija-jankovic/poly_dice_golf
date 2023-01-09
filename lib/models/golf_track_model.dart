import 'package:poly_dice_golf/models/terrain_model.dart';

class GolfTrackModel {
  final List<TerrainModel> terrainModels;

  const GolfTrackModel({required this.terrainModels});

  factory GolfTrackModel.fromJson(Map<String, dynamic> json) {
    final terrain = (json['terrain'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => TerrainModel.fromJson(e))
        .toList();

    return GolfTrackModel(terrainModels: terrain);
  }

  static Map<String, dynamic> toJson(GolfTrackModel track) {
    return {
      'terrain': track.terrainModels.map((e) => TerrainModel.toJson(e)).toList()
    };
  }
}
