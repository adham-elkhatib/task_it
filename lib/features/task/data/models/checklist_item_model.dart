import 'dart:convert';

import '../../domain/entities/checklist_item_entity.dart';

class ChecklistItemModel extends ChecklistItemEntity {
  const ChecklistItemModel({
    required super.id,
    required super.content,
    super.isChecked = false,
  });

  factory ChecklistItemModel.fromMap(Map<String, dynamic> map) {
    return ChecklistItemModel(
      id: map['id'],
      content: map['content'],
      isChecked: map['isChecked'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content, 'isChecked': isChecked};
  }

  factory ChecklistItemModel.fromJson(String source) =>
      ChecklistItemModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory ChecklistItemModel.fromEntity(ChecklistItemEntity entity) {
    return ChecklistItemModel(
      id: entity.id,
      content: entity.content,
      isChecked: entity.isChecked,
    );
  }

  ChecklistItemEntity toEntity() {
    return ChecklistItemEntity(id: id, content: content, isChecked: isChecked);
  }
}
