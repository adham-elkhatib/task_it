import '../base_task_params.dart';

class TaskCommentParams extends BaseTaskParams {
  final String content;

  const TaskCommentParams({required super.taskId, required this.content});
}
