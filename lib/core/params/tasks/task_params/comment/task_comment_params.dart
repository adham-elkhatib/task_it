import '../../base_task_params.dart';

class CreateTaskCommentParams extends BaseTaskParams {
  final String content;

  const CreateTaskCommentParams({required super.taskId, required this.content});
}
