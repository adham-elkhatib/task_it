import 'dart:convert';

import '../../domain/entities/tag_entity.dart';

class TagModel extends TagEntity {
  const TagModel({required super.id, required super.name});

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(id: map['id'], name: map['name']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory TagModel.fromEntity(TagEntity entity) {
    return TagModel(id: entity.id, name: entity.name);
  }

  TagEntity toEntity() {
    return TagEntity(id: id, name: name);
  }
}
