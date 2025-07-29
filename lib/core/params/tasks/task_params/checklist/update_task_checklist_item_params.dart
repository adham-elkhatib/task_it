import '../../base_task_params.dart';

class UpdateTaskChecklistItemParams extends BaseTaskParams {
  final String content;
  final String checklistItemId;

  const UpdateTaskChecklistItemParams({
    required super.taskId,
    required this.content,
    required this.checklistItemId,
  });
}
