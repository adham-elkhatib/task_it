import '../../base_task_params.dart';

class CreateTaskChecklistItemParams extends BaseTaskParams {
  final String content;

  const CreateTaskChecklistItemParams({required super.taskId, required this.content});
}
