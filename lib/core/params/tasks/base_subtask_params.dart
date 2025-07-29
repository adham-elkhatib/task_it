abstract class BaseSubtaskParams {
  final String parentTaskId;
  final String subtaskId;

  const BaseSubtaskParams({
    required this.parentTaskId,
    required this.subtaskId,
  });
}
