import '../base_task_params.dart';

class TaskAssigneeParams extends BaseTaskParams {
  final String userId;

  const TaskAssigneeParams({required super.taskId, required this.userId});
}
