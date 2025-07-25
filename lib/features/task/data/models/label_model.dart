import 'dart:convert';

import '../../domain/entities/label_entity.dart';

class LabelModel extends LabelEntity {
  const LabelModel({
    required super.id,
    required super.name,
    required super.colorHex,
  });

  factory LabelModel.fromMap(Map<String, dynamic> map) {
    return LabelModel(
      id: map['id'],
      name: map['name'],
      colorHex: map['colorHex'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'colorHex': colorHex};
  }

  factory LabelModel.fromJson(String source) =>
      LabelModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory LabelModel.fromEntity(LabelEntity entity) {
    return LabelModel(
      id: entity.id,
      name: entity.name,
      colorHex: entity.colorHex,
    );
  }

  LabelEntity toEntity() {
    return LabelEntity(id: id, name: name, colorHex: colorHex);
  }
}
