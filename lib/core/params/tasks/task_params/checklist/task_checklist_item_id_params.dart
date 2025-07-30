import '../../base_task_params.dart';

class TaskChecklistItemIdParams extends BaseTaskParams {
  final String checklistItemId;

  const TaskChecklistItemIdParams({
    required super.taskId,
    required super.spaceId,

    required this.checklistItemId,
  });
}
