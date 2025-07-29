import 'dart:convert';

import 'package:task_it/features/project/domain/entities/project_entity.dart';
import 'package:task_it/features/project/domain/entities/status_enum.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.projectOwnerId,
    super.description,
    super.deadline,
    super.tasksId,
    super.status = TaskStatus.toDo,
    super.createdAt,
    super.updatedAt,
    super.progress = 0.0,
    super.colorHex,
    super.isArchived = false,
    super.isDeleted = false,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'],
      title: map['title'],
      projectOwnerId: map['projectOwnerId'],
      description: map['description'],
      deadline: map['deadline'],
      tasksId: map['tasksId'] != null
          ? List<String>.from(map['tasksId'])
          : null,

      status: map['status'] != null
          ? TaskStatus.values[map['status']]
          : TaskStatus.toDo,
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      progress: (map['progress'] ?? 0.0).toDouble(),
      colorHex: map['colorHex'],
      isArchived: map['isArchived'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'projectOwnerId': projectOwnerId,
      'description': description,
      'deadline': deadline,
      'tasksId': tasksId,
      'assigneePictureUrl': assigneePictureUrl,
      'status': status.index,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'progress': progress,
      'colorHex': colorHex,
      'isArchived': isArchived,
      'isDeleted': isDeleted,
    };
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source));

  factory ProjectModel.fromEntity(ProjectEntity entity) => ProjectModel(
    id: entity.id,
    title: entity.title,
    projectOwnerId: entity.projectOwnerId,
    description: entity.description,
    deadline: entity.deadline,
    tasksId: entity.tasksId,
    status: entity.status,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    progress: entity.progress,
    colorHex: entity.colorHex,
    isArchived: entity.isArchived,
    isDeleted: entity.isDeleted,
  );

  ProjectEntity toEntity() => ProjectEntity(
    id: id,
    title: title,
    projectOwnerId: projectOwnerId,
    description: description,
    deadline: deadline,
    tasksId: tasksId,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
    progress: progress,
    colorHex: colorHex,
    isArchived: isArchived,
    isDeleted: isDeleted,
  );
}
