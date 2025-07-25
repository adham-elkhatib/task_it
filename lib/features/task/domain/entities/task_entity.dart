import 'package:equatable/equatable.dart';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';
import 'subtask_entity.dart';

// For lightweight task view. See TaskDetailEntity for full info.
class TaskEntity extends Equatable {
  final String id;
  final String? title;
  final String? projectId;
  final List<String> actionItemsIds;
  final List<String>? assigneeIds;
  final TaskStatus? taskStatus;
  final DateTime? deadline;
  final Priority? priority;
  final bool? isCompleted;

  final int? commentsCount;
  final int? attachmentsCount;
  final List<SubtaskEntity>? subtasks;

  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.projectId,
    this.actionItemsIds = const [],
    this.assigneeIds,
    this.taskStatus = TaskStatus.toDo,
    this.priority = Priority.low,
    this.isCompleted = false,
    this.deadline,
    this.commentsCount,
    this.attachmentsCount,
    this.subtasks,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    String? projectId,
    List<String>? actionItemsIds,
    List<String>? assigneeIds,
    TaskStatus? taskStatus,
    DateTime? deadline,
    Priority? priority,
    bool? isCompleted,
    int? commentsCount,
    int? attachmentsCount,
    List<SubtaskEntity>? subtasks,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      projectId: projectId ?? this.projectId,
      actionItemsIds: actionItemsIds ?? this.actionItemsIds,
      assigneeIds: assigneeIds ?? this.assigneeIds,
      taskStatus: taskStatus ?? this.taskStatus,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      commentsCount: commentsCount ?? this.commentsCount,
      attachmentsCount: attachmentsCount ?? this.attachmentsCount,
      subtasks: subtasks ?? this.subtasks,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    projectId,
    actionItemsIds,
    assigneeIds,
    taskStatus,
    deadline,
    priority,
    isCompleted,
    commentsCount,
    attachmentsCount,
    subtasks,
    createdBy,
    createdAt,
    updatedBy,
    updatedAt,
  ];
}
