import 'dart:convert';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';
import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.title,
    super.projectName,
    super.actionItemsIds,
    super.projectId,
    super.assigneeId,
    super.assigneeName,
    super.assigneePictureUrl,
    super.status,
    super.deadline,
    super.priority,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'],
      projectName: map["projectName"],
      status: map['status'] != null ? TaskStatus.values[map['status']] : null,
      deadline: map['deadline'] != null
          ? DateTime.parse(map['deadline'])
          : null,
      priority: map['priority'] != null
          ? Priority.values[map['priority']]
          : null,
      projectId: map['projectId'],
      assigneeId: map['assigneeId'],
      assigneeName: map['assigneeName'],
      assigneePictureUrl: map['assigneePictureUrl'],
      actionItemsIds: map['actionItemsIds'] != null
          ? List<String?>.from(map['actionItemsIds'] as List<dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'projectName': projectName,
      'status': status?.index,
      'deadline': deadline?.toIso8601String(),
      'priority': priority?.index,
      'projectId': projectId,
      'assigneeId': assigneeId,
      'assigneeName': assigneeName,
      'assigneePictureUrl': assigneePictureUrl,
      'actionItemsIds': actionItemsIds,
    };
  }

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      projectName: entity.projectName,
      actionItemsIds: entity.actionItemsIds,
      projectId: entity.projectId,
      assigneeId: entity.assigneeId,
      assigneeName: entity.assigneeName,
      assigneePictureUrl: entity.assigneePictureUrl,
      status: entity.status,
      deadline: entity.deadline,
      priority: entity.priority,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      projectName: projectName,
      actionItemsIds: actionItemsIds,
      projectId: projectId,
      assigneeId: assigneeId,
      assigneeName: assigneeName,
      assigneePictureUrl: assigneePictureUrl,
      status: status,
      deadline: deadline,
      priority: priority,
    );
  }
}
