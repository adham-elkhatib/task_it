import 'package:equatable/equatable.dart';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';

class TaskEntity extends Equatable {
  final String id;
  final String spaceId;
  final String? projectId;

  final String? title;
  final String? description;
  final DateTime? deadline;

  final List<String> assigneeIds;
  final List<String> subtaskIds;
  final List<String> tagIds;
  final List<String> actionItemsIds;

  final TaskStatus taskStatus;
  final Priority priority;

  final int commentsCount;
  final int attachmentsCount;

  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  const TaskEntity({
    required this.id,
    required this.spaceId,
    this.projectId,
    this.title,
    this.description,
    this.deadline,
    this.assigneeIds = const [],
    this.subtaskIds = const [],
    this.tagIds = const [],
    this.actionItemsIds = const [],
    this.taskStatus = TaskStatus.toDo,
    this.priority = Priority.low,
    this.commentsCount = 0,
    this.attachmentsCount = 0,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  TaskEntity copyWith({
    String? id,
    String? spaceId,
    String? projectId,
    String? title,
    String? description,
    DateTime? deadline,
    List<String>? assigneeIds,
    List<String>? subtaskIds,
    List<String>? tagIds,
    List<String>? actionItemsIds,
    TaskStatus? taskStatus,
    Priority? priority,
    int? commentsCount,
    int? attachmentsCount,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      spaceId: spaceId ?? this.spaceId,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      assigneeIds: assigneeIds ?? this.assigneeIds,
      subtaskIds: subtaskIds ?? this.subtaskIds,
      tagIds: tagIds ?? this.tagIds,
      actionItemsIds: actionItemsIds ?? this.actionItemsIds,
      taskStatus: taskStatus ?? this.taskStatus,
      priority: priority ?? this.priority,
      commentsCount: commentsCount ?? this.commentsCount,
      attachmentsCount: attachmentsCount ?? this.attachmentsCount,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    spaceId,
    projectId,
    title,
    description,
    deadline,
    assigneeIds,
    subtaskIds,
    tagIds,
    actionItemsIds,
    taskStatus,
    priority,
    commentsCount,
    attachmentsCount,
    createdBy,
    createdAt,
    updatedBy,
    updatedAt,
  ];
}
