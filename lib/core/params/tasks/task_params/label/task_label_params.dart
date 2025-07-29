import '../../base_task_params.dart';

class TaskLabelParams extends BaseTaskParams {
  final String label;
  final String colorHex;

  const TaskLabelParams({
    required super.taskId,
    required this.label,
    required this.colorHex,
  });
}
