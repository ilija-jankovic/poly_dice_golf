enum TerrainType { rough, fairway, water, hole, bunker }

class TerrainModel {
  final TerrainType type;
  final int length;

  const TerrainModel({required this.type, required this.length});

  factory TerrainModel.fromJson(Map<String, dynamic> json) {
    final type = TerrainType.values.byName(json['type']);

    final length = json['length'];

    return TerrainModel(type: type, length: length);
  }

  static Map<String, dynamic> toJson(TerrainModel terrain) {
    return {'type': terrain.type.toString(), 'length': terrain.length};
  }
}
