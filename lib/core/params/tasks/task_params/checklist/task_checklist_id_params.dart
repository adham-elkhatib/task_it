import '../../base_task_params.dart';

class TaskChecklistIdParams extends BaseTaskParams {
  final String checklistId;

  const TaskChecklistIdParams({
    required super.taskId,
    required this.checklistId,
  });
}
