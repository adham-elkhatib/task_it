class CreateSubtaskParams {
  final String parentTaskId;
  final String title;
  final String? projectId;
  final List<String>? assigneeId;
  final DateTime? deadline;
  final int? taskStatus;
  final int? priority;

  const CreateSubtaskParams({
    required this.parentTaskId,
    required this.title,
    required this.projectId,
    required this.assigneeId,
    required this.deadline,
    this.taskStatus,
    this.priority,
  });
}
