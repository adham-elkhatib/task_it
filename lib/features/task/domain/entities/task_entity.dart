import 'package:equatable/equatable.dart';

import '../../../project/domain/entities/priority_enum.dart';
import '../../../project/domain/entities/status_enum.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String? projectName;
  final List<String?>? actionItemsIds;
  final String? projectId;
  final String? assigneeId;
  final String? assigneeName;
  final String? assigneePictureUrl;
  final TaskStatus? status;
  final DateTime? deadline;
  final Priority? priority;

  const TaskEntity({
    required this.id,
    required this.title,
    this.projectName,
    this.actionItemsIds,
    this.projectId,
    this.assigneeId,
    this.assigneeName,
    this.assigneePictureUrl,
    this.status,
    this.deadline,
    this.priority,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    String? projectName,
    List<String?>? actionItemsIds,
    String? projectId,
    String? assigneeId,
    String? assigneeName,
    String? assigneePictureUrl,
    TaskStatus? status,
    DateTime? deadline,
    Priority? priority,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      projectName: projectName ?? this.projectName,
      actionItemsIds: actionItemsIds ?? this.actionItemsIds,
      projectId: projectId ?? this.projectId,
      assigneeId: assigneeId ?? this.assigneeId,
      assigneeName: assigneeName ?? this.assigneeName,
      assigneePictureUrl: assigneePictureUrl ?? this.assigneePictureUrl,
      status: status ?? this.status,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
    );
  }

  @override
  List<Object?> get props =>
      [
        id,
        title,
        projectName,
        actionItemsIds,
        projectId,
        assigneeId,
        assigneeName,
        assigneePictureUrl,
        status,
        deadline,
        priority,
      ];
}
