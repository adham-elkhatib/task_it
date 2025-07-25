import '../../base_task_params.dart';

class TaskTagParams extends BaseTaskParams {
  final String tag;

  const TaskTagParams({required super.taskId, required this.tag});
}
