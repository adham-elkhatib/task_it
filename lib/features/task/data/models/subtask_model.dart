import 'dart:convert';

import '../../domain/entities/subtask_entity.dart';

class SubtaskModel extends SubtaskEntity {
  const SubtaskModel({
    required super.id,
    required super.title,
    required super.isCompleted,
    super.assigneeIds,
    super.deadline,
  });

  factory SubtaskModel.fromMap(Map<String, dynamic> map) {
    return SubtaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
      assigneeIds: List<String>.from(map['assigneeIds'] ?? []),
      deadline: map['deadline'] != null
          ? DateTime.parse(map['deadline'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      if (assigneeIds != null) 'assigneeIds': assigneeIds,
      if (deadline != null) 'deadline': deadline!.toIso8601String(),
    };
  }

  factory SubtaskModel.fromJson(String source) =>
      SubtaskModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory SubtaskModel.fromEntity(SubtaskEntity entity) {
    return SubtaskModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
      assigneeIds: entity.assigneeIds,
      deadline: entity.deadline,
    );
  }

  SubtaskEntity toEntity() {
    return SubtaskEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
      assigneeIds: assigneeIds,
      deadline: deadline,
    );
  }
}
