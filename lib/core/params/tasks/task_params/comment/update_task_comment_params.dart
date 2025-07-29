import '../../base_task_params.dart';

class UpdateTaskCommentParams extends BaseTaskParams {
  final String content;
  final String commentId;

  const UpdateTaskCommentParams({
    required super.taskId,
    required this.content,
    required this.commentId,
  });
}
