import 'package:equatable/equatable.dart';

import 'status_enum.dart';

class ProjectEntity extends Equatable {
  final String id;
  final String projectOwnerId;
  final String title;

  final String? description;
  final String? deadline;

  final List<String>? tasksId;

  final TaskStatus status;

  final String? createdAt;
  final String? updatedAt;

  final double progress;

  final String? colorHex;

  final bool isArchived;
  final bool isDeleted;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.projectOwnerId,
    this.description,
    this.deadline,
    this.tasksId,
    this.status = TaskStatus.toDo,
    this.createdAt,
    this.updatedAt,
    this.progress = 0.0,
    this.colorHex,
    this.isArchived = false,
    this.isDeleted = false,
  });

  ProjectEntity copyWith({
    String? id,
    String? title,
    String? projectOwnerId,
    String? description,
    String? deadline,
    List<String>? tasksId,
    List<String>? assigneePictureUrl,
    TaskStatus? status,
    String? createdAt,
    String? updatedAt,
    double? progress,
    String? colorHex,
    bool? isArchived,
    bool? isDeleted,
    List<String>? tags,
  }) {
    return ProjectEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      projectOwnerId: projectOwnerId ?? this.projectOwnerId,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      tasksId: tasksId ?? this.tasksId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      progress: progress ?? this.progress,
      colorHex: colorHex ?? this.colorHex,
      isArchived: isArchived ?? this.isArchived,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    projectOwnerId,
    description,
    deadline,
    tasksId,
    status,
    createdAt,
    updatedAt,
    progress,
    colorHex,
    isArchived,
    isDeleted,
  ];
}
