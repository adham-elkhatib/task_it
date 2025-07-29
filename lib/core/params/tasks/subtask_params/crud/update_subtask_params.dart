import '../../base_subtask_params.dart';

class UpdateSubtaskParams extends BaseSubtaskParams {
  final String title;
  final String? projectId;
  final List<String>? assigneeId;
  final DateTime? deadline;
  final int? taskStatus;
  final int? priority;

  const UpdateSubtaskParams({
    required super.parentTaskId,
    required super.subtaskId,
    required this.title,
    required this.projectId,
    required this.assigneeId,
    required this.deadline,
    this.taskStatus,
    this.priority,
  });
}
