import 'package:equatable/equatable.dart';
import 'package:task_it/features/task/domain/entities/label_entity.dart';
import 'package:task_it/features/task/domain/entities/tag_entity.dart';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';
import 'checklist_item_entity.dart';
import 'comment_entity.dart';
import 'reminder_entity.dart';
import 'subtask_entity.dart';

class TaskDetailEntity extends Equatable {
  final String id;
  final String spaceId;
  final String? projectId;
  final String? title;
  final String? description;
  final List<String>? assigneeIds;

  final TaskStatus taskStatus;
  final DateTime? deadline;
  final Priority priority;

  // Subcollections (fetched when needed)
  final List<CommentEntity> comments;
  final List<ChecklistItemEntity> checklist;
  final List<ReminderEntity> reminders;
  final List<SubtaskEntity> subtasks;
  final List<TagEntity> tags;
  final List<LabelEntity> labels;

  // Metadata
  final int commentsCount;
  final int attachmentsCount;

  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  const TaskDetailEntity({
    required this.id,
    required this.spaceId,
    this.projectId,
    this.title,
    this.description,
    this.assigneeIds = const [],
    this.taskStatus = TaskStatus.toDo,
    this.deadline,
    this.priority = Priority.low,
    this.comments = const [],
    this.checklist = const [],
    this.reminders = const [],
    this.subtasks = const [],
    this.labels = const [],
    this.tags = const [],
    this.commentsCount = 0,
    this.attachmentsCount = 0,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  TaskDetailEntity copyWith({
    String? id,
    String? spaceId,
    String? projectId,
    String? title,
    String? description,
    List<String>? assigneeIds,
    TaskStatus? taskStatus,
    DateTime? deadline,
    Priority? priority,
    List<CommentEntity>? comments,
    List<ChecklistItemEntity>? checklist,
    List<ReminderEntity>? reminders,
    List<SubtaskEntity>? subtasks,
    List<TagEntity>? tags,
    List<LabelEntity>? labels,
    int? commentsCount,
    int? attachmentsCount,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) {
    return TaskDetailEntity(
      id: id ?? this.id,
      spaceId: spaceId ?? this.spaceId,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      description: description ?? this.description,
      assigneeIds: assigneeIds ?? this.assigneeIds,
      taskStatus: taskStatus ?? this.taskStatus,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      comments: comments ?? this.comments,
      checklist: checklist ?? this.checklist,
      reminders: reminders ?? this.reminders,
      subtasks: subtasks ?? this.subtasks,
      labels: labels ?? this.labels,
      tags: tags ?? this.tags,
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
    assigneeIds,
    taskStatus,
    deadline,
    priority,
    comments,
    checklist,
    reminders,
    subtasks,
    labels,
    tags,
    commentsCount,
    attachmentsCount,
    createdBy,
    createdAt,
    updatedBy,
    updatedAt,
  ];
}
