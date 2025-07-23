import '../base_task_params.dart';

class UpdateTaskParams extends BaseTaskParams {
  final String? title;
  final String? assigneeId;
  final DateTime? deadline;
  final int? priorityIndex;

  const UpdateTaskParams({
    required super.taskId,
    this.title,
    this.assigneeId,
    this.deadline,
    this.priorityIndex,
  });
}
