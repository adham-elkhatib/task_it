import '../../base_task_params.dart';

class TaskChecklistParams extends BaseTaskParams {
  final List<String> items;

  const TaskChecklistParams({required super.taskId, required this.items});
}
