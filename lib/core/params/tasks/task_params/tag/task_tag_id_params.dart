import '../../base_task_params.dart';

class TaskTagIdParams extends BaseTaskParams {
  final String id;

  const TaskTagIdParams({
    required super.taskId,
    required super.spaceId,
    required this.id,
  });
}
