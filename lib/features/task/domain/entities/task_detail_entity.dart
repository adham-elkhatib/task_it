import 'package:equatable/equatable.dart';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';
import 'checklist_item_entity.dart';
import 'comment_entity.dart';
import 'reminder_entity.dart';
import 'subtask_entity.dart';

class TaskDetailEntity extends Equatable {
  final String id;
  final String? title;
  final String? projectId;
  final List<String> actionItemsIds;
  final List<String>? assigneeIds;
  final TaskStatus? taskStatus;
  final DateTime? deadline;
  final Priority? priority;
  final bool? isCompleted;

  final List<CommentEntity> comments;
  final List<ChecklistItemEntity> checklist;
  final List<ReminderEntity> reminders;
  final List<String> labelIds;
  final List<String> tagIds;

  final List<SubtaskEntity>? subtasks;
  final int? commentsCount;
  final int? attachmentsCount;

  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  const TaskDetailEntity({
    required this.id,
    required this.title,
    required this.projectId,
    this.actionItemsIds = const [],
    this.assigneeIds,
    this.taskStatus = TaskStatus.toDo,
    this.priority = Priority.low,
    this.isCompleted = false,
    this.deadline,
    this.comments = const [],
    this.checklist = const [],
    this.reminders = const [],
    this.labelIds = const [],
    this.tagIds = const [],
    this.subtasks,
    this.commentsCount,
    this.attachmentsCount,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

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
    comments,
    checklist,
    reminders,
    labelIds,
    tagIds,
    subtasks,
    commentsCount,
    attachmentsCount,
    createdBy,
    createdAt,
    updatedBy,
    updatedAt,
  ];
}
