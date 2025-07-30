import '../../base_task_params.dart';

class TaskAssigneeParams extends BaseTaskParams {
  final String userId;

  const TaskAssigneeParams({
    required super.taskId,
    required super.spaceId,
    required this.userId,
  });
}
