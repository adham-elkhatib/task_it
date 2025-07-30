import '../../base_task_params.dart';

class UpdateTaskCommentParams extends BaseTaskParams {
  final String content;
  final String commentId;

  const UpdateTaskCommentParams({
    required super.taskId,
    required super.spaceId,

    required this.content,
    required this.commentId,
  });
}
