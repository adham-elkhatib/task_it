import '../base_task_params.dart';

class TaskLabelParams extends BaseTaskParams {
  final String label;

  const TaskLabelParams({required super.taskId, required this.label});
}
