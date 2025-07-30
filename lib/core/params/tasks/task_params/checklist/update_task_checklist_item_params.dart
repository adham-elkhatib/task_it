import '../../base_task_params.dart';

class UpdateTaskChecklistItemParams extends BaseTaskParams {
  final String content;
  final String checklistItemId;

  const UpdateTaskChecklistItemParams({
    required super.taskId,
    required super.spaceId,

    required this.content,
    required this.checklistItemId,
  });
}
