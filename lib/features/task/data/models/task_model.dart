import 'dart:convert';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    super.title,
    super.projectId,
    super.actionItemsIds,
    super.assigneeIds,
    super.taskStatus,
    super.deadline,
    super.priority,
    super.isCompleted,
    super.commentsCount,
    super.attachmentsCount,
    super.subtasks,
    super.createdBy,
    super.createdAt,
    super.updatedBy,
    super.updatedAt,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'],
      projectId: map['projectId'],
      actionItemsIds: List<String>.from(map['actionItemsIds'] ?? []),
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
      isCompleted: map['isCompleted'] == true,
      commentsCount: map['commentsCount'],
      attachmentsCount: map['attachmentsCount'],
      subtasks: (map['subtasks'] as List<dynamic>?)
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
          .toList(),
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
    'actionItemsIds': actionItemsIds,
    'assigneeIds': assigneeIds,
    'status': taskStatus?.index,
    'deadline': deadline?.toIso8601String(),
    'priority': priority?.index,
    'isCompleted': isCompleted,
    'commentsCount': commentsCount,
    'attachmentsCount': attachmentsCount,
    'subtasks': subtasks
        ?.map(
          (e) => {
            'id': e.id,
            'title': e.title,
            'isCompleted': e.isCompleted,
            'assigneeIds': e.assigneeIds,
            'deadline': e.deadline?.toIso8601String(),
          },
        )
        .toList(),
    'createdBy': createdBy,
    'createdAt': createdAt?.toIso8601String(),
    'updatedBy': updatedBy,
    'updatedAt': updatedAt?.toIso8601String(),
  };

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      projectId: entity.projectId,
      actionItemsIds: entity.actionItemsIds,
      assigneeIds: entity.assigneeIds,
      taskStatus: entity.taskStatus,
      deadline: entity.deadline,
      priority: entity.priority,
      isCompleted: entity.isCompleted,
      commentsCount: entity.commentsCount,
      attachmentsCount: entity.attachmentsCount,
      subtasks: entity.subtasks,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
      updatedBy: entity.updatedBy,
      updatedAt: entity.updatedAt,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      projectId: projectId,
      actionItemsIds: actionItemsIds,
      assigneeIds: assigneeIds,
      taskStatus: taskStatus,
      deadline: deadline,
      priority: priority,
      isCompleted: isCompleted,
      commentsCount: commentsCount,
      attachmentsCount: attachmentsCount,
      subtasks: subtasks,
      createdBy: createdBy,
      createdAt: createdAt,
      updatedBy: updatedBy,
      updatedAt: updatedAt,
    );
  }
}
