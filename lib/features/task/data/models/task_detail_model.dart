import 'dart:convert';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';
import '../../domain/entities/checklist_item_entity.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/entities/reminder_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_detail_entity.dart';

class TaskDetailModel extends TaskDetailEntity {
  const TaskDetailModel({
    required super.id,
    super.title,
    super.projectId,
    super.assigneeIds,
    super.taskStatus,
    super.deadline,
    super.priority,
    super.comments = const [],
    super.checklist = const [],
    super.reminders = const [],
    super.labels = const [],
    super.tags = const [],
    super.subtasks,
    super.commentsCount,
    super.attachmentsCount,
    super.createdBy,
    super.createdAt,
    super.updatedBy,
    super.updatedAt,
    required super.spaceId,
  });

  factory TaskDetailModel.fromMap(Map<String, dynamic> map) {
    return TaskDetailModel(
      id: map['id'] ?? '',
      title: map['title'],
      projectId: map['projectId'],
      spaceId: map['spaceId'],
      assigneeIds: List<String>.from(map['assigneeIds'] ?? []),
      taskStatus: map['status'] != null
          ? TaskStatus.values[map['status']]
          : TaskStatus.toDo,
      deadline: map['deadline'] != null
          ? DateTime.tryParse(map['deadline'])
          : null,
      priority:
          map['priority'] != null &&
              map['priority'] >= 0 &&
              map['priority'] < Priority.values.length
          ? Priority.values[map['priority']]
          : Priority.low,
      comments:
          (map['comments'] as List<dynamic>?)
              ?.map(
                (e) => CommentEntity(
                  id: e['id'],
                  userId: e['userId'],
                  content: e['content'],
                  createdAt: DateTime.parse(e['createdAt']),
                  updatedAt: e['updatedAt'] != null
                      ? DateTime.tryParse(e['updatedAt'])
                      : null,
                ),
              )
              .toList() ??
          [],
      checklist:
          (map['checklist'] as List<dynamic>?)
              ?.map(
                (e) => ChecklistItemEntity(
                  id: e['id'],
                  content: e['content'],
                  isChecked: e['isChecked'] ?? false,
                ),
              )
              .toList() ??
          [],
      reminders:
          (map['reminders'] as List<dynamic>?)
              ?.map(
                (e) => ReminderEntity(
                  id: e['id'],
                  time: DateTime.parse(e['time']),
                  repeatType: ReminderRepeatType.values[e['repeatType']],
                ),
              )
              .toList() ??
          [],
      subtasks:
          (map['subtasks'] as List<dynamic>?)
              ?.map(
                (e) => SubtaskEntity(
                  id: e['id'],
                  title: e['title'],
                  isCompleted: e['isCompleted'],
                  assigneeIds: e['assigneeIds'] != null
                      ? List<String>.from(e['assigneeIds'])
                      : null,
                  deadline: e['deadline'] != null
                      ? DateTime.tryParse(e['deadline'])
                      : null,
                ),
              )
              .toList() ??
          [],
      commentsCount: map['commentsCount'],
      attachmentsCount: map['attachmentsCount'],
      createdBy: map['createdBy'],
      createdAt: map['createdAt'] != null
          ? DateTime.tryParse(map['createdAt'])
          : null,
      updatedBy: map['updatedBy'],
      updatedAt: map['updatedAt'] != null
          ? DateTime.tryParse(map['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'projectId': projectId,
    'spaceId': spaceId,
    'assigneeIds': assigneeIds,
    'status': taskStatus.index,
    'deadline': deadline?.toIso8601String(),
    'priority': priority.index,
    'comments': comments
        .map(
          (e) => {
            'id': e.id,
            'userId': e.userId,
            'content': e.content,
            'createdAt': e.createdAt.toIso8601String(),
            if (e.updatedAt != null)
              'updatedAt': e.updatedAt!.toIso8601String(),
          },
        )
        .toList(),
    'checklist': checklist
        .map(
          (e) => {'id': e.id, 'content': e.content, 'isChecked': e.isChecked},
        )
        .toList(),
    'reminders': reminders
        .map(
          (e) => {
            'id': e.id,
            'time': e.time.toIso8601String(),
            'repeatType': e.repeatType.index,
          },
        )
        .toList(),
    'labelIds': labels,
    'tagIds': tags,
    'subtasks': subtasks
        .map(
          (e) => {
            'id': e.id,
            'title': e.title,
            'isCompleted': e.isCompleted,
            'assigneeIds': e.assigneeIds,
            'deadline': e.deadline?.toIso8601String(),
          },
        )
        .toList(),
    'commentsCount': commentsCount,
    'attachmentsCount': attachmentsCount,
    'createdBy': createdBy,
    'createdAt': createdAt?.toIso8601String(),
    'updatedBy': updatedBy,
    'updatedAt': updatedAt?.toIso8601String(),
  };

  factory TaskDetailModel.fromJson(String source) =>
      TaskDetailModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory TaskDetailModel.fromEntity(TaskDetailEntity entity) {
    return TaskDetailModel(
      id: entity.id,
      title: entity.title,
      projectId: entity.projectId,
      spaceId: entity.spaceId,
      assigneeIds: entity.assigneeIds,
      taskStatus: entity.taskStatus,
      deadline: entity.deadline,
      priority: entity.priority,
      comments: entity.comments,
      checklist: entity.checklist,
      reminders: entity.reminders,
      subtasks: entity.subtasks,
      commentsCount: entity.commentsCount,
      attachmentsCount: entity.attachmentsCount,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
      updatedBy: entity.updatedBy,
      updatedAt: entity.updatedAt,
    );
  }

  TaskDetailEntity toEntity() {
    return TaskDetailEntity(
      id: id,
      title: title,
      projectId: projectId,
      spaceId: spaceId,
      assigneeIds: assigneeIds,
      taskStatus: taskStatus,
      deadline: deadline,
      priority: priority,
      comments: comments,
      checklist: checklist,
      reminders: reminders,
      labels: labels,
      tags: tags,
      subtasks: subtasks,
      commentsCount: commentsCount,
      attachmentsCount: attachmentsCount,
      createdBy: createdBy,
      createdAt: createdAt,
      updatedBy: updatedBy,
      updatedAt: updatedAt,
    );
  }
}
