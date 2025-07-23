class CreateTaskParams {
  final String title;
  final String? projectId;
  final String? assigneeId;
  final DateTime? deadline;
  final int priorityIndex;

  const CreateTaskParams({
    required this.title,
    required this.projectId,
    required this.assigneeId,
    required this.deadline,
    required this.priorityIndex,
  });
}
